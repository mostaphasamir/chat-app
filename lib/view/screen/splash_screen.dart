import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scholar_chat/core/constant/color.dart';

import '../../controller/splash_controller.dart';

class SplashScreen extends StatelessWidget{
  SplashScreen({super.key});
 final SplashController controller =Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColor.primaryColor.withOpacity(.01),
              AppColor.primaryColor.withOpacity(.04),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/chatlogo.png',width: 80,height: 80,),
              const SizedBox(height: 5,),
              const Text('Chat App',style: TextStyle(
                fontSize: 30,
                color: AppColor.primaryColor,
                fontWeight: FontWeight.bold,
              ),),
            ],
          ),
        ),
      ),
    );
  }
}
