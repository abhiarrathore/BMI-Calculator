import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final String text;
  final Function onTap;
  BottomButton({this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child : Container(
        color: Colors.pink,
        height: 60,
        margin: EdgeInsets.only(top: 5),
        child: Center(
          child: Text(this.text, style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),),
        ),
        width: double.infinity,
      ),
    );
  }
}