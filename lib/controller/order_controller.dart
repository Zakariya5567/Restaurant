import 'package:get/get.dart';
import 'package:restaurant/Models/company_orders_model.dart';
import 'package:restaurant/Models/order_detail_model.dart';
import 'package:restaurant/Models/order_list_model.dart';
import 'package:restaurant/services/orders_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderController extends GetxController{



  OrderListModel orderListModel;
  OrderDetailModel orderDetailModel;
  CompanyOrdersModel companyOrdersModel;
  OrdersApi ordersApi=OrdersApi();
 


// seleted index used for the index of bottom navigation bar
//when the user select icon the index will change and icon color will be change run time

  int selectedIndex=1;
  setseletctIndex(int value){
     selectedIndex=value;
     update();
  }



  bool isLoading=false;
  int orderId;
  String orderType="complete";


  setLoading(bool value){
    isLoading=value;
    update();
  }

  setOrderId(int id){
    orderId=id;
    update();
  }


getOrderList() async {
    
   //setLoading(true);
    print("called get orderList");
     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
     final companyId = sharedPreferences.getInt("company_id");
     print("company_id is : $companyId");

  companyOrdersModel=
    await ordersApi.getCompanyOrderListApi({"company_id":companyId.toString()});
    
   // setLoading(false);
    update();
  }

  // getOrderList() async {
    
  //  //setLoading(true);
  //   print("called get orderList");
  //    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //    final companyId = sharedPreferences.getInt("company_id");
  //    print("company_id is : $companyId");

  // orderListModel=
  //   await ordersApi.getorderListApi({"company_id":companyId.toString()});
    
  //  // setLoading(false);
  //   update();
  // }

  getOrderDetail() async {

    print("called get order detail");

   orderDetailModel=
    await 
     ordersApi.getorderDetailApi({"order_id":orderId.toString()});
    update();
  }



  
}