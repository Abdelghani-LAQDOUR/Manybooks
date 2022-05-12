import 'package:manybook/views/constants/constants.dart';
import 'package:manybook/views/widget_HomePage/categoryCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryHome extends StatelessWidget {
  List<Map<String, dynamic>> categories = [
    {"icon": Icons.psychology, "text": "personal"},
    {"icon": Icons.laptop, "text": "Programing"},
    {"icon": Icons.calculate_outlined, "text": "Math"},
    {"icon": Icons.translate, "text": "Language"},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(sizewidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          categories.length,
          (index) => CategoryCard(
              icon: categories[index]["icon"],
              text: categories[index]["text"],
              index: index),
        ),
      ),
    );
  }
}
