import 'package:manybook/views/constants/constants.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// var url;

class HeaderHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sizewidth(20)),
      child: Container(
        padding: EdgeInsets.all(sizewidth(5)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
          color: Colors.white70,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 20,
                offset: Offset(0, 13))
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
                borderRadius: BorderRadius.circular(100),
                child: Stack(
                  overflow: Overflow.visible,
                  children: [
                    Container(
                      padding: EdgeInsets.all(sizewidth(12)),
                      height: sizewidth(46),
                      width: sizewidth(46),
                      decoration: BoxDecoration(
                        color: Color(0xFF979797).withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.search,
                        color: Colors.indigo.shade400,
                      ),
                    ),
                  ],
                ),
                onTap: () async {
                  Navigator.pushNamed(context, "/search");
                  //   var ref = await FirebaseStorage.instance
                  //       .ref()
                  //       .child("books pictures/book_3.jpg")
                  //       .getDownloadURL();

                  //   url = ref;
                  //   print(ref);
                  //   Navigator.pushNamed(context, "/search");

                  //   print("heloooooooooo => ${ref.toString()}");
                }),
            //title :
            Center(
              child: Text(
                "Manybooks",
                style: styTitleApp,
              ),
            ),

            //like books icon:
            InkWell(
              borderRadius: BorderRadius.circular(100),
              child: Stack(
                overflow: Overflow.visible,
                children: [
                  Container(
                    padding: EdgeInsets.all(sizewidth(12)),
                    height: sizewidth(46),
                    width: sizewidth(46),
                    decoration: BoxDecoration(
                      color: Color(0xFF979797).withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.favorite,
                      color: Colors.indigo.shade400,
                    ),
                  ),
                ],
              ),
              onTap: () => print("hello like Botton!"),
            )
          ],
        ),
      ),
    );
  }
}
