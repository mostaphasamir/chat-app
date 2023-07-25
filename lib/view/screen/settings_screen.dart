import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scholar_chat/core/constant/color.dart';
import 'package:scholar_chat/controller/settings_controller.dart';
import 'package:scholar_chat/model/user_model.dart';

import '../widget/default_button.dart';
import '../widget/default_tff.dart';

class SettingsScreen extends StatelessWidget {
  final SettingsController controller= Get.put(SettingsController());

   SettingsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: const Text(
          'Edit profile',
        ),
      ),
      body:Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColor.primaryColor.withOpacity(.1),
              AppColor.primaryColor.withOpacity(.2),
              AppColor.primaryColor.withOpacity(.3),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child:GetBuilder<SettingsController>(
                builder: (controller) => FutureBuilder(
                    future: controller.users.doc(controller.auth.currentUser!.uid).get(),
                    builder: (context, snapshot){
                      if(snapshot.hasData)
                      {
                        UserModel myData = UserModel.fromJson(snapshot.data!);
                        return Form(
                          key: controller.globalKey,
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                CircleAvatar(
                                  radius:50,
                                  backgroundImage: NetworkImage
                                    (
                                    myData.imageURL==''?'https://cdn2.iconfinder.com/data/icons/people-flat-design/64/Face-Profile-User-Man-Boy-Person-Avatar-512.png':myData.imageURL,
                                  ),
                                ),
                                Positioned(
                                  bottom: -5,
                                  right: -5,
                                  child: Container(
                                    width: 38,
                                    height: 38,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade400,
                                        shape: BoxShape.circle
                                    ),
                                    child: IconButton(
                                      onPressed: (){
                                        controller.uploadImage();
                                      },
                                      icon: const Icon(Icons.camera_alt),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 30,),
                            defaultTFF(
                              initValue: myData.name,
                              onChange: (value){
                                controller.name=value;
                              },
                              prefixIcon: const Icon(Icons.person),
                              label: const Text('Name'),

                            ),
                            const SizedBox(height: 20),
                            defaultButton(
                              buttonColor:AppColor.primaryColor,
                              title: 'Update',
                              onPressed: ()
                              {
                                controller.updateValues();
                              },
                              textColor: AppColor.whiteColor,
                            ),
                          ],
                        ),);
                      }
                      else
                      {
                        return const CircularProgressIndicator();
                      }
                    }
                ),
              ),
            ),
          ),
        ),
      ) ,
    );
  }
}
