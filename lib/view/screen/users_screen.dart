import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:scholar_chat/core/constant/color.dart';
import '../../controller/users_controller.dart';
import '../../model/user_model.dart';
import '../widget/chat_item_widget.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UsersController controller = Get.put(UsersController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: const Text('Chats'),
        actions: [
          IconButton(
              onPressed: () {
                controller.goToSettings();
              },
              icon: const Icon(Icons.settings)),
          IconButton(
              onPressed: () {
                controller.logout();
              },
              icon: const Icon(Icons.logout)),
        ],
      ),
      body: Container(
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
          padding:  const EdgeInsets.symmetric(horizontal: 10,vertical: 14,),
          child: StreamBuilder(
            stream: controller.users.orderBy('date').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                controller.userList.clear();
                for (int i = 0; i < snapshot.data!.docs.length; i++) {
                  if (UserModel.fromJson(snapshot.data!.docs[i]).uID !=
                      controller.auth.currentUser!.uid) {
                    controller.userList
                        .add(UserModel.fromJson(snapshot.data!.docs[i]));
                  }
                }
                return ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        controller.goChatDetails(index);
                      },
                      child: StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('users')
                            .doc(controller.auth.currentUser!.uid)
                            .collection('chats')
                            .doc(controller.userList[index].uID)
                            .collection('messages')
                            .orderBy('dateTime', descending: true)
                            .snapshots(),
                        builder: (context, snapshots) {
                          try {
                            if (snapshots.hasData) {
                              return chatItem(
                                imageURL: controller.userList[index].imageURL,
                                name: controller.userList[index].name,
                                message: snapshots.data!.docs[0]['message'],
                                time: DateFormat.yMMMd().add_jm().format(
                                    snapshots.data!.docs[0]['dateTime']
                                        .toDate()),
                              );
                            } else {
                              return chatItem(imageURL: '', name: '');
                              // return const Center(child: CircularProgressIndicator());
                            }
                          } catch (e) {
                            return chatItem(
                                imageURL: controller.userList[index].imageURL,
                                name: controller.userList[index].name,
                                message: 'No Messages Yet');
                          }
                        },
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: controller.userList.length,
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
