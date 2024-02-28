import 'package:flutter/material.dart';
import 'package:flutter_calculater/Home/calculator_home_page.dart';

void main() => runApp(CalculatorApp());

// ignore: use_key_in_widget_constructors
class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // ignore: prefer_const_constructors
      home: CalculatorHomePage(),
    );
  }
}