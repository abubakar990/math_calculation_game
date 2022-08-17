// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:math_game/pages/const.dart';
import 'package:math_game/util/my_button.dart';

import 'package:math_game/util/my_card.dart';
import 'package:math_game/util/result_container.dart';
import 'package:math_game/util/result_message.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  int count = 0;
  int addLevel = addLevelCounter;
  int mulLevel = mulLevelCounter;
  int subLevel = subLevelCounter;
  int divLevel = divLevelCounter;


  List<String> numberPad = [
    '7',
    '8',
    '9',
    'C',
    '4',
    '5',
    '6',
    'DEL',
    '1',
    '2',
    '3',
    '=',
    '0'
  ];

  String sign = "";

  // number A,B
  var numberA = 1;
  var numberB = 1;
  // user answer

  String userAnswer = '';

  void buttonTapped(String button) {
    setState(() {
      if (button == '=') {
        checkResult();
      } else if (button == 'C') {
        userAnswer = '';
      } else if (button == 'DEL') {
        if (userAnswer.isNotEmpty) {
          userAnswer = userAnswer.substring(0, userAnswer.length - 1);
        }
      } else if (userAnswer.length < 3) {
        userAnswer += button;
      }
    });
  }

  void checkResult() {
    if (signSave == '+') {
      if (numberA + numberB == int.parse(userAnswer)) {
        count++;
        if (count < 5) {
          showDialog(
              context: context,
              builder: (context) {
                return ResultMessage(
                    message: 'Correct!',
                    onTap: goToNextQuestion,
                    icon: Icons.arrow_forward);
              });
        } else if (count == 5) {
          addLevel++;
          setState(() {
            addLevelCounter = addLevel;
          });
          
          
          showDialog(
              context: context,
              builder: (context) {
                return ResultMessage(
                    message: 'Level $addLevel Completed!',
                    onTap: goToNextQuestion,
                    icon: Icons.arrow_forward);
              });
          count = 0;
        }
      } else {
        showDialog(
            context: context,
            builder: (context) {
              return ResultMessage(
                  message: "Incorrect! Try Again",
                  onTap: goBackToQuestion,
                  icon: Icons.rotate_left);
            });
      }
    } else if (signSave == '-') {
      if (numberA - numberB == int.parse(userAnswer)) {
        count++;
        if (count < 5) {
          showDialog(
              context: context,
              builder: (context) {
                return ResultMessage(
                    message: 'Correct!',
                    onTap: goToNextQuestion,
                    icon: Icons.arrow_forward);
              });
        } else if (count == 5) {
          subLevel++;
         setState(() {
            subLevelCounter = subLevel;
          });
          showDialog(
              context: context,
              builder: (context) {
                return ResultMessage(
                    message: 'Level $subLevel Completed!',
                    onTap: goToNextQuestion,
                    icon: Icons.arrow_forward);
              });
          count = 0;
        }
      } else {
        showDialog(
            context: context,
            builder: (context) {
              return ResultMessage(
                  message: "Incorrect! Try Again",
                  onTap: goBackToQuestion,
                  icon: Icons.rotate_left);
            });
      }
    } else if (signSave == '*') {
      if (numberA * numberB == int.parse(userAnswer)) {
        count++;
        if (count < 5) {
          showDialog(
              context: context,
              builder: (context) {
                return ResultMessage(
                    message: 'Correct!',
                    onTap: goToNextQuestion,
                    icon: Icons.arrow_forward);
              });
        } else if (count == 5) {
          mulLevel++;
          setState(() {
            mulLevelCounter = mulLevel;
          });
          showDialog(
              context: context,
              builder: (context) {
                return ResultMessage(
                    message: 'Level $mulLevel Completed!',
                    onTap: goToNextQuestion,
                    icon: Icons.arrow_forward);
              });
          count = 0;
        }
      } else {
        showDialog(
            context: context,
            builder: (context) {
              return ResultMessage(
                  message: "Incorrect! Try Again",
                  onTap: goBackToQuestion,
                  icon: Icons.rotate_left);
            });
      }
    } else if (signSave == '/') {
      if (numberA / numberB == int.parse(userAnswer)) {
        count++;
        if (count < 5) {
          showDialog(
              context: context,
              builder: (context) {
                return ResultMessage(
                    message: 'Correct!',
                    onTap: goToNextQuestion,
                    icon: Icons.arrow_forward);
              });
        } else if (count == 5) {
          divLevel++;
          setState(() {
            divLevelCounter = divLevel;
          });
          showDialog(
              context: context,
              builder: (context) {
                return ResultMessage(
                    message: 'Level $divLevel Completed!',
                    onTap: goToNextQuestion,
                    icon: Icons.arrow_forward);
              });
          count = 0;
        }
      } else {
        showDialog(
            context: context,
            builder: (context) {
              return ResultMessage(
                  message: "Incorrect! Try Again",
                  onTap: goBackToQuestion,
                  icon: Icons.rotate_left);
            });
      }
    }
  }

  void goToNextQuestion() {
    Navigator.of(context).pop();
    //reset values
    setState(() {
      userAnswer = '';
    });
    numberA = Random().nextInt(10);
    numberB = Random().nextInt(10);
  }

  void goBackToQuestion() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    if (count == 1) {}
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.deepPurple[300],
        body: Column(
          children: [
            //level progress player needs 5 correct answer in a row to next level.
            Container(
              height: 100,
              color: Colors.deepPurple,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    (count >= 1 && count <= 5)
                        ? ResultContainer(boxDecor: resultContainerTrue)
                        : ResultContainer(boxDecor: resultContainerFalse),
                    (count >= 2 && count <= 5)
                        ? ResultContainer(boxDecor: resultContainerTrue)
                        : ResultContainer(boxDecor: resultContainerFalse),
                    (count >= 3 && count <= 5)
                        ? ResultContainer(boxDecor: resultContainerTrue)
                        : ResultContainer(boxDecor: resultContainerFalse),
                    (count >= 4 && count <= 5)
                        ? ResultContainer(boxDecor: resultContainerTrue)
                        : ResultContainer(boxDecor: resultContainerFalse),
                    (count == 5)
                        ? ResultContainer(boxDecor: resultContainerTrue)
                        : ResultContainer(boxDecor: resultContainerFalse),
                  ]),
            ),
            Expanded(
              child: Container(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        numberA.toString() +
                            signSave +
                            numberB.toString() +
                            ' = ',
                        style: whiteTextStyle,
                      ),
                      Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.deepPurple[400],
                        ),
                        child: Center(
                          child: Text(
                            userAnswer,
                            style: whiteTextStyle,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),

            Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: GridView.builder(
                      itemCount: numberPad.length,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4),
                      itemBuilder: (context, index) {
                        return MyButton(
                            child: numberPad[index],
                            onTap: () => buttonTapped(numberPad[index]));
                      }),
                )),

            //quwstions

            // number pad
          ],
        ),
      ),
    );
  }
}
