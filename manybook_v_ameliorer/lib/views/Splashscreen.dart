import 'package:manybook/views/constants/constants.dart';
import 'package:flutter/material.dart';
import 'widget_SplashScreen/BodySplash.dart';

class Splashscreen extends StatelessWidget {
  // static const routname = "/splash";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: BodySplash(),
    );
  }
}
