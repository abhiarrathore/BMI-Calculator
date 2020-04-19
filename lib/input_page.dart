import 'package:bmi_calc/calculator.dart';

import './results.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './icon_widget.dart';
import './reusable_card.dart';
import './constants.dart';
import './bottomButton.dart';

enum Gender{
  male,
  female
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int sliderValue = 165;
  int weight = 50;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI calculator'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child:Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: selectedGender == Gender.male ? activeCardColor : inActiveCardColor,
                    child: MyIconWidget(txt: 'MALE',  myIcon: FontAwesomeIcons.mars),
                    onPress: (){
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: selectedGender == Gender.female ? activeCardColor : inActiveCardColor,
                    child: MyIconWidget(txt: 'FEMALE', myIcon: FontAwesomeIcons.venus),
                    onPress: (){
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: activeCardColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: <Widget>[
                        Text('HEIGHT', style: TextStyle(color: foregroundTextColor),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text('$sliderValue', style: boldTextStyle,),
                            Text('cms', style: foregroundTextStyle),
                          ],
                        ),
                        SliderTheme(
                          // data: SliderThemeData(thumbColor: Colors.pink, ),
                          data: SliderTheme.of(context).copyWith(
                            thumbColor: Colors.pink,
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: Colors.grey,
                            overlayColor: Color(0x29EB1555),
                            thumbShape: RoundSliderThumbShape(
                              enabledThumbRadius: 15
                            ),
                            overlayShape: RoundSliderOverlayShape(
                              overlayRadius : 30
                            ),
                          ),
                          child: Slider(
                            value: sliderValue.toDouble(),
                            min: 120,
                            max: 220,
                            // inactiveColor: Colors.grey,
                            onChanged: (newValue){
                              setState(() {
                                sliderValue = newValue.ceil();
                              });
                            },
                            // activeColor: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: activeCardColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('WEIGHT', style: foregroundTextStyle),
                        Text(weight.toString() , style: boldTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                              child: FloatingActionButton(
                                heroTag: 'btn1',
                                // focusColor: Colors.white,
                                backgroundColor: Color(0xFF4C4F5E),
                                child: Icon(FontAwesomeIcons.minus, color: Colors.grey,),
                                onPressed: (){
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                              child: FloatingActionButton(
                                heroTag: 'btn2',
                                backgroundColor: Color(0xFF4C4F5E),
                                child: Icon(FontAwesomeIcons.plus, color: Colors.grey,),
                                onPressed: (){
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  )
                ),
                Expanded(
                  child: ReusableCard(
                    colour: activeCardColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('AGE', style: foregroundTextStyle),
                        Text(age.toString() , style: boldTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                              child: FloatingActionButton(
                                heroTag: 'btn3',
                                backgroundColor: Color(0xFF4C4F5E),
                                child: Icon(FontAwesomeIcons.minus, color: Colors.grey,),
                                onPressed: (){
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                              child: FloatingActionButton(
                                heroTag: 'btn4',
                                backgroundColor: Color(0xFF4C4F5E),
                                child: Icon(FontAwesomeIcons.plus, color: Colors.grey,),
                                onPressed: (){
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  )
                ),
              ],
            ),
          ),
          BottomButton(
            text: 'CALCULATE',
            onTap: (){
              CalculatorBrain calculator = CalculatorBrain(weight: this.weight, height: this.sliderValue);
              Navigator.push(context, MaterialPageRoute(builder: (context) =>  Result(calculator: calculator)));
            },
          ),
        ],
      )
    );
  }
}

