import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant/controller/order_controller.dart';
import 'package:restaurant/views/pages/order/history_orders.dart';

class OrderHistoryPage extends StatefulWidget {
  const OrderHistoryPage({Key key}) : super(key: key);

  @override
  State<OrderHistoryPage> createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {

  OrderController orderController=Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
          elevation: 2,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_outlined),
            color: Colors.black,
          ),
          centerTitle: true,
          title: Text(
            "Order History",
            style: GoogleFonts.ubuntu(
                textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(0, 0, 0, 1),
            )),
            textAlign: TextAlign.center,
          )),
      body:
       GetBuilder(
        init: OrderController(),
        builder: (controller) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(0),
              child: Column(children: [
                // GridView(
                //   shrinkWrap: true,
                //   physics: const ScrollPhysics(),
                //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                //     crossAxisCount: 2,
                //     crossAxisSpacing: 10,
                //     mainAxisSpacing: 20,
                //     childAspectRatio: (2 / 2),
                //   ),
                //   children: [
                //     //pendig payment
                //     Container(
                //       height: MediaQuery.of(context).size.height / 3.4,
                //       width: MediaQuery.of(context).size.width / 2,
                //       decoration: BoxDecoration(
                //         color: Colors.blue.shade400,
                //         borderRadius: BorderRadius.circular(10),
                       
                //       ),
                //       child: Center(
                //         child: Column(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           crossAxisAlignment: CrossAxisAlignment.center,
                //           children: [
                //             Image.asset(
                //               "assets/images/money.png",
                //               height: MediaQuery.of(context).size.height / 15,
                //               width: MediaQuery.of(context).size.width / 2.5,
                //             ),
                //             SizedBox(
                //               height: MediaQuery.of(context).size.height / 50,
                //             ),
                //             Text(
                //               "Pending Payment",
                //               style: GoogleFonts.ubuntu(
                //                   textStyle: const TextStyle(
                //                 fontSize: 16,
                //                 fontWeight: FontWeight.w400,
                //                 color: Colors.white,
                //               )),
                //               textAlign: TextAlign.center,
                //             ),
                //             SizedBox(
                //               height: MediaQuery.of(context).size.height / 50,
                //             ),
                //             Container(
                //               height: MediaQuery.of(context).size.height / 18,
                //               width: MediaQuery.of(context).size.width / 3,
                //               decoration: BoxDecoration(
                //                 color: Colors.blue.shade600,
                //                 borderRadius: BorderRadius.circular(10),
                //               ),
                //               child: Center(
                //                 child: Text(
                //                   "\$520.10",
                //                   style: GoogleFonts.ubuntu(
                //                       textStyle: const TextStyle(
                //                     fontSize: 16,
                //                     fontWeight: FontWeight.w700,
                //                     color: Colors.white,
                //                   )),
                //                   textAlign: TextAlign.center,
                //                 ),
                //               ),
                //             )
                //           ],
                //         ),
                //       ),
                //     ),
      
                //     //Completed orders
                //     Container(
                //       height: MediaQuery.of(context).size.height / 3.4,
                //       width: MediaQuery.of(context).size.width / 2,
                //       decoration: BoxDecoration(
                //         color: Colors.greenAccent.shade700,
                //         borderRadius: BorderRadius.circular(10),
                //       ),
                //       child: Center(
                //         child: Column(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           crossAxisAlignment: CrossAxisAlignment.center,
                //           children: [
                //             Image.asset(
                //               "assets/images/completed.png",
                //               height: MediaQuery.of(context).size.height / 15,
                //               width: MediaQuery.of(context).size.width / 2.5,
                //             ),
                //             SizedBox(
                //               height: MediaQuery.of(context).size.height / 50,
                //             ),
                //             Text(
                //               "Completed orders",
                //               style: GoogleFonts.ubuntu(
                //                   textStyle: const TextStyle(
                //                 fontSize: 16,
                //                 fontWeight: FontWeight.w400,
                //                 color: Colors.white,
                //               )),
                //               textAlign: TextAlign.center,
                //             ),
                //             SizedBox(
                //               height: MediaQuery.of(context).size.height / 50,
                //             ),
                //             Container(
                //               height: MediaQuery.of(context).size.height / 18,
                //               width: MediaQuery.of(context).size.width / 3,
                //               decoration: BoxDecoration(
                //                 color: Colors.green.shade500,
                //                 borderRadius: BorderRadius.circular(10),
                //               ),
                //               child: Center(
                //                 child: Text(
                //                   "24",
                //                   style: GoogleFonts.ubuntu(
                //                       textStyle: const TextStyle(
                //                     fontSize: 16,
                //                     fontWeight: FontWeight.w700,
                //                     color: Colors.white,
                //                   )),
                //                   textAlign: TextAlign.center,
                //                 ),
                //               ),
                //             )
                //           ],
                //         ),
                //       ),
                //     ),
      
                //     //pending order
                //     Container(
                //       height: MediaQuery.of(context).size.height / 3.4,
                //       width: MediaQuery.of(context).size.width / 2,
                //       decoration: BoxDecoration(
                //         color: Colors.purple.shade300,
                //         borderRadius: BorderRadius.circular(10),
                //       ),
                //       child: Center(
                //         child: Column(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           crossAxisAlignment: CrossAxisAlignment.center,
                //           children: [
                //             Image.asset(
                //               "assets/images/document.png",
                //               height: MediaQuery.of(context).size.height / 15,
                //               width: MediaQuery.of(context).size.width / 2.5,
                //             ),
                //             SizedBox(
                //               height: MediaQuery.of(context).size.height / 50,
                //             ),
                //             Text(
                //               "Pending Orders",
                //               style: GoogleFonts.ubuntu(
                //                   textStyle: const TextStyle(
                //                 fontSize: 16,
                //                 fontWeight: FontWeight.w400,
                //                 color: Colors.white,
                //               )),
                //               textAlign: TextAlign.center,
                //             ),
                //             SizedBox(
                //               height: MediaQuery.of(context).size.height / 50,
                //             ),
                //             Container(
                //               height: MediaQuery.of(context).size.height / 18,
                //               width: MediaQuery.of(context).size.width / 3,
                //               decoration: BoxDecoration(
                //                 color: Colors.purple.shade400,
                //                 borderRadius: BorderRadius.circular(10),
                //               ),
                //               child: Center(
                //                 child: Text(
                //                   "12",
                //                   style: GoogleFonts.ubuntu(
                //                       textStyle: const TextStyle(
                //                     fontSize: 16,
                //                     fontWeight: FontWeight.w700,
                //                     color: Colors.white,
                //                   )),
                //                   textAlign: TextAlign.center,
                //                 ),
                //               ),
                //             )
                //           ],
                //         ),
                //       ),
                //     ),
      
                //     //Cancelecd order
      
                //     Container(
                //       height: MediaQuery.of(context).size.height / 3.4,
                //       width: MediaQuery.of(context).size.width / 2,
                //       decoration: BoxDecoration(
                //         color: Colors.red.shade300,
                //         borderRadius: BorderRadius.circular(10),
                //       ),
                //       child: Center(
                //         child: Column(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           crossAxisAlignment: CrossAxisAlignment.center,
                //           children: [
                //             Image.asset(
                //               "assets/images/reject.png",
                //               height: MediaQuery.of(context).size.height / 15,
                //               width: MediaQuery.of(context).size.width / 2.5,
                //             ),
                //             SizedBox(
                //               height: MediaQuery.of(context).size.height / 50,
                //             ),
                //             Text(
                //               "Cancelled Orders",
                //               style: GoogleFonts.ubuntu(
                //                   textStyle: const TextStyle(
                //                 fontSize: 16,
                //                 fontWeight: FontWeight.w400,
                //                 color: Colors.white,
                //               )),
                //               textAlign: TextAlign.center,
                //             ),
                //             SizedBox(
                //               height: MediaQuery.of(context).size.height / 50,
                //             ),
                //             Container(
                //               height: MediaQuery.of(context).size.height / 18,
                //               width: MediaQuery.of(context).size.width / 3,
                //               decoration: BoxDecoration(
                //                 color: Colors.red.shade400,
                //                 borderRadius: BorderRadius.circular(10),
                //               ),
                //               child: Center(
                //                 child: Text(
                //                   "22",
                //                   style: GoogleFonts.ubuntu(
                //                       textStyle: const TextStyle(
                //                     fontSize: 16,
                //                     fontWeight: FontWeight.w700,
                //                     color: Colors.white,
                //                   )),
                //                   textAlign: TextAlign.center,
                //                 ),
                //               ),
                //             )
                //           ],
                //         ),
                //       ),
                //     ),
                //   ],
                // ),


//---------------------------------------------------------------------------------------
                // List of orders
                HistoryOrders(),





                // ListView.builder(
                //     shrinkWrap: true,
                //     physics: ScrollPhysics(),
                //     itemCount: 4,
                //     itemBuilder: ((context, index) {
                //       return Padding(
                //         padding: const EdgeInsets.only(top: 10.0),
                //         child: Container(
                //          // height: MediaQuery.of(context).size.height / 4.5,
                //           decoration: BoxDecoration(
                //             color: Colors.grey.shade200,
                //             borderRadius: BorderRadius.circular(10),
                //             border: Border.all(color:Colors.grey.shade300)
                //           ),
                //           child: Column(
                //             children: [
                //               Padding(
                //                 padding: const EdgeInsets.only(top: 10, left: 5),
                //                 child: Row(
                //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //                   children: [
                //                     Row(
                //                       children: [
                //                         const Icon(
                //                           Icons.person,color: Colors.black54,
                //                         ),
                //                        const  SizedBox(
                //                           width: 10,
                //                         ),
                //                         Text(
                //                           "Robert M phell",
                //                           style: GoogleFonts.ubuntu(
                //                               textStyle: const TextStyle(
                //                             fontSize: 16,
                //                             fontWeight: FontWeight.w600,
                //                             color: Colors.black87,
                //                           )),
                //                           textAlign: TextAlign.center,
                //                         ),
                //                       ],
                //                     ),
                //                     Container(
                //                       height: 40,
                //                       width: 120,
                //                       decoration: BoxDecoration(
                                        
                //                           color: orderController.orderType=="complete"?Colors.green:Colors.orange,
                //                           borderRadius: const BorderRadius.only(
                //                             topLeft: Radius.circular(20),
                //                             bottomLeft: Radius.circular(20),
                //                           )),
                //                       child: Center(
                //                           child: Row(
                //                         children: [
                //                           //const Icon(Icons.loop,color: Colors.white,),
                //                           Padding(
                //                             padding: const EdgeInsets.all(5.0),
                //                             child: orderController.orderType=="complete"?
                //                             Image.asset("assets/images/comp.png",
                //                              height: 20,width: 20,):
                //                             Image.asset("assets/images/sand-clock.png",
                //                             height: 20,width: 20,),
                //                           ),
                //                           orderController.orderType=="complete"?
                //                              Text(
                //                             "Completed",
                //                             style: GoogleFonts.ubuntu(
                //                                 textStyle: const TextStyle(
                //                               fontSize: 16,
                //                               fontWeight: FontWeight.w600,
                //                               color: Colors.white,
                //                             )),
                //                             textAlign: TextAlign.center,
                //                           ):
                                       
                //                           Text(
                //                             "On Going",
                //                             style: GoogleFonts.ubuntu(
                //                                 textStyle: const TextStyle(
                //                               fontSize: 16,
                //                               fontWeight: FontWeight.w600,
                //                               color: Colors.white,
                //                             )),
                //                             textAlign: TextAlign.center,
                //                           ),
                //                         ],
                //                       )),
                //                     ),
                //                   ],
                //                 ),
                //               ),
                //               Padding(
                //                 padding: const EdgeInsets.only(top: 10, left: 5),
                //                 child: Row(
                //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //                   children: [
                //                     Row(
                //                       children: [
                //                         Icon(
                //                           Icons.person,
                //                           color: Colors.grey.shade200,
                //                         ),
                //                         const SizedBox(
                //                           width: 10,
                //                         ),
                //                         Text(
                //                           "Booking id : #123456",
                //                           style: GoogleFonts.ubuntu(
                //                               textStyle: const TextStyle(
                //                             fontSize: 14,
                //                             fontWeight: FontWeight.w400,
                //                             color: Colors.black54,
                //                           )),
                //                           textAlign: TextAlign.center,
                //                         ),
                //                       ],
                //                     ),
                //                     Padding(
                //                       padding: const EdgeInsets.only(right: 20.0),
                //                       child: Text(
                //                         "\$45",
                //                         style: GoogleFonts.ubuntu(
                //                             textStyle:  TextStyle(
                //                           fontSize: 18,
                //                           fontWeight: FontWeight.w400,
                //                           color:  orderController.orderType=="complete"?
                //                           Colors.green:Colors.orange,
                //                         )),
                //                         textAlign: TextAlign.center,
                //                       ),
                //                     ),
                //                   ],
                //                 ),
                //               ),
                //               Padding(
                //                 padding: const EdgeInsets.only(top: 10, left: 5),
                //                 child: Row(
                //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //                   children: [
                //                     const Icon(Icons.person_add,color: Colors.black54,),
                //                     const SizedBox(
                //                       width: 10,
                //                     ),
                //                     Expanded(
                //                       child: Text(
                //                         "American burger x1, French Fries x2, Chickecn Burger x3, Pizza x1 ",
                //                        overflow:TextOverflow.ellipsis ,
                //                        maxLines: 2,
                //                         style: GoogleFonts.ubuntu(
                //                             textStyle: const TextStyle(
                //                           fontSize: 15,
                //                           fontWeight: FontWeight.w400,
                //                           color: Colors.black87,
                                          
                //                         ),
                //                         ),
                //                         //textAlign: TextAlign.center,
                //                       ),
                //                     ),
                //                   ],
                //                 ),
                //               ),
                //               const SizedBox(height: 20,)
                //             ],
                //           ),
                //         ),
                //       );
                //     }))
              
              ]),
            ),
          );
        }
      ),
    );
  }
}
