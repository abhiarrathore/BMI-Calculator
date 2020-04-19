import 'package:bmi_calc/bottomButton.dart';
import 'package:bmi_calc/calculator.dart';
import 'package:bmi_calc/constants.dart';
import 'package:bmi_calc/reusable_card.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final CalculatorBrain calculator;

  Result({this.calculator});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('BMI calculator'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(12, 20, 0, 0),
              child: Text(
                'Your Result', 
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                  fontSize: 33
                ),
                // textAlign: TextAlign.center,
              )
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10),
                  child: ReusableCard(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(calculator.getResult().toUpperCase(), style: TextStyle(fontSize: 20, color: Colors.greenAccent),),
                        Text(calculator.getBMI().toStringAsFixed(1), style: TextStyle(fontSize: 90, fontWeight: FontWeight.w800,),),
                        Text(calculator.getInterpretation(), textAlign: TextAlign.center,)
                      ],
                    ),
                  colour: activeCardColor,
                ),
              ),
            ),
            BottomButton(
              text :'RECALCULATE',
              onTap: (){
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}