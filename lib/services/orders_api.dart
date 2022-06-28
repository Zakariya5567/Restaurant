import 'dart:convert';
import 'package:restaurant/Models/company_orders_model.dart';
import 'package:restaurant/Models/order_detail_model.dart';
import 'package:restaurant/Models/order_list_model.dart';
import 'package:restaurant/utills/apiurl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class OrdersApi{

  OrderListModel orderListModel;
  OrderDetailModel orderDetailModel;
  CompanyOrdersModel companyOrdersModel;

   Future<CompanyOrdersModel>getCompanyOrderListApi(Map<String ,dynamic> data) async {

    print("calling get orderList api");

    print("Sending data is : $data");

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final accessToken = sharedPreferences.getString("access_token");

    final headers = {
      'Authorization': 'Bearer $accessToken',
    };

    String getComoanyOrderListUrl = ApiUrl.getComoanyOrderListUrl;

     print(getComoanyOrderListUrl);

    var response = await http.post(Uri.parse(getComoanyOrderListUrl),body: data, headers: headers);

    //print("Response is: ${response.body}");

    final responseBody = response.body;
    final decodeResponse = jsonDecode(responseBody);
    companyOrdersModel =
        CompanyOrdersModel.fromJson(decodeResponse);
    print("decode respose is: ${decodeResponse}");

    return companyOrdersModel;
  }
  


  //   Future<OrderListModel>getorderListApi(Map<String ,dynamic> data) async {

  //   print("calling get orderList api");

  //   print("Sending data is : $data");

  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   final accessToken = sharedPreferences.getString("access_token");

  //   final headers = {
  //     'Authorization': 'Bearer $accessToken',
  //   };

  //   String orderListUrl = ApiUrl.orderListUrl;

  //    print(orderListUrl);

  //   var response = await http.post(Uri.parse(orderListUrl),body: data, headers: headers);

  //   //print("Response is: ${response.body}");

  //   final responseBody = response.body;
  //   final decodeResponse = jsonDecode(responseBody);
  //   orderListModel =
  //       OrderListModel.fromJson(decodeResponse);
  //   print("decode respose is: ${decodeResponse}");

  //   return orderListModel;
  // }
  
    Future<OrderDetailModel>getorderDetailApi(Map<String ,dynamic> data) async {

    print("calling get order detail api");

    print("Sending data is : $data");

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final accessToken = sharedPreferences.getString("access_token");

    final headers = {
      'Authorization': 'Bearer $accessToken',
    };

    String orderDetailUrl = ApiUrl.orderDetailUrl;

     print(orderDetailUrl);

    var response = await http.post(Uri.parse(orderDetailUrl),body: data, headers: headers);

    print(response.body);

    final responseBody = response.body;
    final decodeResponse = jsonDecode(responseBody);
    orderDetailModel =
        OrderDetailModel.fromJson(decodeResponse);
    print(decodeResponse);

    return orderDetailModel;
  }


}