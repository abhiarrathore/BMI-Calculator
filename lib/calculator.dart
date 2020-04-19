import 'dart:math';

class CalculatorBrain{
  final int weight;
  final int height;
  double _bmi;

  CalculatorBrain({this.weight, this.height}){
    _bmi = weight/pow(height/100, 2);
  }

  double getBMI(){
    return _bmi;
  }

  String getResult(){
    if(_bmi > 25)
      return 'Overweight';
    else if(_bmi > 18.5)
      return 'Normal';
    else
      return 'Underweight';
  }

  String getInterpretation(){
    if(_bmi > 25)
      return 'You have higher weight than normal person. Try to exercise';
    else if(_bmi > 18.5)
      return 'You have normal weight. Keep it up';
    else
      return 'Your weight is less than normal person. Eat more. Take more protein and carbs';

  }
}