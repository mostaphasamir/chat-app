import 'package:get/get.dart';
import 'package:scholar_chat/app_routes.dart';

class SplashController extends GetxController
{
  @override
  void onInit()async {
    await Future.delayed(const Duration(seconds: 2)).then((value) => Get.offAllNamed(AppRoutes.firstScreen));
    super.onInit();
  }
}