import 'package:flutter/material.dart';
import './style.dart';

class Row1 extends StatelessWidget {
  final IconData ico;
  final String txt;
  Row1(this.ico, this.txt);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          ico,
          size: 80,
          color: Colors.white,
        ),
        SizedBox(height: 15),
        Text(
          txt,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
