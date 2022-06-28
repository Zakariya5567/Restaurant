import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant/Models/company_orders_model.dart';
import 'package:restaurant/Theme/Theme.dart';
import 'package:restaurant/controller/earning_controller.dart';
import 'package:restaurant/controller/order_controller.dart';
import 'package:restaurant/utills/Displaywidth.dart';
import 'package:restaurant/views/widgets/tab_bar_view.dart';

class Earning extends StatefulWidget {
  const Earning({Key key}) : super(key: key);

  @override
  _EarningState createState() => _EarningState();
}

class _EarningState extends State<Earning> {

    EarningController earningController=Get.put(EarningController());
    OrderController orderController=Get.put(OrderController());

  setIndex(){
     orderController.setseletctIndex(0);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero,(){
   setIndex();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0.5,
          centerTitle: true,
          backgroundColor: Colors.grey.shade100,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {
              Get.back();
            },
          ),
          title: Text(
            "Earnings",
            style: GoogleFonts.ubuntu(
                textStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            )),
            textAlign: TextAlign.center,
          )),
      body:
      
       Container(
        height: displayHeight(context) - kBottomNavigationBarHeight,
        width: displayWidth(context),
        child: SingleChildScrollView(
          child: GetBuilder(
            init: EarningController(),
            builder: (controller) {
          
            return earningController.isLoading == true
                            ? const Padding(
                                padding: EdgeInsets.only(top: 200.0),
                                child: Center(
                                    child: SpinKitFadingFour(
                                  color: Colors.black,
                                  size: 40,
                                ))):Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
            
                    SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                     Container(
                      height: displayHeight(context) * 0.11,
                      width: displayWidth(context) / 1.1,
                      decoration: Constants.containerstyle(),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text( "Today Earning",
                                    style: Constants.earningtextstyle(),
                                  ),
                                  Text("\$"+ earningController.earningListModel.todaysEarning.toString(),
                                    style: Constants.earningstyle(),
                                  ),
                          ],
                        ),
                      ),
                      ),
             SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                     Container(
                      height: displayHeight(context) * 0.11,
                      width: displayWidth(context) / 1.1,
                      decoration: Constants.containerstyle(),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text( "Last Week Earning",
                                    style: Constants.earningtextstyle(),
                                  ),
                                  Text("\$"+ earningController.earningListModel.lastWeekEarning.toString(),
                                    style: Constants.earningstyle(),
                                  ),
                          ],
                        ),
                      ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                        Container(
                      height: displayHeight(context) * 0.11,
                      width: displayWidth(context) / 1.1,
                      decoration: Constants.containerstyle(),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text( "Last Month Earning",
                                    style: Constants.earningtextstyle(),
                                  ),
                                  Text("\$"+ earningController.earningListModel.lastMonthEarning.toString(),
                                    style: Constants.earningstyle(),
                                  ),
                          ],
                        ),
                      ),
                      ),
 SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                        Container(
                      height: displayHeight(context) * 0.11,
                      width: displayWidth(context) / 1.1,
                      decoration: Constants.containerstyle(),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text( "Total Earning",
                                    style: Constants.earningtextstyle(),
                                  ),
                                  Text("\$"+ earningController.earningListModel.todaysEarning.toString(),
                                    style: Constants.earningstyle(),
                                  ),
                          ],
                        ),
                      ),
                      ),
            
                                 
            
            
                  //   Container(
                  //     margin: EdgeInsets.only(top: 20),
                  //     decoration: Constants.containerstyle(),
                  //     height: displayHeight(context) * 0.12,
                  //     width: displayWidth(context) / 1.1,
                  //     child: Padding(
                  //       padding: const EdgeInsets.only(top: 12),
                  //       child: Row(
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         children: [
                  //           Column(
                  //             crossAxisAlignment: CrossAxisAlignment.start,
                  //             children: [
                  //               Text(
                  //                 "Monthly",
                  //                 style: Constants.earningtextstyle(),
                  //               ),
                  //               SizedBox(
                  //                 height: 5,
                  //               ),
                  //               Text(
                  //                 "$400.00",
                  //                 style: Constants.earningstyle(),
                  //               ),
                  //             ],
                  //           ),
                  //           SizedBox(
                  //             width: 10,
                  //           ),
                  //           Column(
                  //             crossAxisAlignment: CrossAxisAlignment.start,
                  //             children: [
                  //               Text(
                  //                 "Weekly",
                  //                 style: Constants.earningtextstyle(),
                  //               ),
                  //               SizedBox(
                  //                 height: 5,
                  //               ),
                  //               Text(
                  //                 "$130.00",
                  //                 style: Constants.earningstyle(),
                  //               ),
                  //             ],
                  //           ),
                  //           SizedBox(
                  //             width: 10,
                  //           ),
                  //           Column(
                  //             crossAxisAlignment: CrossAxisAlignment.start,
                  //             children: [
                  //               Text(
                  //                 "Today",
                  //                 style: Constants.earningtextstyle(),
                  //               ),
                  //               SizedBox(
                  //                 height: 5,
                  //               ),
                  //               Text(
                  //                 "$76.00",
                  //                 style: Constants.earningstyle(),
                  //               ),
                  //             ],
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  //   Container(
                  //     margin: EdgeInsets.only(left: 20, top: 20),
                  //     alignment: Alignment.centerLeft,
                  //     child: Text(
                  //       "Today",
                  //       style: Constants.blacknormalstyle(),
                  //     ),
                  //   ),
                  //   SizedBox(
                  //     height: 8,
                  //   ),
                  //   Container(
                  //     height: displayHeight(context) * 0.09,
                  //     width: displayWidth(context) / 1.1,
                  //     decoration: Constants.containerstyle(),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       children: [
                  //         Padding(
                  //           padding: const EdgeInsets.only(
                  //             top: 12.0,
                  //             left: 15,
                  //           ),
                  //           child: Column(
                  //             crossAxisAlignment: CrossAxisAlignment.start,
                  //             children: [
                  //               Text(
                  //                 "Order ID",
                  //                 style: GoogleFonts.ubuntu(
                  //                     textStyle: TextStyle(
                  //                         fontSize: 16,
                  //                         fontWeight: FontWeight.w500,
                  //                         color: Color.fromRGBO(0, 0, 0, 1))),
                  //               ),
                  //               Text(
                  //                 "12:32 PM",
                  //                 style: GoogleFonts.ubuntu(
                  //                     textStyle: TextStyle(
                  //                         fontSize: 12,
                  //                         fontWeight: FontWeight.w400,
                  //                         color: Color.fromRGBO(121, 118, 125, 1))),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //         Padding(
                  //           padding: const EdgeInsets.only(right: 12.0),
                  //           child: Text(
                  //             "$12.00",
                  //             style: GoogleFonts.ubuntu(
                  //                 textStyle: TextStyle(
                  //                     fontSize: 18,
                  //                     fontWeight: FontWeight.w700,
                  //                     color: Color.fromRGBO(94, 207, 99, 1))),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  //   SizedBox(
                  //     height: 8,
                  //   ),
                  //   Container(
                  //     height: displayHeight(context) * 0.09,
                  //     width: displayWidth(context) / 1.1,
                  //     decoration: Constants.containerstyle(),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       children: [
                  //         Padding(
                  //           padding: const EdgeInsets.only(
                  //             top: 12.0,
                  //             left: 15,
                  //           ),
                  //           child: Column(
                  //             crossAxisAlignment: CrossAxisAlignment.start,
                  //             children: [
                  //               Text(
                  //                 "54684132",
                  //                 style: GoogleFonts.ubuntu(
                  //                     textStyle: TextStyle(
                  //                         fontSize: 16,
                  //                         fontWeight: FontWeight.w500,
                  //                         color: Color.fromRGBO(0, 0, 0, 1))),
                  //               ),
                  //               Text(
                  //                 "12:34 PM",
                  //                 style: GoogleFonts.ubuntu(
                  //                     textStyle: TextStyle(
                  //                         fontSize: 12,
                  //                         fontWeight: FontWeight.w400,
                  //                         color: Color.fromRGBO(121, 118, 125, 1))),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //         Padding(
                  //           padding: const EdgeInsets.only(right: 12.0),
                  //           child: Text(
                  //             "$50.00",
                  //             style: GoogleFonts.ubuntu(
                  //                 textStyle: TextStyle(
                  //                     fontSize: 18,
                  //                     fontWeight: FontWeight.w700,
                  //                     color: Color.fromRGBO(94, 207, 99, 1))),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  //   Container(
                  //     margin: EdgeInsets.only(left: 20, top: 20),
                  //     alignment: Alignment.centerLeft,
                  //     child: Text(
                  //       "02 June,2021",
                  //       style: Constants.blacknormalstyle(),
                  //     ),
                  //   ),
                  //   SizedBox(
                  //     height: 8,
                  //   ),
                  //   Container(
                  //     height: displayHeight(context) * 0.09,
                  //     width: displayWidth(context) / 1.1,
                  //     decoration: Constants.containerstyle(),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       children: [
                  //         Padding(
                  //           padding: const EdgeInsets.only(
                  //             top: 12.0,
                  //             left: 15,
                  //           ),
                  //           child: Column(
                  //             crossAxisAlignment: CrossAxisAlignment.start,
                  //             children: [
                  //               Text(
                  //                 "Order ID",
                  //                 style: GoogleFonts.ubuntu(
                  //                     textStyle: TextStyle(
                  //                         fontSize: 16,
                  //                         fontWeight: FontWeight.w500,
                  //                         color: Color.fromRGBO(0, 0, 0, 1))),
                  //               ),
                  //               Text(
                  //                 "12:32 PM",
                  //                 style: GoogleFonts.ubuntu(
                  //                     textStyle: TextStyle(
                  //                         fontSize: 12,
                  //                         fontWeight: FontWeight.w400,
                  //                         color: Color.fromRGBO(121, 118, 125, 1))),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //         Padding(
                  //           padding: const EdgeInsets.only(right: 12.0),
                  //           child: Text(
                  //             "$12.00",
                  //             style: GoogleFonts.ubuntu(
                  //                 textStyle: TextStyle(
                  //                     fontSize: 18,
                  //                     fontWeight: FontWeight.w700,
                  //                     color: Color.fromRGBO(94, 207, 99, 1))),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  //   SizedBox(
                  //     height: 8,
                  //   ),
                  //   Container(
                  //     height: displayHeight(context) * 0.09,
                  //     width: displayWidth(context) / 1.1,
                  //     decoration: Constants.containerstyle(),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       children: [
                  //         Padding(
                  //           padding: const EdgeInsets.only(
                  //             top: 12.0,
                  //             left: 15,
                  //           ),
                  //           child: Column(
                  //             crossAxisAlignment: CrossAxisAlignment.start,
                  //             children: [
                  //               Text(
                  //                 "54684132",
                  //                 style: GoogleFonts.ubuntu(
                  //                     textStyle: TextStyle(
                  //                         fontSize: 16,
                  //                         fontWeight: FontWeight.w500,
                  //                         color: Color.fromRGBO(0, 0, 0, 1))),
                  //               ),
                  //               Text(
                  //                 "12:34 PM",
                  //                 style: GoogleFonts.ubuntu(
                  //                     textStyle: TextStyle(
                  //                         fontSize: 12,
                  //                         fontWeight: FontWeight.w400,
                  //                         color: Color.fromRGBO(121, 118, 125, 1))),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //         Padding(
                  //           padding: const EdgeInsets.only(right: 12.0),
                  //           child: Text(
                  //             "$50.00",
                  //             style: GoogleFonts.ubuntu(
                  //                 textStyle: TextStyle(
                  //                     fontSize: 18,
                  //                     fontWeight: FontWeight.w700,
                  //                     color: Color.fromRGBO(94, 207, 99, 1))),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  //   Container(
                  //     margin: EdgeInsets.only(left: 20, top: 20),
                  //     alignment: Alignment.centerLeft,
                  //     child: Text(
                  //       "01 June, 2021",
                  //       style: Constants.blacknormalstyle(),
                  //     ),
                  //   ),
                  //   SizedBox(
                  //     height: 8,
                  //   ),
                  //   Container(
                  //     height: displayHeight(context) * 0.09,
                  //     width: displayWidth(context) / 1.1,
                  //     decoration: Constants.containerstyle(),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       children: [
                  //         Padding(
                  //           padding: const EdgeInsets.only(
                  //             top: 12.0,
                  //             left: 15,
                  //           ),
                  //           child: Column(
                  //             crossAxisAlignment: CrossAxisAlignment.start,
                  //             children: [
                  //               Text(
                  //                 "Order ID",
                  //                 style: GoogleFonts.ubuntu(
                  //                     textStyle: TextStyle(
                  //                         fontSize: 16,
                  //                         fontWeight: FontWeight.w500,
                  //                         color: Color.fromRGBO(0, 0, 0, 1))),
                  //               ),
                  //               Text(
                  //                 "12:32 PM",
                  //                 style: GoogleFonts.ubuntu(
                  //                     textStyle: TextStyle(
                  //                         fontSize: 12,
                  //                         fontWeight: FontWeight.w400,
                  //                         color: Color.fromRGBO(121, 118, 125, 1))),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //         Padding(
                  //           padding: const EdgeInsets.only(right: 12.0),
                  //           child: Text(
                  //             "$12.00",
                  //             style: GoogleFonts.ubuntu(
                  //                 textStyle: TextStyle(
                  //                     fontSize: 18,
                  //                     fontWeight: FontWeight.w700,
                  //                     color: Color.fromRGBO(94, 207, 99, 1))),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  //   SizedBox(
                  //     height: 8,
                  //   ),
                  //   Container(
                  //     height: displayHeight(context) * 0.09,
                  //     width: displayWidth(context) / 1.1,
                  //     decoration: Constants.containerstyle(),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       children: [
                  //         Padding(
                  //           padding: const EdgeInsets.only(
                  //             top: 12.0,
                  //             left: 15,
                  //           ),
                  //           child: Column(
                  //             crossAxisAlignment: CrossAxisAlignment.start,
                  //             children: [
                  //               Text(
                  //                 "54684132",
                  //                 style: GoogleFonts.ubuntu(
                  //                     textStyle: TextStyle(
                  //                         fontSize: 16,
                  //                         fontWeight: FontWeight.w500,
                  //                         color: Color.fromRGBO(0, 0, 0, 1))),
                  //               ),
                  //               Text(
                  //                 "12:34 PM",
                  //                 style: GoogleFonts.ubuntu(
                  //                     textStyle: TextStyle(
                  //                         fontSize: 12,
                  //                         fontWeight: FontWeight.w400,
                  //                         color: Color.fromRGBO(121, 118, 125, 1))),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //         Padding(
                  //           padding: const EdgeInsets.only(right: 12.0),
                  //           child: Text(
                  //             "$50.00",
                  //             style: GoogleFonts.ubuntu(
                  //                 textStyle: TextStyle(
                  //                     fontSize: 18,
                  //                     fontWeight: FontWeight.w700,
                  //                     color: Color.fromRGBO(94, 207, 99, 1))),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                ],
              ),
            );
          }),
        ),
      ),
      bottomNavigationBar: TabBarViewData(),
    );
  }
}
