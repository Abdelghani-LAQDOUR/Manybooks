import 'package:manybook/views/constants/constants.dart';
import 'package:manybook/views/widget_HomePage/SpecialCardBook.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecommendedHome extends StatefulWidget {
  @override
  _Recommended createState() => _Recommended();
}

class _Recommended extends State<RecommendedHome> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
          padding: EdgeInsets.symmetric(horizontal: sizewidth(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Recommended", style: styTitle),
              GestureDetector(
                child: Text(
                  "See More",
                  style: TextStyle(color: Color(0xFFBBBBBB)),
                ),
                onTap: () {},
              ),
            ],
          )),
      SizedBox(height: sizewidth(20)),
      SingleChildScrollView(
        padding: EdgeInsets.only(right: sizewidth(10)),
        scrollDirection: Axis.horizontal,
        child: StreamBuilder(
          // stream: Firestore.instance
          //     .collection("Books")
          //     .where('recommended', isEqualTo: "true")
          //     .snapshots,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.data!.docs.isEmpty) {
              return Center(
                child: new Text('No books found', style: stycateg),
              );
            }

            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                print(document["author"]);
                return SpecialCardBook(
                  name: document["title"],
                  imageUrl: document["picture"],
                );
              }).toList(),
            );
          },
        ),
      )
    ]);
  }
}
