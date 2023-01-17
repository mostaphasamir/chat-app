import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scholar_chat/core/constant/color.dart';
import 'package:scholar_chat/model/messege_model.dart';

import '../../controller/chat_details_screen_controller.dart';
import '../widget/chat_widget.dart';

class ChatDetailsScreen extends StatelessWidget {
  const ChatDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundImage: NetworkImage(controller.senderUser.imageURL == ''
                  ? 'https://cdn2.iconfinder.com/data/icons/people-flat-design/64/Face-Profile-User-Man-Boy-Person-Avatar-512.png'
                  : controller.senderUser.imageURL),
            ),
            const SizedBox(
              width: 8,
            ),
            Flexible(
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  controller.senderUser.name,
                ),
              ),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                controller.logout();
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            width: Get.width,
              height: Get.height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image:NetworkImage(
                    'https://i.pinimg.com/564x/98/da/8f/98da8f9306de27424460d16e53938b72.jpg'
                  ),
                  fit: BoxFit.fill
                )
              ),
          ),
          StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('users')
                .doc(controller.auth.currentUser!.uid)
                .collection('chats')
                .doc(controller.senderUser.uID)
                .collection('messages')
                .orderBy('dateTime', descending: true)
                .snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                List<MessageModel> messagesList = [];
                for (int i = 0; i < snapshot.data!.docs.length; i++) {
                  messagesList.add(MessageModel.fromJson(snapshot.data!.docs[i]));
                }
                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        reverse: true,
                        controller: controller.controllerListView,
                        itemCount: messagesList.length,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) =>
                            messagesList[index].senderId ==
                                    controller.auth.currentUser!.uid
                                ? chatWidget(
                                    message: messagesList[index],
                                  )
                                : chatWidgetReceiver(message: messagesList[index]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextField(
                        onChanged: (value) {
                          controller.message = value;
                        },
                        controller: controller.textController,
                        decoration: InputDecoration(
                            hintText: 'Send message',
                            suffixIcon: IconButton(
                                icon: const Icon(Icons.send),
                                onPressed: () {
                                  controller.sendMessage();
                                }),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            )),
                      ),
                    ),
                  ],
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ],
      ),
    );
  }
}
