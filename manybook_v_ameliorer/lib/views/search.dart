import 'dart:core';
import 'package:manybook/views/constants/constants.dart';
import 'package:manybook/views/widget_HomePage/SpecialCardBook.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class SearchPage extends StatefulWidget {
  @override
  _searchPage createState() => _searchPage();
}

class _searchPage extends State<SearchPage> {
  static TextEditingController search = TextEditingController();

  /*--------- textfield search ---------*/
  Widget _searchText() {
    return Container(
      width: MediaQuery.of(context).size.width - 60,
      height: 43,
      // ignore: prefer_const_constructors
      padding: EdgeInsets.all(0),
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.centerRight,
              colors: [
                Colors.teal.shade50,
                Colors.green.shade100,
              ]),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
              bottomLeft: Radius.circular(32),
              bottomRight: Radius.circular(32))),
      child: TextFormField(
        controller: search,
        autocorrect: true,
        autofocus: false,
        maxLines: 1,
        // ignore: prefer_const_constructors
        style: TextStyle(
            color: Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.w400,
            fontFamily: 'Baloo2-Regular'),
        cursorWidth: 2.0,
        cursorColor: Colors.teal.shade500,
        toolbarOptions:
            // ignore: prefer_const_constructors
            ToolbarOptions(copy: true, cut: true, selectAll: true, paste: true),
        decoration: InputDecoration(
            hintText: 'Rechercher',
            contentPadding: const EdgeInsets.only(top: 6, left: 25),
            // ignore: prefer_const_constructors
            hintStyle: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
                fontSize: 16),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(32)),
            suffixIcon: GestureDetector(
              child:
                  Icon(Icons.search, size: 30, color: Colors.teal.shade800),
            )),
        keyboardType: TextInputType.text,
        // onChanged: (value) {
        //   if (value == "") {
        //     if (semesterChoisir == "tout") {
        //       setState(() {
        //         urlact = "$url/display/${user.filiere}/Cours/all_activites";
        //       });
        //     } else {
        //       setState(() {
        //         urlact =
        //             "$url/display/${user.filiere}/Cours/depence_S/$semesterChoisir";
        //       });
        //     }
        //   } else {
        //     if (semesterChoisir == "tout") {
        //       setState(() {
        //         urlact = "$url/display/${user.filiere}/Cours/depence_T/$value";
        //       });
        //     } else {
        //       setState(() {
        //         urlact =
        //             "$url/display/${user.filiere}/Cours/depence_ST/$semesterChoisir/$value";
        //       });
        //     }
        //   }
        // },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_new
    var databaseReference  = FirebaseFirestore.instance;
    // ignore: unnecessary_new
    return new Scaffold(
      body: SafeArea(
          child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: sizewidth(10)),
            child: _searchText(),
          ),
          SizedBox(height: sizewidth(20)),
          Padding(
            padding: EdgeInsets.only(right: sizewidth(10)),
            child: StreamBuilder(
              stream:
                  databaseReference.collection("Books").snapshots,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const Text('Something went wrong');
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.data!.docs.isEmpty) {
                  return Center(
                    child: Text('No books found', style: stycateg),
                  );
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
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
          ),
        ],
      )),
    );
  }
}
