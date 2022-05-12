import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'constants/constants.dart';
import 'widget_HomePage/BodyHome.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // SizeConfig().init(context); //provisoir
    return Scaffold(
      body: BodyHome(),
    );
  }
}
