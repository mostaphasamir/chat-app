import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:scholar_chat/core/constant/color.dart';

class ForgotPasswordController extends GetxController {
  TextEditingController email = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

  resetPassword() async {
    try {
      print(email.text.trim());
      auth.sendPasswordResetEmail(
        email: email.text,
      );
      Get.defaultDialog(
        title: 'Check Mail',
        middleText: 'Go To check Link send to your email',
        backgroundColor: Colors.green,
        titleStyle: const TextStyle(color: AppColor.whiteColor),
        middleTextStyle: const TextStyle(color: AppColor.whiteColor),
        textConfirm: 'Ok',
        buttonColor: AppColor.whiteColor,
        confirmTextColor: Colors.green,
        onConfirm: () => Get.back(),
      );
    } catch (e) {
      Get.defaultDialog(
        title: 'Error',
        backgroundColor: Colors.red,
        middleText: e.toString(),
      );
    }
  }
}
