import 'package:get/get.dart';
import 'package:restaurant/Models/login_api_model.dart';
import 'package:restaurant/services/login_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  LoginApiModel loginApiModel;
  LoginApi loginApi = LoginApi();


  

  bool isLoading;

  setLoading(bool value){
    isLoading=value;
    update();
  }

  userLogin(String phone, String firebaseToken, String currentTimeZone) async {

    loginApiModel = await loginApi.loginApi(
      {
        "user_type": '3',
        "phone_number": phone,
         //"phone_number": "+923161235567",
        "fcm_token": firebaseToken,
        "timezone": currentTimeZone,
      },
    );

    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    sharedPreferences.setInt("company_id", loginApiModel.company.companyId);
    sharedPreferences.setString("fcm_token", loginApiModel.user.fcmToken);
    sharedPreferences.setString("access_token", loginApiModel.token.accessToken);
    sharedPreferences.setInt("company_status", loginApiModel.company.status);

    sharedPreferences.setString("username", loginApiModel.user.name);
    sharedPreferences.setString("userphone", loginApiModel.user.phoneNo);
    sharedPreferences.setString("userImage", loginApiModel.user.profileImage);
    
    
  
  

    print("company id is :${loginApiModel.company.companyId}"); 
    print("fcm_token is :${loginApiModel.user.fcmToken}"); 
    print("access_token is :${loginApiModel.token.accessToken}"); 
    print("company_status is :${loginApiModel.company.status}"); 
    
  }
}
