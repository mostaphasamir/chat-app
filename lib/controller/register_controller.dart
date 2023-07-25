import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:scholar_chat/app_routes.dart';

import '../model/user_model.dart';

class RegisterController extends GetxController {
  bool isPasswordHide = true;

  bool isLoading = false;

  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late String name;

  late TextEditingController email;

  late TextEditingController password;

  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  void hidePassword() {
    isPasswordHide = !isPasswordHide;
    update();
  }

  register() {
    isLoading = true;
    update();
    dynamic formData = formState.currentState;
    if (formData!.validate()) {
        FirebaseAuth auth = FirebaseAuth.instance;
        auth.createUserWithEmailAndPassword(email: email.text, password: password.text)
          .then((value){
            auth.currentUser!.sendEmailVerification();
        UserModel userModel =
            UserModel(name, email.text, auth.currentUser!.uid, '');
        users.doc(auth.currentUser!.uid).set(userModel.toMap());
        Get.defaultDialog(
          middleText: 'Check your Email to Verify',
          onConfirm: () => Get.offAllNamed(AppRoutes.loginScreen),
          barrierDismissible:false ,
        );
        isLoading = false;
      }).catchError((e) {
        isLoading = false;
        update();
        Get.snackbar('Error', e.toString());
      });
    }
  }
}
