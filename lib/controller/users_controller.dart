import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../app_routes.dart';
import '../model/user_model.dart';

class UsersController extends GetxController {
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  List<UserModel> userList = [];

  FirebaseAuth auth = FirebaseAuth.instance;

  void goChatDetails(int index) {
    Get.toNamed(AppRoutes.chatDetailsScreen, arguments: userList[index]);
  }

  void goToSettings() {
    Get.toNamed(AppRoutes.settingsScreen);
  }

  void logout() {
    FirebaseAuth.instance.signOut();
    Get.offNamed(AppRoutes.loginScreen);
  }
}
