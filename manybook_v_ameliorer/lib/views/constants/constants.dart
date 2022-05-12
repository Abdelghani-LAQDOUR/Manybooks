import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// ********************** Style Constants ******************/
TextStyle stycateg = TextStyle(
    fontFamily: "PatrickHand-Regular",
    fontSize: sizewidth(14),
    fontWeight: FontWeight.w300,
    letterSpacing: 0.5,
    color: Colors.black54);

TextStyle stynext = TextStyle(
    fontFamily: "Baloo2-Regular",
    fontSize: sizewidth(15),
    fontWeight: FontWeight.w600,
    letterSpacing: 1,
    color: Colors.black54);

TextStyle styTitle = TextStyle(
    fontFamily: "PatrickHand-Regular",
    fontSize: sizewidth(18),
    fontWeight: FontWeight.w600,
    letterSpacing: 2,
    color: Colors.black87);

TextStyle styTitleApp = TextStyle(
    fontFamily: "PatrickHand-Regular",
    fontSize: sizewidth(20),
    fontWeight: FontWeight.bold,
    letterSpacing: 2,
    color: Colors.indigo[700]);

/// ********************** Size Configuration ******************/
class SizeConfig {
  static MediaQueryData mediaQuery = const MediaQueryData();
  static double height = 0.0;
  static double width = 0.0;

  void init(BuildContext context) {
    mediaQuery = MediaQuery.of(context);
    width = mediaQuery.size.width;
    height = mediaQuery.size.height;
  }
}

double sizewidth(double inputSize) {
  return (inputSize / 375.0) * SizeConfig.width;
}

double sizeheight(double inputSize) {
  return (inputSize / 812.0) * SizeConfig.height;
}
