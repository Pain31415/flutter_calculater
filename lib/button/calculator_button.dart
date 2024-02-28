import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final Function(String) callback;
  final Color textColor;

  const CalculatorButton({
    Key? key,
    required this.text,
    required this.callback,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.red),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: TextButton(
          style: TextButton.styleFrom(
            foregroundColor: textColor, padding: const EdgeInsets.all(24.0),
          ),
          onPressed: () {
            callback(text);
          },
          child: Text(
            text,
            style: const TextStyle(fontSize: 20.0),
          ),
        ),
      ),
    );
  }
}