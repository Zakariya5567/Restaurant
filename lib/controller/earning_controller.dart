import 'package:get/get.dart';
import 'package:restaurant/Models/earning_model.dart';
import 'package:restaurant/services/earning_api.dart';
import 'package:shared_preferences/shared_preferences.dart';


class EarningController extends GetxController{



  EarningListModel earningListModel;
GetEarningApi getEarningApi=GetEarningApi();

  bool isLoading=false;



  setLoading(bool value){
    isLoading=value;
    update();
  }

 


getEarningList() async {
    
   
    print("called get orderList");
     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
     final companyId = sharedPreferences.getInt("company_id");
     print("company_id is : $companyId");

    earningListModel= await getEarningApi.getEarningListApi({"company_id":companyId.toString()});
    
    update();
  }

  
}