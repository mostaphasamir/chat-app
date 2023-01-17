import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scholar_chat/app_routes.dart';
import 'package:scholar_chat/core/constant/color.dart';

import '../../controller/login_controller.dart';
import '../widget/default_botton.dart';
import '../widget/default_tff.dart';

class LoginScreen extends StatelessWidget {
  LoginControllerImp controller = Get.put(LoginControllerImp());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            height: Get.height,
            padding: EdgeInsets.only(
              top: Get.height*.15,
            ),
            decoration:  BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColor.primaryColor.withOpacity(.01),
                    AppColor.primaryColor.withOpacity(.04),
                  ],
                ),
              image: const DecorationImage(
                fit: BoxFit.contain,
                alignment: Alignment.bottomCenter,
                image: AssetImage('assets/images/wave.png'),
              )
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: controller.formState,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/images/chatlogo.png',
                        height: 100,
                        width: 100,
                      ),
                    ),
                    const Center(
                      child: Text(
                        "Chat Application",
                        style: TextStyle(
                          fontSize: 32,
                          color: AppColor.primaryColor,
                          fontFamily: "pacifico",
                        ),
                      ),
                    ),
                    const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 32,
                        color: AppColor.primaryColor,
                        fontFamily: "pacifico",
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    defaultTFF(
                      controller: controller.email,
                      hintText: 'Email',
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    GetBuilder<LoginControllerImp>(
                        builder: (controller) => defaultTFF(
                          hintText: 'password',
                          suffixIcon: Icon(controller.isPasswordHide?Icons.remove_red_eye_outlined:Icons.visibility_off),
                          suffixIconOnPressed:(){
                            controller.hidePassword();
                          },
                          obscureText: controller.isPasswordHide,
                          textColor: AppColor.blackColor,
                          controller: controller.password,
                        )),
                    const SizedBox(
                      height: 18,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                         GestureDetector(
                           onTap: () {
                             controller.goToResetPassword();
                           },
                             child: const Text('Forgot Password ?',style: TextStyle(
                           color: AppColor.primaryColor,
                           fontSize: 16,
                         ),)),
                      ],
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    GetBuilder<LoginControllerImp>(
                      builder: (controller) => controller.isLoading
                          ? const Center(
                              child: CircularProgressIndicator(),
                            ):defaultButton(
                        onPressed: ()
                            {
                              controller.login();
                            },
                        title: 'Login',
                        buttonColor: AppColor.primaryColor,
                        textColor: AppColor.whiteColor,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't Have an Account ?",
                          style: TextStyle(color: AppColor.primaryColor),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.offNamed(AppRoutes.registerScreen);
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(color: AppColor.grayBlueColor),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
