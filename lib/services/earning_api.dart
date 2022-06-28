import 'dart:convert';
import 'package:restaurant/Models/earning_model.dart';
import 'package:restaurant/utills/apiurl.dart';
import 'package:restaurant/views/pages/earning/earning.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


class GetEarningApi{


  EarningListModel earningListModel;

  
   Future<EarningListModel>getEarningListApi(Map<String ,dynamic> data) async {

    print("calling get orderList api");

    print("Sending data is : $data");

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final accessToken = sharedPreferences.getString("access_token");

    final headers = {
      'Authorization': 'Bearer $accessToken',
    };

    String earningUrl = ApiUrl.earningUrl;

     print(earningUrl);

    var response = await http.post(Uri.parse(earningUrl),body: data, headers: headers);


    final responseBody = response.body;
    print("response is $responseBody");
    final decodeResponse = jsonDecode(responseBody);
    earningListModel =
        EarningListModel.fromJson(decodeResponse);
    print("decode respose is: ${decodeResponse}");

  return earningListModel;
  }
  

}