import 'package:flutter/material.dart';
import 'package:bmi_calc/constants.dart';

class MyIconWidget extends StatelessWidget {
  final String txt;
  final IconData myIcon;

  MyIconWidget({this.txt, this.myIcon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          myIcon,
          size: 80,
        ),
        SizedBox(height: 10),
        Text(txt, style: foregroundTextStyle,)
      ],
    );
  }
}
