import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant/controller/categories_controller.dart';
import 'package:restaurant/controller/earning_controller.dart';
import 'package:restaurant/controller/order_controller.dart';
import 'package:restaurant/controller/profile_controller.dart';
import 'package:restaurant/views/pages/accountSetting/accountSetting.dart';
import 'package:restaurant/views/pages/category/categoryPage.dart';
import 'package:restaurant/views/pages/category/uploadcategoryinfo.dart';
import 'package:restaurant/views/pages/earning/earning.dart';
import 'package:restaurant/views/pages/order/orders.dart';

class TabBarViewData extends StatefulWidget {
  const TabBarViewData({Key key}) : super(key: key);

  @override
  _TabBarViewDataState createState() => _TabBarViewDataState();
}

class _TabBarViewDataState extends State<TabBarViewData> {

  CategoriesController categoriesController = Get.put(CategoriesController());
  OrderController orderController=Get.put(OrderController());
  ProfileController profileController=Get.put(ProfileController());
  EarningController earningController=Get.put(EarningController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: OrderController(),
      builder: (controller) {
        return Container(
          height: 80,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30)),
            boxShadow: [
              BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            child: BottomNavigationBar(
              showSelectedLabels: false,
              showUnselectedLabels: false,
               backgroundColor: Colors.white,
                          type: BottomNavigationBarType.fixed,
                        
                          //  selectedItemColor: Colors.red,
                          //  unselectedItemColor: Colors.white,
                          currentIndex: orderController.selectedIndex,
                           selectedIconTheme: IconThemeData(
                            color: Colors.red,
                          ),
                           unselectedIconTheme: IconThemeData(
                            color: Colors.black,
                          ),
              items: <BottomNavigationBarItem>[

                //Wallet 

                BottomNavigationBarItem(
                  icon: IconButton(
                    icon: const ImageIcon(
                      AssetImage("assets/images/Wallet.png"),
                      //color: Colors.black,
                    ),
                    onPressed: () async{
        
                       orderController.setseletctIndex(0);

                        Get.to(Earning(),
                          duration: Duration(milliseconds: 500),
                          transition: Transition.leftToRight,
                          curve: Curves.easeInOut);

                         earningController.setLoading(true);

                          await earningController.getEarningList();

                           earningController.setLoading(false);
                     
                    },
                  ),
                  label: '',
                ),
               
               //Order

                BottomNavigationBarItem(
                  icon:
                   IconButton(
                     icon: const ImageIcon(
                      AssetImage("assets/images/foodimages/timeicon.png"),
                                 ),
                                 onPressed: ()async {
                                   orderController.setseletctIndex(1);
                                     orderController.setLoading(true);
                                      
                          Get.offAll(() =>OrderPage(),
                         duration: Duration(milliseconds: 500),
                          transition: Transition.leftToRight,
                          curve: Curves.easeInOut);
                          await orderController.getOrderList();
                                       orderController.setLoading(false);
                    },
                   ),
                  label: '',
                ),
                
              //Cateogies
                
                BottomNavigationBarItem(
                  icon: 
                  IconButton(
                    icon: const ImageIcon(
                      AssetImage("assets/images/cate.png"),
                      size: 20,
                     // color: Colors.black,
                    ),
                    onPressed: () async{
                      orderController.setseletctIndex(2);

                      categoriesController.setLoading(true);
                      Get.to(() => CategoryPage(),
                      duration: Duration(milliseconds: 500),
                                  transition: Transition.leftToRight,
                                  curve: Curves.easeInOut);
                        

                       await categoriesController.getCatrgoriesList();
                     
                       categoriesController.setLoading(false);
                    },
                  ),
                  label: '',
                ),

               //Account setting

                BottomNavigationBarItem(
                  icon: 
                  IconButton(
                    icon: const ImageIcon(
                      AssetImage("assets/images/Setting.png"),
                    ),
                    onPressed: () async{
                      orderController.setseletctIndex(3);
                      profileController.setLoading(true);
                      Get.to(AccountSetting(),
                          duration: Duration(milliseconds: 500),
                          transition: Transition.leftToRight,
                          curve: Curves.easeInOut);
                     await profileController.getProfile();
                      profileController.setLoading(false);
                    },
                  ),
                  label: '',
                ),
            
              ],
            ),
          ),
        );
      }
    );
  }
}
