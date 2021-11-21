import 'dart:ui';

import 'package:calc_bmi/pages/result.dart';
import 'package:flutter/material.dart';
import 'pages/input_p.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          accentColor: Color(0xFFD1C647),
          primaryColor: Color(0xFFD1C647),
          scaffoldBackgroundColor: Colors.black,
          textTheme: TextTheme(
              bodyText2: TextStyle(color: Color(0xFFD1C647)),
              bodyText1: TextStyle(color: Color(0xFFD1C647)))),
      title: 'Material App',
      home: InputPage(),
      // initialRoute: "/",
      // routes: {
      //   "/": (context) => InputPage(),
      //   "resultado": (context) => ResultPage()
      // },
    );
  }
}
