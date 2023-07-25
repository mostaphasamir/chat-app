import 'package:get/get.dart';
import 'package:scholar_chat/view/screen/chat_details_screen.dart';
import 'package:scholar_chat/view/screen/forgot_password_screen.dart';
import 'package:scholar_chat/view/screen/login_screen.dart';
import 'package:scholar_chat/view/screen/register_screen.dart';
import 'package:scholar_chat/view/screen/settings_screen.dart';
import 'package:scholar_chat/view/screen/splash_screen.dart';

import 'package:scholar_chat/view/screen/users_screen.dart';

import 'app_routes.dart';

List<GetPage<dynamic>>? routes =[
  GetPage(name: AppRoutes.splashScreen, page: ()=>  SplashScreen()),
  GetPage(name: AppRoutes.firstScreen, page: ()=>  LoginScreen(),transition: Transition.downToUp,transitionDuration: const Duration(milliseconds: 1500 )),
  GetPage(name: AppRoutes.loginScreen, page: ()=>  LoginScreen()),
  GetPage(name: AppRoutes.forgotPasswordScreen, page: ()=>  const ForgotPasswordScreen()),
  GetPage(name: AppRoutes.registerScreen, page: ()=>  RegisterScreen()),
  GetPage(name: AppRoutes.usersScreen, page: ()=>  const UsersScreen()),
  GetPage(name: AppRoutes.chatDetailsScreen, page: ()=>  const ChatDetailsScreen()),
  GetPage(name: AppRoutes.settingsScreen, page: ()=> SettingsScreen()),
];


