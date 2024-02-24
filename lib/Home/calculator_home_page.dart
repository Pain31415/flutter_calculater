import 'package:flutter/material.dart';
import 'package:flutter_calculater/button/calculator_button.dart';

// ignore: use_key_in_widget_constructors
class CalculatorHomePage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _CalculatorHomePageState createState() => _CalculatorHomePageState();
}

class _CalculatorHomePageState extends State<CalculatorHomePage> {
  String output = "0";
  // ignore: unused_field, prefer_final_fields
  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  buttonPressed(String buttonText) {
    // Логіка калькулятора
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator"),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Text(
                output,
                style: const TextStyle(
                  fontSize: 48.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              children: <Widget>[
                CalculatorButton(text: "7", callback: buttonPressed),
                CalculatorButton(text: "8", callback: buttonPressed),
                CalculatorButton(text: "9", callback: buttonPressed),
                CalculatorButton(text: "/", callback: buttonPressed),
              ],
            ),
            // Додайте інші рядки кнопок за потреби
          ],
        ),
      ),
    );
  }
}