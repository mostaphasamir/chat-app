import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:scholar_chat/app_routes.dart';
import 'package:scholar_chat/model/messege_model.dart';
import 'package:scholar_chat/model/user_model.dart';
class HomeController extends GetxController
{
    TextEditingController textController = TextEditingController();
    late String message ;
    final controllerListView = ScrollController();
    UserModel senderUser=Get.arguments;

    FirebaseAuth auth = FirebaseAuth.instance;

    void sendMessage()
    {
        MessageModel messageModel=MessageModel(message, auth.currentUser!.uid, senderUser.uID);
        try{
            FirebaseFirestore.instance.collection('users').doc(auth.currentUser!.uid).collection('chats').doc(senderUser.uID).collection('messages').add(messageModel.toMap());
            FirebaseFirestore.instance.collection('users').doc(senderUser.uID).collection('chats').doc(auth.currentUser!.uid).collection('messages').add(messageModel.toMap());
            textController.clear();
            controllerListView.animateTo(0, duration: Duration(seconds: 1), curve: Curves.fastOutSlowIn);
        }catch(e){
            Get.snackbar('error', e.toString());
        }
    }

    void logout(){
        FirebaseAuth.instance.signOut();
        Get.offNamed(AppRoutes.loginScreen);
    }
}