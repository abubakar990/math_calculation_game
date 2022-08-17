import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_game/pages/const.dart';
import 'package:math_game/util/my_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.deepPurple,
        //appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                  color: Colors.deepPurple[400],
                  borderRadius: BorderRadius.circular(12)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // SizedBox(width: 0),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text('Hey Abu Bakar,',
                            style: GoogleFonts.lato(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic)),
                        Text('Good Morning',
                            style: GoogleFonts.lato(
                                color: Colors.white,
                                fontSize: 30,
                                fontStyle: FontStyle.normal)),
                        Text('Start your practice by picking one of the below.',
                            style: GoogleFonts.lato(
                              color: Colors.white,
                              fontSize: 14,
                            )),
                      ],
                    ),
                  ),
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/images/avatar.png'),
                    radius: 40,
                  )
                ],
              ),
            ),
            SizedBox(height: 15),
            MyCard(
                methodImagePath: 'assets/images/add.png',
                methodName: 'Addition',
                intValue1: Random().nextInt(10),
                intValue2: Random().nextInt(10),
                //total: 28,
                level: addLevelCounter,
                color: Colors.lightGreen,
                sign: '+'),
            MyCard(
                methodImagePath: 'assets/images/minus.png',
                methodName: 'Subtraction',
                intValue1: Random().nextInt(10),
                intValue2: Random().nextInt(10),
                // total: 25,
                level: subLevelCounter,
                color: Colors.redAccent,
                sign: '-'),
            MyCard(
                methodImagePath: 'assets/images/multiply.png',
                methodName: 'Multiplication',
                intValue1: Random().nextInt(10),
                intValue2: Random().nextInt(10),
                //total: 50,
                level: mulLevelCounter,
                color: Colors.orange,
                sign: '*'),
            MyCard(
                methodImagePath: 'assets/images/division.png',
                methodName: 'Division',
                intValue1: 5 + Random().nextInt(10),
                intValue2: Random().nextInt(10),
                //total: 10,
                level: divLevelCounter,
                color: Colors.blue,
                sign: '/'),
          ]),
        ),
      ),
    );
  }
}
