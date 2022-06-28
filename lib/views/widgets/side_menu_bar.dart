import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant/controller/categories_controller.dart';
import 'package:restaurant/controller/documents_controller.dart';
import 'package:restaurant/controller/earning_controller.dart';
import 'package:restaurant/controller/order_controller.dart';
import 'package:restaurant/controller/profile_controller.dart';
import 'package:restaurant/views/pages/accountSetting/accountSetting.dart';
import 'package:restaurant/views/pages/category/categoryPage.dart';
import 'package:restaurant/views/pages/document/documents.dart';
import 'package:restaurant/views/pages/earning/earning.dart';
import 'package:restaurant/views/pages/firstScreen/splash_screen.dart';
import 'package:restaurant/views/pages/order/orderHistory.dart';
import 'package:restaurant/views/pages/order/order_history_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SideMenuBar extends StatelessWidget {
  SideMenuBar({Key key}) : super(key: key);
  CategoriesController categoriesController = Get.put(CategoriesController());
  DocumentsController documentsController=Get.put(DocumentsController());
  ProfileController profileController=Get.put(ProfileController());
  OrderController orderController =Get.put(OrderController());
  EarningController earningController=Get.put(EarningController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(padding: EdgeInsets.all(10.0),
          
          children: [
            
                  GetBuilder(
                    init: ProfileController
                    (),
                    builder: (controller) {
                      return Padding(
                        padding: const EdgeInsets.only(top:30),
                        child: Row(
                          children: [
                            
                            // Icon(buttonIcon.icon,color: Colors.deepOrangeAccent,),
                            Container(
                              height: MediaQuery.of(context).size.height*0.15,
                              width: MediaQuery.of(context).size.width*0.25,
                              
                              decoration: BoxDecoration(
                                color: Colors.black,
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: 
                                   profileController.getProfileModel.data.profileImage==null?
                                  AssetImage('assets/images/vendor_logo.png')
                                  : NetworkImage(
                                                  profileController.getProfileModel.data.profileImage,
                                                  
                                                ),
                                )
                                
                              ),
                            
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            profileController.getProfileModel.data.name==null?
                                Text(
                               "Name",
                              style: TextStyle(
                                  color: Colors.grey.shade200,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20),
                            ):
                            Text(
                                profileController.getProfileModel.data.name,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                      );
                    }
                  ),
                
             

            Divider( color: Colors.black26),
            Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        title: Text("Account Setting",
                            style: GoogleFonts.ubuntu(
                                textStyle: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              color: Colors.black,
                            ))),
                        onTap: () async{
                    profileController.setLoading(true);
                    Navigator.pop(context);
                      Get.to
                      (AccountSetting(),
                          duration: Duration(milliseconds: 500),
                          transition: Transition.leftToRight,
                          curve: Curves.easeInOut);
                     await profileController.getProfile();
                      profileController.setLoading(false);
                      
                        },
                      ),
                      Divider(),
                      ListTile(
                        title: Text("Order History",
                            style: GoogleFonts.ubuntu(
                                textStyle: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              color: Colors.black,
                            ))),
                        onTap: () async{

                          Navigator.pop(context);
                          
                          
                          Get.to(OrderHistoryPage(),
                            //OrdersHistory(),
                              duration: Duration(milliseconds: 500),
                              transition: Transition.leftToRight,
                              curve: Curves.easeInOut);
                             
                              

                        },
                      ),
                      Divider(),
                      ListTile(
                        title: Text("Category",
                            style: GoogleFonts.ubuntu(
                                textStyle: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              color: Colors.black,
                            ))),
                        onTap: () async{
                          categoriesController.setLoading(true);
                           Navigator.pop(context);
                           Get.to(CategoryPage(),
                              duration: Duration(milliseconds: 500),
                              transition: Transition.leftToRight,
                              curve: Curves.easeInOut);
                          await categoriesController.getCatrgoriesList();
                          categoriesController.setLoading(false);
                        },
                      ),
                      Divider(),
                      ListTile(
                        title: Text("Earning",
                            style: GoogleFonts.ubuntu(
                                textStyle: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              color: Colors.black,
                            ))),
                        onTap: ()async {
                           Navigator.pop(context);
                          Get.to(Earning(),
                             duration: Duration(milliseconds: 500),
                              transition: Transition.leftToRight,
                              curve: Curves.easeInOut);
                              earningController.setLoading(true);

                            await earningController.getEarningList();

                           earningController.setLoading(false);
                     
                        },
                      ),
                      Divider(),
                      //Documents
                       ListTile(
                        title: Text("Documents",
                            style: GoogleFonts.ubuntu(
                                textStyle: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              color: Colors.black,
                            ))),
                        onTap: ()async {
                          
                            documentsController.setLoading(true);
                           Navigator.pop(context);
                          Get.to(DocumentsPage(),
                             );
                              
                              await documentsController.getAllDocumnents();

                              documentsController.setLoading(false);
                        },
                      ),
                      Divider(),

                       Divider(),
                      //Documents
                       ListTile(
                        title: Text("Logout",
                            style: GoogleFonts.ubuntu(
                                textStyle: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              color: Colors.red,
                            ))),
                        onTap: ()async {
                          
                            SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                             await sharedPreferences.setBool("isLogin", false);
                              Navigator.pop(context);
                             Get.offAll(FirstScreen()); 
                             
                        },
                      ),
                      Divider(),
                      
                    ],
                  ),
                ))
          ]),
    );
  }
}
