import 'package:flutter/material.dart';

import '../pages/const.dart';

class ResultMessage extends StatelessWidget {
  final String message;
  final VoidCallback onTap;

  final icon;
  const ResultMessage(
      {Key? key,
      required this.message,
      required this.onTap,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.deepPurple,
      content: Container(
        height: 200,
        color: Colors.deepPurple,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Text(
            message,
            style: whiteTextStyle,
          ),
          GestureDetector(
            onTap: onTap,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.deepPurple[300],
                  borderRadius: BorderRadius.circular(8)),
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
          )
        ]),
      ),
    );
  }
}
