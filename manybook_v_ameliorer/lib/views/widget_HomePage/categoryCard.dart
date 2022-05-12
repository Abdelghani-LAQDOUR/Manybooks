import 'package:flutter/cupertino.dart';
import 'package:manybook/views/constants/constants.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  dynamic icon;
  String text;
  int index;

  CategoryCard({key, this.icon, required this.text, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SizedBox(
        width: sizewidth(67),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(sizewidth(15)),
              height: sizewidth(55),
              width: sizewidth(55),
              decoration: BoxDecoration(
                color: Colors.teal.shade50,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                icon,
                color: Colors.teal,
              ),
            ),
            SizedBox(height: 5),
            Text(
              text,
              textAlign: TextAlign.center,
              style: stycateg,
            )
          ],
        ),
      ),
      onTap: () {},
    );
  }
}
