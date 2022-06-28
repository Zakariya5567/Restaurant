import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant/Theme/Theme.dart';
import 'package:restaurant/controller/categories_controller.dart';
import 'package:restaurant/controller/order_controller.dart';
import 'package:restaurant/services/categories_api.dart';
import 'package:restaurant/utills/Displaywidth.dart';
import 'package:restaurant/utills/apiurl.dart';
import 'package:restaurant/views/pages/category/categories_product.dart';
import 'package:restaurant/views/pages/category/uploadcategoryinfo.dart';
import 'package:restaurant/views/pages/category/uploadsubcategoryinfo.dart';
import 'package:restaurant/views/pages/order/orders.dart';
import 'package:restaurant/views/widgets/side_menu_bar.dart';
import 'package:restaurant/views/widgets/tab_bar_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final CategoriesController categoriesController = Get.put(CategoriesController());
  ApiUrl apiUrl = ApiUrl();

     OrderController orderController=Get.put(OrderController());

  setIndex(){
     orderController.setseletctIndex(2);
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
    return WillPopScope(
      onWillPop: () {
        Get.offAll(OrderPage());
      },
      child: Scaffold(
        key: _scaffoldKey,
        drawer: SideMenuBar(),
        body:

            // categoriesController.isLoading==false?
            SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Container(
            height: displayHeight(context) - kBottomNavigationBarHeight,
            width: displayWidth(context),
            margin: const EdgeInsets.only(top: 50.0, right: 15, left: 15),
            child: Column(
              children: [
                //app bar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: () {
                          _scaffoldKey.currentState.openDrawer();
                        },
                        child: SizedBox(
                            height: 50,
                            width: 40,
                            child: Image.asset("assets/images/Menu.png"))),
                    Text(
                      'Dashboard',
                      style: GoogleFonts.ubuntu(
                          textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(0, 0, 0, 1),
                      )),
                    ),
                    Container(
                      width: 10,
                    ),
                  ],
                ),

                //search bar
                Container(
                  margin: const EdgeInsets.only(top: 25, left: 20),
                  height: displayHeight(context) * 0.066,
                  width: displayWidth(context) / 1.17,
                  decoration: Constants.containerstyle(),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Image.asset("assets/images/Search.png"),
                      suffixIcon: Image.asset("assets/images/Filter.png"),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 30,
                ),

                Container(
                  height: MediaQuery.of(context).size.height / 1.6,
                  width: MediaQuery.of(context).size.width,
                  child: SingleChildScrollView(
                    physics: ScrollPhysics(),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Categories',
                                style: GoogleFonts.ubuntu(
                                    textStyle: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                )),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.off(const CategoryInfo(),
                                      duration:
                                          const Duration(milliseconds: 500),
                                      transition: Transition.leftToRight,
                                      curve: Curves.easeInOut);
                                },
                                child: Container(
                                  height: 30.0,
                                  width: 30.0,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color:
                                        const Color.fromRGBO(237, 41, 57, 0.1),
                                  ),
                                  child: const Text(
                                    "+",
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 18),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        GetBuilder(
                            init: CategoriesController(),
                            builder: (controller) {
                              return categoriesController.isLoading == true
                                  ? const Padding(
                                      padding: EdgeInsets.only(top: 200.0),
                                      child: Center(
                                          child: SpinKitFadingFour(
                                        color: Colors.black,
                                        size: 40,
                                      )))
                                  : categoriesController
                                              .restaurantCategoryListModel
                                              .data
                                              .isBlank ||
                                          categoriesController
                                              .restaurantCategoryListModel
                                              .data
                                              .isEmpty
                                      ? const Padding(
                                          padding: EdgeInsets.only(top: 200.0),
                                          child: Center(
                                            child: Text(
                                              "Categories not availabe!",
                                              style:
                                                  TextStyle(color: Colors.red),
                                            ),
                                          ),
                                        )
                                      : Container(
                                          child: GridView.builder(
                                              physics: const ScrollPhysics(),
                                              shrinkWrap: true,
                                              gridDelegate:
                                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                crossAxisSpacing: 10,
                                                mainAxisSpacing: 10,
                                                childAspectRatio: (2 / 2.5),
                                              ),
                                              itemCount: categoriesController
                                                  .restaurantCategoryListModel
                                                  .data
                                                  .length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                final category =
                                                    categoriesController
                                                        .restaurantCategoryListModel
                                                        .data[index];
                                                print(
                                                    "image url is : ${category.categoryImage}");
                                                return InkWell(
                                                  onTap: () async {
                                                    categoriesController
                                                        .setLoading(true);
                                                    categoriesController
                                                        .setProductName(
                                                            category.name);

                                                    categoriesController
                                                        .setServiceId(
                                                            category.serviceId);

                                                    print(
                                                        "servcie id :${category.serviceId}");

                                                    Get.off(
                                                        const CategoryProduct(),
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    500),
                                                        transition: Transition
                                                            .leftToRight,
                                                        curve:
                                                            Curves.easeInOut);

                                                    await categoriesController
                                                        .getProductList();

                                                    categoriesController
                                                        .setLoading(false);
                                                  },
                                                  child: Stack(
                                                    children: [
                                                      Container(
                                                        // color: Colors.red,
                                                        decoration: Constants
                                                            .containerstyle(),
                                                        height: displayHeight(
                                                                context) *
                                                            0.225,
                                                        width: displayWidth(
                                                                context) /
                                                            2.2,
                                                        margin: const EdgeInsets
                                                            .only(
                                                          top: 50,
                                                        ),
                                                      ),
                                                      Positioned(
                                                        top: 5,
                                                        left: displayWidth(
                                                                context) *
                                                            0.05,
                                                        child: Container(
                                                          height: 130,
                                                          width: 125,
                                                          decoration:
                                                              BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  color: Colors
                                                                      .grey,
                                                                  image:
                                                                      DecorationImage(
                                                                    fit: BoxFit
                                                                        .cover,
                                                                    image: NetworkImage(
                                                                        "${category.categoryImage}"),
                                                                  )),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                bottom: 30.0,
                                                                left: 10,
                                                                right: 10),
                                                        child: 
                                                        Padding(
                                                          padding: const EdgeInsets.only(bottom:10.0),
                                                          child: Align(
                                                              alignment: Alignment
                                                                  .bottomCenter,
                                                              child: Text(
                                                                category.name,
                                                                //"Mattan karahi",
                                                                style: GoogleFonts
                                                                    .ubuntu(
                                                                        textStyle:
                                                                            const TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          1),
                                                                )),
                                                              )),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              }),
                                        );
                            }),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        //:progressIndicator(),

        bottomNavigationBar: const TabBarViewData(),
      ),
    );
  }

  // Widget progressIndicator(){
  //   return CircularProgressIndicator(
  //     color: Colors.black,
  //   );
  // }
}
