import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scholar_chat/app_routes.dart';
import 'package:scholar_chat/core/constant/color.dart';

abstract class LoginController extends GetxController
{
  login();
}

class LoginControllerImp extends LoginController
{
  bool isPasswordHide=true;
  bool isLoading = false ;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController email ;
  late TextEditingController password ;
  FirebaseAuth auth = FirebaseAuth.instance;
@override
  void onInit() {
    email=TextEditingController();
    password=TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  login() {
  isLoading=true;
  update();
    auth.signInWithEmailAndPassword(email: email.text, password: password.text)
        .then((value) {
          isLoading=false;
          if(value.user!.emailVerified)
            {
              Get.offNamed(AppRoutes.usersScreen);
            }
          else
            {
              Get.defaultDialog(
                title: 'Not Verified',
                backgroundColor: Colors.red,
                middleText: 'Please Go to Your email and Verified',
                textConfirm: 'OK',
                confirmTextColor: AppColor.primaryColor,
                onConfirm: () => Get.back(),
                buttonColor: AppColor.whiteColor,
              );
            }
          update();
        }).catchError(
            (e){
              isLoading=false;
              update();
              print(e.code);
               Get.snackbar('error', e.toString());
            });
  }

  goToResetPassword()
  {
    Get.toNamed(AppRoutes.forgotPasswordScreen);
  }

  void hidePassword()
  {
    isPasswordHide =! isPasswordHide;
    update();
  }
}