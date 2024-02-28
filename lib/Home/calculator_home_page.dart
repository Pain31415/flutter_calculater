import 'package:flutter/material.dart';
import 'package:flutter_calculater/button/calculator_button.dart';

class CalculatorHomePage extends StatefulWidget {
  const CalculatorHomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CalculatorHomePageState createState() => _CalculatorHomePageState();
}

class _CalculatorHomePageState extends State<CalculatorHomePage> {
  String output = "0";
  double num1 = 0;
  double num2 = 0;
  String operand = "";
  bool decimalAdded = false;

  buttonPressed(String buttonText) {
    if (buttonText == "C") {
      output = "0";
      num1 = 0;
      num2 = 0;
      operand = "";
      decimalAdded = false;
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "x" ||
        buttonText == "/") {
      num1 = double.parse(output);
      operand = buttonText;
      output = "0";
      decimalAdded = false;
    } else if (buttonText == "=") {
      num2 = double.parse(output);
      if (operand == "+") {
        output = (num1 + num2).toString();
      }
      if (operand == "-") {
        output = (num1 - num2).toString();
      }
      if (operand == "x") {
        output = (num1 * num2).toString();
      }
      if (operand == "/") {
        if (num2 != 0) {
          if ((num1 % num2) == 0) {
            output = (num1 ~/ num2).toString();
          } else {
            output = (num1 / num2).toStringAsFixed(1);
          }
        } else {
          output = "Error";
        }
      }
      num1 = double.parse(output);
      num2 = 0;
      operand = "";
      decimalAdded = false;
    } else if (buttonText == ".") {
      if (!decimalAdded) {
        output += buttonText;
        decimalAdded = true;
      }
    } else {
      if (output == "0" || output == "0.0") {
        output = buttonText;
      } else {
        output += buttonText;
      }
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator"),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/left.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
                child: Text(
                  output,
                  style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    CalculatorButton(text: "7", callback: buttonPressed, textColor: Colors.white),
                    CalculatorButton(text: "8", callback: buttonPressed, textColor: Colors.white),
                    CalculatorButton(text: "9", callback: buttonPressed, textColor: Colors.white),
                    CalculatorButton(text: "/", callback: buttonPressed, textColor: Colors.white),
                  ].map((button) => addOutline(button)).toList(),
                ),
                Row(
                  children: [
                    CalculatorButton(text: "4", callback: buttonPressed, textColor: Colors.white),
                    CalculatorButton(text: "5", callback: buttonPressed, textColor: Colors.white),
                    CalculatorButton(text: "6", callback: buttonPressed, textColor: Colors.white),
                    CalculatorButton(text: "x", callback: buttonPressed, textColor: Colors.white),
                  ].map((button) => addOutline(button)).toList(),
                ),
                Row(
                  children: [
                    CalculatorButton(text: "1", callback: buttonPressed, textColor: Colors.white),
                    CalculatorButton(text: "2", callback: buttonPressed, textColor: Colors.white),
                    CalculatorButton(text: "3", callback: buttonPressed, textColor: Colors.white),
                    CalculatorButton(text: "-", callback: buttonPressed, textColor: Colors.white),
                  ].map((button) => addOutline(button)).toList(),
                ),
                Row(
                  children: [
                    CalculatorButton(text: "0", callback: buttonPressed, textColor: Colors.white),
                    CalculatorButton(text: ".", callback: buttonPressed, textColor: Colors.white),
                    CalculatorButton(text: "C", callback: buttonPressed, textColor: Colors.white),
                    CalculatorButton(text: "+", callback: buttonPressed, textColor: Colors.white),
                  ].map((button) => addOutline(button)).toList(),
                ),
                Row(
                  children: [
                    CalculatorButton(text: "=", callback: buttonPressed, textColor: Colors.white),
                  ].map((button) => addOutline(button)).toList(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget addOutline(Widget button) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.red),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: button,
      ),
    );
  }
}