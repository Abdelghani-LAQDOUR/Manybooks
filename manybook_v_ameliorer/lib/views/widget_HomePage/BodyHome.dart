import 'package:manybook/views/constants/constants.dart';
import 'package:manybook/views/widget_HomePage/CategoryHome.dart';
import 'package:manybook/views/widget_HomePage/EnglishHome.dart';
import 'package:manybook/views/widget_HomePage/FrenchHome.dart';
import 'package:manybook/views/widget_HomePage/PersonalHome.dart';
import 'package:manybook/views/widget_HomePage/Programmingome.dart';
import 'package:manybook/views/widget_HomePage/RecommendedHome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'HeaderHome.dart';
import 'PopulaireHome.dart';

class BodyHome extends StatefulWidget {
  @override
  _bodyHome createState() => _bodyHome();
}

class _bodyHome extends State<BodyHome> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: sizeheight(20)),
            HeaderHome(),
            SizedBox(height: sizewidth(10)),
            CategoryHome(),
            PopulaireHome(),
            SizedBox(height: sizewidth(30)),
            RecommendedHome(),
            SizedBox(height: sizewidth(30)),
            ProgrammingHome(),
            SizedBox(height: sizewidth(30)),
            EnglishHome(),
            SizedBox(height: sizewidth(30)),
            FrenchHome(),
            SizedBox(height: sizewidth(30)),
            PersonalHome(),
            SizedBox(height: sizewidth(30)),
          ],
        ),
      ),
    );
  }
}
