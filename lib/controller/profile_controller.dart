import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant/Models/get_profile_model.dart';
import 'package:restaurant/Models/user_profile_model.dart';
import 'package:restaurant/services/profile_api.dart';
import 'package:restaurant/utills/apiurl.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../Models/update_profile_image_model.dart';

class ProfileController extends GetxController{

 
  ProfileApi profileApi=ProfileApi();

  UpdateProfileImageModel updateProfileImageModel;
  UpdateUserProfileModel updateUserProfileModel;
  GetProfileModel getProfileModel;

  String userName;
  String phoneNumber;


  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController( );

  String profileImage;
  String imageUpdateMessage;
  String profileUpdateMessage;
  int imageFlag;
  int nameFlag;

  
  bool isLoading;

  setLoading(bool value){
    isLoading=value;
    update();
  }

   getProfile()async{

    getProfileModel=await profileApi.getProfileApi();
    
    nameController.text=getProfileModel.data.name;
    phoneNumberController.text=getProfileModel.data.phoneNo;

    update();
   }
   updateProfileImage( File imagePath) async {

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    final companyId = sharedPreferences.getInt("company_id");

    print("image path is :$imagePath");


    updateProfileImageModel = await profileApi.updateProfileImageApi(imagePath,);

    imageUpdateMessage=updateProfileImageModel.result.message;
    imageFlag=updateProfileImageModel.result.rflag;

    sharedPreferences.setString("profileImage",updateProfileImageModel.data.profileImage);
    profileImage=sharedPreferences.getString("profileImage");

    print("profile image is : $profileImage");

    update();

  }
   

   
  updateUserProfile(String name, String phone) async {
    
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final companyId = sharedPreferences.getInt("company_id");

    //print("company_id is : $companyId");
    print("NAME is : $name");
    print("PHONE NUMBER is : $phone");

    updateUserProfileModel = await profileApi.updateUserProfileApi({
      "name": name,
      "phone_number":phone,
    });



    profileUpdateMessage=updateUserProfileModel.result.message;
    nameFlag=updateUserProfileModel.result.rflag;

    
    sharedPreferences.setString("name",updateUserProfileModel.data.name );
    sharedPreferences.setString("phoneNumber",updateUserProfileModel.data.phoneNo );
    
     userName=sharedPreferences.getString("name");
     phoneNumber=sharedPreferences.getString("phoneNumber");

     print("user NAME is : $userName");
     print("user PHONE NUMBER is : $phoneNumber");



    update();
  }


}