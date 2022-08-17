// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_game/pages/const.dart';
import 'package:math_game/pages/game_page.dart';
import 'package:math_game/main.dart';

class MyCard extends StatefulWidget {
  final String methodImagePath;
  final String methodName;
  var intValue1;
  var intValue2;
  var total;
  final int? level;
  var color;
  String sign;
  //final String routeName = 'pages/game_page';

  MyCard(
      {Key? key,
      required this.methodImagePath,
      required this.methodName,
      this.intValue1,
      this.intValue2,
      this.total,
      this.level,
      this.color,
      required this.sign})
      : super(key: key);

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  var total;

  @override
  Widget build(BuildContext context) {
    print(signSave);

    if (widget.sign == '+') {
      total = widget.intValue1 + widget.intValue2;
    } else if (widget.sign == '-') {
      total = widget.intValue1 - widget.intValue2;
    } else if (widget.sign == '*') {
      total = widget.intValue1 * widget.intValue2;
    } else if (widget.sign == '/') {
      total = widget.intValue1 / widget.intValue2;
    }

    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/game_page');
          setState(() {
            signSave = widget.sign;
          });
        },
        child: Container(
          height: 140,
          decoration: BoxDecoration(
              color: widget.color, borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    widget.methodImagePath,
                    width: 100,
                    height: 100,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.methodName,
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          )),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.intValue1.toString() +
                                  widget.sign +
                                  widget.intValue2.toString() +
                                  ' = ' +
                                  widget.total.toString(),
                              style: GoogleFonts.lato(
                                  color: Colors.white, fontSize: 20),
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            Container(
                              height: 30,
                              width: 60,
                              decoration: BoxDecoration(
                                color: widget.color[700],
                                borderRadius: BorderRadius.circular(13),
                              ),
                              child: Center(
                                child: Text(
                                  'Level ' + widget.level.toString(),
                                  style: GoogleFonts.lato(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
