// import 'dart:html';

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
import 'package:restaurant/views/pages/order/history_orders.dart';
import 'package:restaurant/views/pages/order/orderDetails.dart';
import 'package:restaurant/views/pages/order/scheduled_orders.dart';
import 'package:restaurant/views/pages/order/today_orders.dart';
import 'package:restaurant/views/widgets/side_menu_bar.dart';
import 'package:restaurant/views/widgets/tabButton.dart';
import 'package:restaurant/views/widgets/tab_bar_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:matrix4_transform/matrix4_transform.dart';
// import 'package:restaurant_app/Theme/Theme.dart';
// import 'package:restaurant_app/views/widgets/progress_status_bar_widget.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key key}) : super(key: key);

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectPage = 0;
  PageController _pageControle;

  

  final CategoriesController categoriesController = Get.put(CategoriesController());
  final OrderController orderController = Get.put(OrderController());
 

  void _changePage(int pageNumber) {
    setState(() {
      _selectPage = pageNumber;
      _pageControle?.animateToPage(
        pageNumber,
        duration: Duration(milliseconds: 1000),
        curve: Curves.fastLinearToSlowEaseIn,
      );
    });
  }

  getOrderList() async{

     Future.delayed(Duration.zero,(){
      orderController.setLoading(true);
    });
 
 
     await orderController.getOrderList();
 Future.delayed(Duration.zero,(){
      orderController.setLoading(false);
    });
    


  }


  setIndex(){
    Future.delayed(Duration.zero,(){
     orderController.setseletctIndex(1);
    });

  }



  @override
  void initState() {

       setIndex();

    getOrderList();

    _pageControle = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageControle?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: SideMenuBar(),
      body: Container(
        height: displayHeight(context) - kBottomNavigationBarHeight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40.0, left: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      icon: Image.asset("assets/images/Menu.png"),
                      // icon: Icon(Icons.menu, color: Color(0xFF1f186f),),
                      onPressed: () async {
                        _scaffoldKey.currentState.openDrawer();
                       
                      }),
                  SizedBox(
                    width: displayWidth(context) * 0.25,
                  ),
                  Text(
                    "Orders",
                    style: GoogleFonts.ubuntu(
                        textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(0, 0, 0, 1),
                    )),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),

            //tabview

            Container(
              padding: EdgeInsets.symmetric(
                vertical: 0.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TabButton(
                    text: "Today",
                    pageNumber: 0,
                    selectedPage: _selectPage,
                    onPressed: () {
                      _changePage(0);
                    },
                  ),
                  TabButton(
                    text: "Scheduled",
                    pageNumber: 1,
                    selectedPage: _selectPage,
                    onPressed: () {
                      _changePage(1);
                    },
                  ),
                  TabButton(
                    text: "History",
                    pageNumber: 2,
                    selectedPage: _selectPage,
                    onPressed: () {
                      _changePage(2);
                    },
                  ),
                ],
              ),
            ),

            //search bar

            Container(
              margin: EdgeInsets.only(top: 20, left: 25),
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

            // page view orders

            Expanded(
              child: PageView(
                onPageChanged: (int page) {
                  setState(() {
                    _selectPage = page;
                  });
                },
                controller: _pageControle,
                children: [
                  //----------------------------------------------------------------
                  // list of orders

                  TodayOrders(),
                  ScheduledOrders(),
                  HistoryOrders(),

                
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
