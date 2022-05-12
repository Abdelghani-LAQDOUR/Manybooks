import 'package:flutter/cupertino.dart';
import 'package:manybook/views/constants/constants.dart';

class SplashContent extends StatelessWidget {
  final String text;
  final String image;

  const SplashContent({
    required Key key,
    required this.text,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(),
        Image.asset(
          image,
          height: sizeheight(370),
          width: sizewidth(340),
        ),
        Spacer(),
        Text(text, textAlign: TextAlign.center, style: styTitle),
      ],
    );
  }
}
