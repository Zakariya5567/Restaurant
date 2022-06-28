import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant/Theme/Theme.dart';
import 'package:restaurant/controller/order_controller.dart';
import 'package:restaurant/utills/Displaywidth.dart';
import 'package:restaurant/views/widgets/tab_bar_view.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({Key key}) : super(key: key);

  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  OrderController orderController = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: GetBuilder(
            init: OrderController(),
            builder: (controller) {
              return orderController.isLoading == true
                  ? Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 10),
                      child: Center(
                          child: SpinKitFadingFour(
                        color: Colors.black,
                        size: 40,
                      )))
                  : GetBuilder(
                      init: OrderController(),
                      builder: (controller) {
                        final orderDetail =
                            orderController.orderDetailModel.data;
                        return Container(
                          height: displayHeight(context) -
                              kBottomNavigationBarHeight,
                          width: displayWidth(context),
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Stack(
                                          children: [
                                            Container(
                                              height: 240,
                                              decoration: BoxDecoration(
                                                  //color: Colors.amber,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(20),
                                                    topRight:
                                                        Radius.circular(20),
                                                  ),
                                                  image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: NetworkImage(
                                                        "${orderController.orderDetailModel.data.restaurantImage}"),
                                                  )),
                                            ),
                                            Container(
                                              height: 250,
                                              decoration: const BoxDecoration(
                                                  //color: Colors.amber,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(20),
                                                    topRight:
                                                        Radius.circular(20),
                                                  ),
                                                  image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: AssetImage(
                                                        "assets/images/foodimages/gradient_image.png"),
                                                  )),
                                            ),

                                            // Image.asset("assets/images/foodimages/order_image.png"),
                                            // Image.asset("assets/images/foodimages/gradient_image.png"),

                                            Positioned(
                                              top: displayHeight(context) *
                                                  0.064,
                                              left:
                                                  displayWidth(context) * 0.030,
                                              child: GestureDetector(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Image.asset(
                                                      "assets/images/foodimages/left_arrow.png")),
                                            ),
                                            Positioned(
                                              top: displayHeight(context) *
                                                  0.061,
                                              left: displayWidth(context) / 3,
                                              child: Text(
                                                "Order Details",
                                                style: GoogleFonts.ubuntu(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.white),
                                              ),
                                            ),
                                            Positioned(
                                              top: displayHeight(context) *
                                                  0.049,
                                              right:
                                                  displayWidth(context) * 0.066,
                                              child: Image.asset(
                                                  "assets/images/foodimages/halal_logo.png"),
                                            ),

                                            Positioned(
                                              top: displayHeight(context) *
                                                  0.232,
                                              left:
                                                  displayWidth(context) * 0.040,
                                              // bottom: displayHeight(context)*0.049,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    orderController
                                                        .orderDetailModel
                                                        .data
                                                        .restaurantName,
                                                    style: GoogleFonts.ubuntu(
                                                      textStyle: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 24,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        "subtitle",
                                                        style:
                                                            GoogleFonts.ubuntu(
                                                          textStyle: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 18,
                                                              color: Colors
                                                                  .transparent),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width -
                                                            240,
                                                      ),
                                                      Container(
                                                          height: 35,
                                                          //width: 100,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                            color: Colors
                                                                .red.shade300,
                                                          ),
                                                          child: Center(
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Text(
                                                                " ${orderDetail.statusName}  ",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        16),
                                                              ),
                                                            ),
                                                          ))
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    height: displayHeight(context) * 0.35,
                                    width: displayWidth(context) / 1.17,
                                    decoration: Constants.containerstyle(),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 16.0, left: 24.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Order Number",
                                            style: GoogleFonts.ubuntu(
                                              textStyle: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black
                                                    .withOpacity(0.5),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 8.0, bottom: 8),
                                            child: Text(
                                              orderDetail.id.toString(),
                                              style: GoogleFonts.ubuntu(
                                                textStyle: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 17,
                                                  color: Color.fromRGBO(
                                                      237, 41, 57, 1),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 22.0),
                                            child: Divider(
                                              color: Color.fromRGBO(0, 0, 0, 1)
                                                  .withOpacity(0.3),
                                              height: 0.5,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 8.0, bottom: 8.0),
                                            child: Text(
                                              "From",
                                              style: GoogleFonts.ubuntu(
                                                textStyle: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 16.0, right: 25.0),
                                            child: Text(
                                              orderDetail.fromAddress
                                                  .toString(),
                                              style: GoogleFonts.ubuntu(
                                                textStyle: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 15,
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, 1),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 22.0),
                                            child: Divider(
                                              color: Color.fromRGBO(0, 0, 0, 1)
                                                  .withOpacity(0.3),
                                              height: 0.5,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 8.0, bottom: 8.0),
                                            child: Text(
                                              "Delivery Address",
                                              style: GoogleFonts.ubuntu(
                                                textStyle: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 16.0, right: 25.0),
                                            child: Text(
                                              orderDetail.deliveryAddress
                                                  .toString(),
                                              style: GoogleFonts.ubuntu(
                                                textStyle: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14,
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, 1),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 22.0),
                                            child: Divider(
                                              color: Color.fromRGBO(0, 0, 0, 1)
                                                  .withOpacity(0.3),
                                              height: 0.5,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    //height: displayHeight(context) * 0.3,
                                    width: displayWidth(context) / 1.17,
                                    decoration: Constants.containerstyle(),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 16.0,
                                          left: 24.0,
                                          right: 22.0,
                                          bottom: 20),
                                      child: Column(
                                        children: [
                                          ListView.builder(
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              itemCount:
                                                  orderDetail.products.length,
                                              itemBuilder: ((context, index) {
                                                final product =
                                                    orderDetail.products[index];
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        product.productName
                                                            .toString(),
                                                        style:
                                                            GoogleFonts.ubuntu(
                                                          textStyle: Constants
                                                              .blackboldstyle(),
                                                        ),
                                                      ),
                                                      Text(
                                                        "${product.quantity.toString()}x",
                                                        style:
                                                            GoogleFonts.ubuntu(
                                                          textStyle: Constants
                                                              .blackboldstyle(),
                                                        ),
                                                      ),
                                                      Text(
                                                        "\$ ${product.productPrice.toString()}",
                                                        style:
                                                            GoogleFonts.ubuntu(
                                                          textStyle: Constants
                                                              .blackboldstyle(),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              })),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 16.0, bottom: 16.0),
                                            child: Divider(
                                              color: Color.fromRGBO(0, 0, 0, 1)
                                                  .withOpacity(0.3),
                                              height: 0.5,
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Sub Total",
                                                style: GoogleFonts.ubuntu(
                                                  textStyle: Constants
                                                      .blacksmallboldstyle(),
                                                ),
                                              ),
                                              Text(
                                                "\$ ${orderDetail.orderSubTotal}",
                                                style: GoogleFonts.ubuntu(
                                                  textStyle: Constants
                                                      .blacksmallboldstyle(),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 16,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Delivery Fee",
                                                style: GoogleFonts.ubuntu(
                                                  textStyle: Constants
                                                      .blacksmallboldstyle(),
                                                ),
                                              ),
                                              Text(
                                                "\$ ${orderDetail.fee}",
                                                style: GoogleFonts.ubuntu(
                                                  textStyle: Constants
                                                      .blacksmallboldstyle(),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 16,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Incl.Tax",
                                                style: GoogleFonts.ubuntu(
                                                  textStyle: Constants
                                                      .blacksmallboldstyle(),
                                                ),
                                              ),
                                              Text(
                                                "\$ ${orderDetail.tax}",
                                                style: GoogleFonts.ubuntu(
                                                  textStyle: Constants
                                                      .blacksmallboldstyle(),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 16.0, bottom: 14.0),
                                            child: Divider(
                                              color: Color.fromRGBO(0, 0, 0, 1)
                                                  .withOpacity(0.3),
                                              height: 0.5,
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Total (Incl.Gst)",
                                                style: GoogleFonts.ubuntu(
                                                  textStyle: Constants
                                                      .blackboldstyle(),
                                                ),
                                              ),
                                              Text(
                                                "\$ ${orderDetail.orderTotal.toString()}",
                                                style: GoogleFonts.ubuntu(
                                                  textStyle: Constants
                                                      .blackboldstyle(),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  InkWell(
                                      child: Container(
                                        height: _height * 0.078,
                                        width: displayWidth(context) * 0.85,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          color: Constants.black_light,
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Status",
                                            style: Constants.loginbuttonstyle(),
                                          ),
                                        ),
                                      ),
                                      onTap: () async {
                                        print("button tapped");
                                      }),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      });
            }),
      ),
      bottomNavigationBar: TabBarViewData(),
    );
  }
}
