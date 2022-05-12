import 'package:manybook/views/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SpecialCardBook extends StatelessWidget {
  var imageUrl;
  String name;
  SpecialCardBook({key, this.imageUrl, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: sizewidth(10)),
      child: GestureDetector(
        child: Column(
          children: [
            SizedBox(
              width: sizewidth(112),
              height: sizewidth(141),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                // child: Image.asset(
                //   image,
                //   fit: BoxFit.fill,
                // ),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              width: sizewidth(116),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  //   horizontal: sizewidth(15.0),
                  vertical: sizewidth(10),
                ),
                child: Text(
                  name,
                  style: TextStyle(
                    fontFamily: "Baloo2-Regular",
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.ltr,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
        onTap: () => print("heyyyyy"),
      ),
    );
  }
}
