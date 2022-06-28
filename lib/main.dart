import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant/controller/profile_controller.dart';
import 'package:restaurant/views/pages/category/categoryPage.dart';
import 'package:restaurant/views/pages/order/orders.dart';
import 'package:restaurant/views/pages/firstScreen/splash_screen.dart';
import 'package:restaurant/views/pages/otp_screen/otp_screen.dart';
import 'package:restaurant/views/pages/signin/sign_in_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  bool islogin= await sharedPreferences.getBool("isLogin");
  
  //  ProfileController profileController=Get.put(ProfileController());
  //  await profileController.getProfile();


  print("login is $islogin");

  runApp(
    GetMaterialApp(
    title: 'Restaurant App',
    theme: ThemeData(
        primaryColor: Colors.black,
      ),
    home:
    //SignIn(),
    islogin==true?OrderPage():FirstScreen(),
    debugShowCheckedModeBanner: false,
  ));
}
