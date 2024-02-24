import 'package:flutter/material.dart';

class CalculatorButton extends StatefulWidget {
  final String text;
  final Function callback;

  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  CalculatorButton({required this.text, required this.callback});

  @override
  // ignore: library_private_types_in_public_api
  _CalculatorButtonState createState() => _CalculatorButtonState();
}

class _CalculatorButtonState extends State<CalculatorButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8.0),
        child: OutlineButton(
          padding: const EdgeInsets.all(24.0),
          onPressed: () {
            setState(() {
              _isPressed = !_isPressed;
            });
            widget.callback(widget.text);
          },
          child: Text(
            widget.text,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: _isPressed ? Colors.grey.shade300 : Colors.white,
            ),
          ),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
          ),
          highlightedBorderColor: Colors.grey.shade300,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
          ),
          splashColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade300,
        ),
      ),
    );
  }
  // ignore: non_constant_identifier_names
  OutlineButton({required EdgeInsets padding, required Null Function() onPressed, required Text child, required BorderSide borderSide, required Color highlightedBorderColor, required RoundedRectangleBorder shape, required Color splashColor, required Color highlightColor}) {}
}