import 'package:flutter/material.dart';

var whiteTextStyle = const TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 32,
  color: Colors.white,
);

var resultContainerTrue = BoxDecoration(
  color: Colors.deepPurple[700],
  borderRadius: BorderRadius.circular(12),
);

var resultContainerFalse = BoxDecoration(
    color: Colors.deepPurple[900], borderRadius: BorderRadius.circular(12));

var addLevelCounter = 1;
var mulLevelCounter = 1;
var subLevelCounter = 1;
var divLevelCounter = 1;
String signSave = '+';
