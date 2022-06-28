import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:restaurant/Models/get_profile_model.dart';
import 'package:restaurant/Models/update_profile_image_model.dart';
import 'package:restaurant/Models/user_profile_model.dart';
import 'package:restaurant/utills/apiurl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileApi{

  UpdateProfileImageModel updateProfileImageModel;
  UpdateUserProfileModel updateUserProfileModel;
  GetProfileModel getProfileModel;


  Future<GetProfileModel>getProfileApi() async {

    print("calling getprofile api");


    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final accessToken = sharedPreferences.getString("access_token");

    final headers = {
      'Authorization': 'Bearer $accessToken',
    };

    String getProfileUrl = ApiUrl.getProfileUrl;

     print(getProfileUrl);

    var response = await http.post(Uri.parse(getProfileUrl),headers: headers);

    //print("Response is: ${response.body}");

    final responseBody = response.body;
    final decodeResponse = jsonDecode(responseBody);
    getProfileModel =
        GetProfileModel.fromJson(decodeResponse);
    print("decode respose is: ${decodeResponse}");

    return getProfileModel;
  }

  Future<UpdateProfileImageModel> updateProfileImageApi(File imagePath,) async {

    print("image path in api is :$imagePath");

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final accessToken = sharedPreferences.getString("access_token");

   Map<String, String> headers = {
      'Authorization': 'Bearer $accessToken',
    };

    //print("barear token is :$accessToken");

    String updateprofileImageUrl = ApiUrl.updateprofileImageUrl;

    print(updateprofileImageUrl);


    //create multipart request for POST or PATCH method
    var request = http.MultipartRequest(
      "POST",
      Uri.parse(updateprofileImageUrl),
    );
    request.headers.addAll(headers);

    //create multipart using filepath, string or bytes
    var pic =
        await http.MultipartFile.fromPath("profile_img", imagePath.path);

    //add multipart to request
    request.files.add(pic);

    var response = await request.send();

    //Get the response from the server

    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);

    print("responseString is: $responseString end response");

    var decodeResponse = jsonDecode(responseString);

    print("Decode response is $decodeResponse");

    updateProfileImageModel = UpdateProfileImageModel.fromJson(decodeResponse);

    return updateProfileImageModel;
  }


  Future<UpdateUserProfileModel> updateUserProfileApi(
      Map<String, dynamic> data) 
      async {

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final accessToken = sharedPreferences.getString("access_token");

    final headers = {
      'Authorization': 'Bearer $accessToken',
    };

    String updateUserProfileUrl = ApiUrl.updateUserProfileUrl;

    print(updateUserProfileUrl);

    var response = await http.post(Uri.parse(updateUserProfileUrl),
        body: data, headers: headers);

    final responseBody = response.body;


    print(responseBody);

    final decodeResponse = jsonDecode(responseBody);
    updateUserProfileModel =
        UpdateUserProfileModel.fromJson(decodeResponse);
    print(decodeResponse);

    return updateUserProfileModel;
  }


}