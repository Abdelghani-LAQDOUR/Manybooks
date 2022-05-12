import 'package:manybook/views/constants/constants.dart';
import 'package:manybook/views/widget_HomePage/SpecialCardBook.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PersonalHome extends StatefulWidget {
  @override
  _Personal createState() => _Personal();
}

class _Personal extends State<PersonalHome> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
          padding: EdgeInsets.symmetric(horizontal: sizewidth(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Personal Development", style: styTitle),
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
          //     .where('personal', isEqualTo: "true")
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
