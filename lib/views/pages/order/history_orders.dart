
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
// import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:restaurant/Models/order_list_model.dart';
import 'package:restaurant/Theme/Theme.dart';
import 'package:restaurant/controller/categories_controller.dart';
import 'package:restaurant/controller/order_controller.dart';
import 'package:restaurant/controller/profile_controller.dart';
import 'package:restaurant/services/categories_api.dart';
import 'package:restaurant/utills/Displaywidth.dart';
import 'package:restaurant/views/pages/accountSetting/accountSetting.dart';
import 'package:restaurant/views/pages/category/categoryPage.dart';
import 'package:restaurant/views/pages/document/documents.dart';
import 'package:restaurant/views/pages/earning/earning.dart';
import 'package:restaurant/views/pages/order/orderDetails.dart';
import 'package:restaurant/views/widgets/side_menu_bar.dart';
import 'package:restaurant/views/widgets/tabButton.dart';
import 'package:restaurant/views/widgets/tab_bar_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryOrders extends StatelessWidget {
  HistoryOrders({Key key}) : super(key: key);

  OrderController orderController=Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    return   GetBuilder(
                      init: OrderController(),
                      builder: (controller) {
                        return orderController.isLoading == true
                            ? const Padding(
                                padding: EdgeInsets.only(top: 50.0),
                                child: Center(
                                    child: SpinKitFadingFour(
                                  color: Colors.black,
                                  size: 40,
                                )))
                            :
                             orderController.companyOrdersModel.previousOrders.isBlank ||
                                    orderController.companyOrdersModel.previousOrders.isEmpty
                            //  orderController.orderListModel.data.isBlank ||
                            //         orderController.orderListModel.data.isEmpty

                                ? const Padding(
                                    padding: EdgeInsets.only(top: 50.0),
                                    child: Center(
                                      child: Text(
                                        "Orders not availabe!",
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ),
                                  )
                                : ListView.builder(
                                       shrinkWrap: true,
                                  physics: ScrollPhysics(),
                                    itemCount: orderController.companyOrdersModel.previousOrders.length,
                                    //  orderController
                                    //     .orderListModel.data.length,

                                    itemBuilder: ((context, index) {

                                      final order = orderController
                                          .companyOrdersModel.previousOrders[index];
                                      // final order = orderController
                                      //     .orderListModel.data[index];

                                      int totalPrice;

                                      return Container(
                                        child: SingleChildScrollView(
                                          child: Column(
                                            children: [
                                              InkWell(
                                                //focusColor: Colors.red,
                                                onTap: () async{

                                                  print("order clicked");
                                                  orderController.setOrderId(order.id);
                                                  print("order id is :${order.id}");

                                                  orderController.setLoading(true);
                                                 

                                                   Get.to(()=> OrderDetails(),
                                                      duration:
                                                         const Duration(milliseconds: 500),
                                                      transition: Transition
                                                          .leftToRight,
                                                      curve: Curves.easeInOut);
                                                     await orderController.getOrderDetail();
                                                      orderController.setLoading(false);


                                                },
                                                child: Container(
                                                  //height: displayHeight(context) / 4.3,
                                                  width: displayWidth(context),
                                                  margin: EdgeInsets.only(
                                                      left: displayWidth(
                                                              context) *
                                                          0.07,
                                                      right: displayWidth(
                                                              context) *
                                                          0.07,
                                                      top: 20),
                                                  decoration: Constants
                                                      .containerstyle(),
                                                  // color: Color.fromRGBO(255, 255, 255, 1),
                                                  child: Column(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                top: 15.0,
                                                                left: 15,
                                                                right: 15),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              "Order ID: ${order.id}",
                                                              style: Constants
                                                                  .orderidstyle(),
                                                            ),
                                                            Text(
                                                              "\$ ${order.orderTotal}",
                                                              style: GoogleFonts.ubuntu(
                                                                  textStyle: const TextStyle(
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      color: Color.fromRGBO(
                                                                          237,
                                                                          41,
                                                                          57,
                                                                          1))),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            left: 15.0,
                                                            right: 15.0),
                                                        child: Divider(
                                                          color:
                                                              Colors.grey[100],
                                                          thickness: 2,
                                                        ),
                                                      ),
                                                      Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 5,
                                                                  left: 15,
                                                                  right: 15,
                                                                  bottom: 5),
                                                          child:
                                                              ListView.builder(
                                                                  shrinkWrap:
                                                                      true,
                                                                  physics:
                                                                      const NeverScrollableScrollPhysics(),
                                                                  itemCount: 
                                                                  order
                                                                      .products
                                                                      .length,
                                                                  itemBuilder:
                                                                      (context,
                                                                          productIndex) {
                                                                    final product =
                                                                        order.products[
                                                                            productIndex];

                                                                    //totalPrice=product.productPrice+product.productPrice;

                                                                    return Padding(
                                                                      padding: const EdgeInsets
                                                                              .only(
                                                                          top:
                                                                              5.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Text(
                                                                            "${product.name}",
                                                                            style:
                                                                                Constants.ordersubcategory(),
                                                                          ),
                                                                          Text(
                                                                              "${product.quantity} x",
                                                                              style: Constants.ordersubcategory()),
                                                                        ],
                                                                      ),
                                                                    );
                                                                  })),
                                                      Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 5),
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        width: displayWidth(
                                                                context) *
                                                            0.78,
                                                        child: Text(
                                                          "${order.deliveryAddress}",
                                                          style: GoogleFonts.ubuntu(
                                                              textStyle: TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          154,
                                                                          154,
                                                                          157,
                                                                          1))),
                                                        ),
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                          top: 10,
                                                          left: 12,
                                                          right: 15,
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            // Image.asset(
                                                            //     "assets/images/timeCircle.png"),

                                                            Container(
                                                              child: Row(
                                                                  children: [
                                                                    Image.asset(
                                                                        "assets/images/timeCircle.png"),
                                                                    order.orderDate==null?
                                                                    Text(""):
                                                                    Text(
                                                                      "${getFormattedDate(order.orderDate)}, ${getFormattedTime(order.time)}",
                                                                      style: GoogleFonts.ubuntu(
                                                                          textStyle: const TextStyle(
                                                                              fontSize: 15,
                                                                              fontWeight: FontWeight.w400,
                                                                              color: Color.fromRGBO(237, 41, 57, 1))),
                                                                    ),
                                                                    //const SizedBox(height: 20,),
                                                                  ]),
                                                            ),

                                                            Text(
                                                                  order.statusName,
                                                              style: TextStyle(
                                                                  fontSize: 14,
                                                                  color: Colors
                                                                      .green),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );

                                      //  Padding(
                                      //    padding: const EdgeInsets.all(8.0),
                                      //    child: Container(height: 100,width: 200,color: Colors.black,),
                                      //  );
                                    }));
                      });


    
  }

   String getFormattedDate(DateTime date) {
    /// Convert into local date format.
    // var localDate = DateTime.parse(date).toLocal();
    // var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
    //  var inputDate = inputFormat.parse(localDate.toString());

    var outputFormat = DateFormat('dd-MM-yyyy');
    var outputDate = outputFormat.format(date);

    return outputDate.toString();
  }

  String getFormattedTime(String date) {
    var now = new DateTime.now();
    var formatter = new DateFormat(date);
    String formattedTime = DateFormat('kk:mm:a').format(now);
    String formattedDate = formatter.format(now);
    print(formattedTime);
    print(formattedDate);

    return formattedTime;
  }

}