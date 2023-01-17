import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scholar_chat/core/constant/color.dart';

import '../../controller/forgot_password_controller.dart';
import '../widget/default_botton.dart';
import '../widget/default_tff.dart';


class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ForgotPasswordController  controller =Get.put(ForgotPasswordController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: const Text('Reset Password'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                defaultTFF(
                  controller: controller.email,
                  hintText: 'Enter Your Email',
                ),
                const SizedBox(height: 18,),
                defaultButton(
                    title: 'Send',
                    onPressed: (){
                      controller.resetPassword();
                    },
                    textColor: AppColor.whiteColor,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
