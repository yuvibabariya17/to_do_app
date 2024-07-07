import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Mybutton extends StatelessWidget {
  final String text;
  VoidCallback onpressed;
  Mybutton({super.key, required this.text, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onpressed,
      color: Colors.black,
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
