import 'package:flutter/material.dart';

Widget defaultButton({
  required String title,
  required VoidCallback onPressed,
  Color buttonColor = Colors.blue,
  Color textColor = Colors.black,
}) =>
    Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: buttonColor),
      child: TextButton(
          onPressed: onPressed,
          child: Text(
            title,
            style: TextStyle(
              color: textColor,
            ),
          )),
    );

