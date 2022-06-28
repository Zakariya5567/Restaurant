import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant/Theme/Theme.dart';
import 'package:restaurant/utills/Displaywidth.dart';
import 'package:restaurant/views/pages/order/orderDetails.dart';
import 'package:restaurant/views/widgets/tabButton.dart';
import 'package:restaurant/views/widgets/tab_bar_view.dart';

class OrdersHistory extends StatefulWidget {
  @override
  _OrdersHistoryState createState() => _OrdersHistoryState();
}

class _OrdersHistoryState extends State<OrdersHistory> {
  int _selectedPage = 0;
  PageController _pageController;

  void _changePage(int pageNum) {
    setState(() {
      _selectedPage = pageNum;
      _pageController?.animateToPage(
        pageNum,
        duration: Duration(milliseconds: 1000),
        curve: Curves.fastLinearToSlowEaseIn,
      );
    });
  }

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: displayHeight(context) - kBottomNavigationBarHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // title

            Padding(
              padding: const EdgeInsets.only(top: 50.0, left: 20),
              child: Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset("assets/images/Vector.png")),
                  SizedBox(
                    width: displayWidth(context) * 0.25,
                  ),
                  Text(
                    "Order History",
                    style: GoogleFonts.ubuntu(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //tab bar title
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 12.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TabButton(
                    text: "All",
                    pageNumber: 0,
                    selectedPage: _selectedPage,
                    onPressed: () {
                      _changePage(0);
                    },
                  ),
                  TabButton(
                    text: "Completed",
                    pageNumber: 1,
                    selectedPage: _selectedPage,
                    onPressed: () {
                      _changePage(1);
                    },
                  ),
                  TabButton(
                    text: "Failed",
                    pageNumber: 2,
                    selectedPage: _selectedPage,
                    onPressed: () {
                      _changePage(2);
                    },
                  ),
                ],
              ),
            ),

            //search bar
            Container(
              margin: EdgeInsets.only(top: 25),
              height: displayHeight(context) * 0.066,
              width: displayWidth(context) / 1.17,
              decoration: Constants.containerstyle(),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search",
                  hintStyle: TextStyle(fontSize: 18),
                  prefixIcon: Image.asset("assets/images/Search.png"),
                  suffixIcon: Image.asset("assets/images/Filter.png"),
                ),
              ),
            ),

            // list of orders
            Expanded(
              child: PageView(
                onPageChanged: (int page) {
                  setState(() {
                    _selectedPage = page;
                  });
                },
                controller: _pageController,
                children: [
                  //-----------------------------------------------------------------
                  // all order

                  ListView.builder(
                    
                      itemCount: 5,
                      itemBuilder: ((context, index) {
                        return
                           Container(
                            //child: SingleChildScrollView(
                              child: 
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      print("order clicked");
                                      Get.to(OrderDetails());
                
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(top: 25),
                                      height: displayHeight(context) * 0.14,
                                      width: displayWidth(context) / 1.17,
                                      decoration: Constants.containerstyle(),
                                      child: Row(
                                        children: [
                                          Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 20.0, left: 8.0),
                                                child: Image.asset(
                                                    "assets/images/foodimages/kfc.png"),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: displayWidth(context) * 0.035,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 15.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "KFC",
                                                  style: GoogleFonts.ubuntu(
                                                      textStyle: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black,
                                                  )),
                                                ),
                                                SizedBox(
                                                  height: 8,
                                                ),
                                                Text(
                                                  "Mighty Zinger",
                                                  style: GoogleFonts.ubuntu(
                                                      textStyle: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 14,
                                                    color: Color.fromRGBO(
                                                        154, 154, 157, 1),
                                                  )),
                                                ),
                                                SizedBox(
                                                  height: 9,
                                                ),
                                                Text(
                                                  "17/5/2021, 22:32",
                                                  style: GoogleFonts.ubuntu(
                                                      textStyle: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 14,
                                                    color: Color.fromRGBO(
                                                        154, 154, 157, 1),
                                                  )),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: displayWidth(context) * 0.08,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 15.0,
                                                    left: 0,
                                                    right: 10),
                                                child: Text(
                                                  "\$80.00",
                                                  style: GoogleFonts.ubuntu(
                                                      textStyle: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w400,
                                                    color: Color.fromRGBO(
                                                        237, 41, 57, 1),
                                                  )),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 30.0,
                                                    left: 0,
                                                    right: 10),
                                                child: Container(
                                                  height: 25,
                                                  width: 80,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30),
                                                      color:
                                                          Colors.green.shade50),
                                                  child: Center(
                                                    child: Text(
                                                      "completed",
                                                      style: GoogleFonts.ubuntu(
                                                          textStyle: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Colors.green,
                                                      )),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            //),
                          );
                        
                      })),

                  //-----------------------------------------------------------------
                  // completed order
                  ListView.builder(
                      itemCount: 5,
                      itemBuilder: ((context, index) {
                        return Container(
                          
                            child: 
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                      print("order clicked");
                                      Get.to(OrderDetails());
                
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(top: 25),
                                    height: displayHeight(context) * 0.14,
                                    width: displayWidth(context) / 1.17,
                                    decoration: Constants.containerstyle(),
                                    child: Row(
                                      children: [
                                        Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 20.0, left: 8.0),
                                              child: Image.asset(
                                                  "assets/images/foodimages/kfc.png"),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: displayWidth(context) * 0.035,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 15.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "KFC",
                                                style: GoogleFonts.ubuntu(
                                                    textStyle: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black,
                                                )),
                                              ),
                                              SizedBox(
                                                height: 8,
                                              ),
                                              Text(
                                                "Mighty Zinger",
                                                style: GoogleFonts.ubuntu(
                                                    textStyle: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14,
                                                  color: Color.fromRGBO(
                                                      154, 154, 157, 1),
                                                )),
                                              ),
                                              SizedBox(
                                                height: 9,
                                              ),
                                              Text(
                                                "17/5/2021, 22:32",
                                                style: GoogleFonts.ubuntu(
                                                    textStyle: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14,
                                                  color: Color.fromRGBO(
                                                      154, 154, 157, 1),
                                                )),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: displayWidth(context) * 0.08,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 15.0,
                                                  left: 0,
                                                  right: 10),
                                              child: Text(
                                                "\$80.00",
                                                style: GoogleFonts.ubuntu(
                                                    textStyle: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color.fromRGBO(
                                                      237, 41, 57, 1),
                                                )),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 30.0,
                                                  left: 0,
                                                  right: 10),
                                              child: Container(
                                                height: 25,
                                                width: 80,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                    color:
                                                        Colors.green.shade50),
                                                child: Center(
                                                  child: Text(
                                                    "completed",
                                                    style: GoogleFonts.ubuntu(
                                                        textStyle: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.green,
                                                    )),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          
                        );
                      })),

                  //-----------------------------------------------------------------
                  // failed order

                   ListView.builder(
                    itemCount: 5,
                    itemBuilder: ((context, index) {
                    return  Container(
                    
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                                print("order clicked");
                                      Get.to(OrderDetails());
                
                              
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: 25),
                              height: displayHeight(context) * 0.14,
                              width: displayWidth(context) / 1.17,
                              decoration: Constants.containerstyle(),
                              child: 
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20.0, left: 8.0),
                                        child: Image.asset(
                                            "assets/images/foodimages/kfc.png"),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: displayWidth(context) * 0.035,
                                  ),
                                
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "KFC",
                                          style: GoogleFonts.ubuntu(
                                              textStyle: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                          )),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          "Mighty Zinger",
                                          style: GoogleFonts.ubuntu(
                                              textStyle: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            color: Color.fromRGBO(
                                                154, 154, 157, 1),
                                          )),
                                        ),
                                        SizedBox(
                                          height: 9,
                                        ),
                                        Text(
                                          "17/5/2021, 22:32",
                                          style: GoogleFonts.ubuntu(
                                              textStyle: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            color: Color.fromRGBO(
                                                154, 154, 157, 1),
                                          )),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: displayWidth(context) * 0.08,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 15.0, left: 0,right: 10),
                                        child: Text(
                                          "\$80.00",
                                          style: GoogleFonts.ubuntu(
                                              textStyle: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                            color:
                                                Color.fromRGBO(237, 41, 57, 1),
                                          )),
                                        ),
                                      ),
                                  Padding(
                                        padding: const EdgeInsets.only(
                                            top: 30.0, left: 0,right: 10),
                                        child: Container(
                                          height: 25,
                                          width: 80,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(30),
                                            color: Colors.red.shade50
                                          ),
                                          child: 
                                          Center(
                                            child: Text(
                                              "Failed",
                                              style: GoogleFonts.ubuntu(
                                                  textStyle: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color:
                                                    Colors.red,
                                              )),
                                            ),
                                          ),
                                        ),
                                      ),
                                  
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    
                  );
                 
                  })),


                 
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: TabBarViewData(),
    );
  }
}
