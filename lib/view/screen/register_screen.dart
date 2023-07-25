import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scholar_chat/core/constant/color.dart';
import 'package:scholar_chat/controller/register_controller.dart';

import '../../app_routes.dart';
import '../widget/default_button.dart';
import '../widget/default_tff.dart';


class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  final RegisterController controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Center(
        child: SingleChildScrollView(
          physics:  const BouncingScrollPhysics(),
          child: Container(
            height: Get.height,
            padding: EdgeInsets.only(
              top: Get.height*.13,
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
                      width: 100,
                      height: 100,
                    )),
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
                      "Register",
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
                        onChange: (value) => controller.name = value,
                        hintText: 'Name'),
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
                    GetBuilder<RegisterController>(
                      builder: (controller) => defaultTFF(
                        suffixIcon: Icon(
                          controller.isPasswordHide
                              ?Icons.visibility_off
                              : Icons.remove_red_eye_outlined,
                        ),
                        suffixIconOnPressed: () {
                          controller.hidePassword();
                        },
                        obscureText: controller.isPasswordHide,
                        controller: controller.password,
                        hintText: 'Password',
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    GetBuilder<RegisterController>(
                        builder: (controller) => controller.isLoading
                            ? const Center(child: CircularProgressIndicator())
                            : defaultButton(
                                title: 'Register',
                                onPressed: () {
                                  controller.register();
                                },
                                textColor: AppColor.whiteColor,
                                buttonColor: AppColor.primaryColor,
                              )),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "already Have an Account ?",
                          style: TextStyle(color: AppColor.primaryColor),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.offNamed(AppRoutes.loginScreen);
                          },
                          child: const Text(
                            'Login',
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
