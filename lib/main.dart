// import 'package:bmi_calc/results.dart';
import 'package:flutter/material.dart';
import './input_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => InputPage(),
      //   '/result': (context) => Result(),
      // },
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF090C22),
        scaffoldBackgroundColor: Color(0xFF090C22),
      ),
      home: InputPage()
    );
    
    // return MaterialApp(
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //     primaryColor: Color(0xFF090C22),
    //     // accentColor: Color(0xFF090C22),
    //     scaffoldBackgroundColor: Color(0xFF090C22),
    //     textTheme: TextTheme(
    //       body1: TextStyle(color: Colors.white)
    //     ),
    //   ),
    //   home: InputPage()
    // );
  }
}
