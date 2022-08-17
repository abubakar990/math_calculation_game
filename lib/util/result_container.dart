import 'package:flutter/material.dart';
import 'package:math_game/pages/const.dart';

class ResultContainer extends StatelessWidget {
  var boxDecor;

  ResultContainer({Key? key, required this.boxDecor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      decoration: boxDecor,
    );
  }
}
