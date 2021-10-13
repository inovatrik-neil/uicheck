import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
  final int? positionIndex, currentIndex;
  const Indicator({this.currentIndex, this.positionIndex});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4,
      width: 4,
      margin: EdgeInsets.all(2),
      decoration: BoxDecoration(
        border: Border.all(
          color: positionIndex == currentIndex
              ? Colors.white
              : Colors.grey,
        ),
        color: positionIndex == currentIndex
            ? Colors.white
            : Colors.grey,
        borderRadius: BorderRadius.circular(100),
      ),
    );
  }
}