import 'package:manybook/views/constants/constants.dart';
import 'package:manybook/views/widget_SplashScreen/splashContent.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BodySplash extends StatefulWidget {
  @override
  _bodysplash createState() => _bodysplash();
}

class _bodysplash extends State<BodySplash> {
  var currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "image": "assets/images/splash_1.png",
      "text": "Welcome to manybooks, Let’s read!"
    },
    {
      "image": "assets/images/splash_2.png",
      "text": "We help students read lots \nof e-books for free"
    },
    {
      "image": "assets/images/splash_3.png",
      "text": "We offer books in various fields.\nJust stay with us"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return Provide();
      },
      child: SafeArea(
          child: SizedBox(
        width: double.infinity,
        // ignore: unnecessary_new
        child: new Column(
          children: [
            Expanded(
              flex: 5,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                  if (currentPage == 2) {
                    Provide().arrivedFin();
                  } else {
                    Provide().notarrivedFin();
                  }
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  image: splashData[index]["image"]!,
                  text: splashData[index]['text']!, key: const Key("null"),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: sizewidth(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    const Spacer(flex: 3),
                    Consumer<Provide>(
                        builder: (context, value,child) {
                      if (Provide.fin == true) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            GestureDetector(
                              child: const Text(
                                "next",
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontFamily: "PatrickHand-Regular",
                                    letterSpacing: 2.0,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20),
                              ),
                              onTap: () {
                                Navigator.of(context).pushNamed("/home");
                              },
                            )
                          ],
                        );
                      }
                      return Container(
                        width: SizeConfig.width,
                      );
                    }),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.only(right: 5),
      height: 7,
      width: 7,
      decoration: BoxDecoration(
        color: currentPage == index ? Colors.teal.shade400 : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

class Provide with ChangeNotifier {
  static bool fin = false;

  arrivedFin() {
    fin = true;
    notifyListeners();
  }

  notarrivedFin() {
    fin = false;
  }
}
