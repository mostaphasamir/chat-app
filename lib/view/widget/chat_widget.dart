import 'package:flutter/material.dart';
import 'package:scholar_chat/core/constant/color.dart';
import 'package:scholar_chat/model/messege_model.dart';

Widget chatWidget({
  required MessageModel message,
}) =>
    Align(
        alignment: Alignment.centerLeft,
        child: Container(
    padding: const EdgeInsets.all(20),margin: const EdgeInsets.all(12
)
,
decoration: const BoxDecoration
(
color: AppColor.primaryColor,borderRadius: BorderRadius.only(topLeft: Radius
    .circular(20
)
,
topRight: Radius.circular(20
)
,
bottomRight: Radius.circular(20
)
,
)
,
)
,
child: Text
(
message.message,style: const TextStyle
(
fontSize: 20
,
color: Colors.white),
)
,
)
,
);

Widget chatWidgetReceiver({
  required MessageModel message,
}) =>
    Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.all(12),
        decoration: const BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
        ),
        child: Text(
          message.message,
          style: const TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
