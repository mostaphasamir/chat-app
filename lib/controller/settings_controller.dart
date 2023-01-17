import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:scholar_chat/model/user_model.dart';

class SettingsController extends GetxController
{

  String? name;

  FirebaseAuth auth = FirebaseAuth.instance;

  GlobalKey<FormState> globalKey = GlobalKey<FormState>();


  late File file  ;
   ImagePicker imagePicker = ImagePicker();
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  late final UserModel myData;


  uploadImage()async
  {

    var pickedImage =await imagePicker.pickImage(source: ImageSource.gallery);
    if(pickedImage!=null)
      {
        file = File(pickedImage.path);
        final path ='file/${pickedImage.name}';
        final ref = FirebaseStorage.instance.ref().child(path);
        final upload=ref.putFile(file);

        final snapshot=await upload.whenComplete((){});
        final urlImage= await snapshot.ref.getDownloadURL();
        users.doc(auth.currentUser!.uid).update({
          'image':urlImage,
        });
        update();
      }
  }


  updateValues()async
  {
    await users.doc('M19Xttrw2Xg9chssWJA9WDtqoq73').update({
      'name':name,
    }).then((value) =>Get.snackbar('Success', 'Update Name Successfully',backgroundColor: CupertinoColors.activeGreen,colorText: CupertinoColors.white),).catchError((e)=>Get.snackbar('Error', 'Update Name Error $e'));
    update();
  }


}