import 'package:flutter/material.dart';

class ReusableWidget extends StatelessWidget {
  final Color col;
  final Widget? containerChild;
  //final Widget childContainer;
  ReusableWidget({required this.col, this.containerChild});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: col,
        borderRadius: BorderRadius.circular(10),
      ),
      child: containerChild,
    );
  }
}
