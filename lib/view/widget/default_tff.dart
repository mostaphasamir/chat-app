import 'package:flutter/material.dart';

import 'package:scholar_chat/core/constant/color.dart';

Widget defaultTFF({
  bool obscureText = false,
  String? initValue,
  String? hintText,
  Text? label,
  TextEditingController? controller,
  Color hintTextColor = AppColor.primaryColor,
  Icon? suffixIcon,
  Icon? prefixIcon,
  VoidCallback? suffixIconOnPressed,
  Function(String)? onChange,
  Color focusedColor = AppColor.primaryColor,
  Color enabledColor = AppColor.primaryColor,
  Color textColor = AppColor.blackColor,
}) =>
    TextFormField(
      onChanged: onChange,
      initialValue: initValue,
      controller: controller,
      obscureText: obscureText,
      style: TextStyle(
        color: textColor,
      ),
      decoration: InputDecoration(
        label: label,
        prefixIcon: prefixIcon,
        suffixIcon:suffixIcon==null? null :IconButton(
          onPressed: suffixIconOnPressed,
          icon: suffixIcon,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: focusedColor,
          ),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: hintTextColor,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: enabledColor,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
