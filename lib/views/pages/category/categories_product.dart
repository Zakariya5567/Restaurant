import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant/Theme/Theme.dart';
import 'package:restaurant/controller/categories_controller.dart';
import 'package:restaurant/services/categories_api.dart';
import 'package:restaurant/utills/Displaywidth.dart';
import 'package:restaurant/utills/apiurl.dart';
import 'package:restaurant/views/pages/category/categoryPage.dart';
import 'package:restaurant/views/pages/category/uploadcategoryinfo.dart';
import 'package:restaurant/views/pages/category/uploadsubcategoryinfo.dart';
import 'package:restaurant/views/widgets/side_menu_bar.dart';
import 'package:restaurant/views/widgets/tab_bar_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CategoryProduct extends StatefulWidget {
  const CategoryProduct({Key key}) : super(key: key);

  @override
  _CategoryProductState createState() => _CategoryProductState();
}

class _CategoryProductState extends State<CategoryProduct> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  CategoriesController categoriesController = Get.put(CategoriesController());
  ApiUrl apiUrl = ApiUrl();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // ignore: missing_return
      onWillPop: (() async {
        categoriesController.setLoading(false);
        Get.off(const CategoryPage(),
            duration: const Duration(milliseconds: 500),
            transition: Transition.leftToRight,
            curve: Curves.easeInOut);

        await categoriesController.getCatrgoriesList();

        categoriesController.setLoading(false);
      }),

      child: Scaffold(
        key: _scaffoldKey,
        drawer: SideMenuBar(),

        body:

            // categoriesController.isLoading==false?
            SingleChildScrollView(
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
                        child: Image.asset("assets/images/Menu.png")),
                    Text(
                      categoriesController.productName,
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

                SizedBox(
                  height: 30,
                ),

                Container(
                  //height: 500,
                  height: MediaQuery.of(context).size.height / 1.45,
                  width: MediaQuery.of(context).size.width,
                  child: SingleChildScrollView(
                    physics: ScrollPhysics(),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "List of all ${categoriesController.productName}",
                                style: GoogleFonts.ubuntu(
                                    textStyle: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                )),
                              ),
                              GestureDetector(
                                onTap: () {
                                  categoriesController
                                      .setProductPage("addProduct");

                                  categoriesController
                                      .setUpdateProductImage(null);
                                categoriesController
                                                        .setUpdateProductName(
                                                            "");
                                  categoriesController
                                      .setUpdateProductshortDes("");
                                  categoriesController
                                      .setUpdateProductprice("");
                                  categoriesController
                                      .setUpdateProductlongdes("");

                                  Get.off(SubCategoryInfo(),
                                      duration: Duration(milliseconds: 500),
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

                        //_________________________________________________________

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
                                              .productListModel.data.isEmpty ||
                                          categoriesController
                                              .productListModel.data.isBlank
                                      ? const Padding(
                                          padding: EdgeInsets.only(top: 200.0),
                                          child: Center(
                                            child: Text(
                                              "Product is not availabe!",
                                              style:
                                                  TextStyle(color: Colors.red),
                                            ),
                                          ),
                                        )
                                      : ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          itemCount: categoriesController
                                              .productListModel.data.length,
                                          itemBuilder: ((context, index) {
                                            final product = categoriesController
                                                .productListModel.data[index];
                                            return Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: InkWell(
                                                  onTap: () {
                                                    print("click for edit");
                                                    categoriesController
                                                        .setProductPage(
                                                            "editProduct");
                                                      categoriesController
                                                        .setParentId(
                                                            product.id);
                                                    categoriesController
                                                        .setUpdateProductImage(
                                                            product.imagePath);
                                                    categoriesController
                                                        .setUpdateProductName(
                                                            product.name);
                                                    categoriesController
                                                        .setUpdateProductshortDes(
                                                            product.shortDesc);
                                                    categoriesController
                                                        .setUpdateProductprice(
                                                            product
                                                                .originalPrice
                                                                .toString());
                                                    categoriesController
                                                        .setUpdateProductlongdes(
                                                            product.longDesc);

                                                    print("edit product");

                                                    print(
                                                        "Product id  is:${product.id}");
                                                    Get.off(SubCategoryInfo(),
                                                        duration: Duration(
                                                            milliseconds: 500),
                                                        transition: Transition
                                                            .leftToRight,
                                                        curve:
                                                            Curves.easeInOut);
                                                  },
                                                  child: Card(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                    ),
                                                    child: Container(
                                                      height: 120,
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        color: Colors.white,
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Row(
                                                          children: [
                                                            Container(
                                                              height: 90,
                                                              width: 80,
                                                              decoration:
                                                                  BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10),
                                                                      color: Colors
                                                                          .grey,
                                                                      image:
                                                                          DecorationImage(
                                                                        fit: BoxFit
                                                                            .cover,
                                                                        image: NetworkImage(
                                                                            "${product.imagePath}"),
                                                                      )),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left:
                                                                          10.0,
                                                                      top: 5),
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    product
                                                                        .name,
                                                                    style: const TextStyle(
                                                                        fontSize:
                                                                            18,
                                                                        color: Colors
                                                                            .black87,
                                                                        fontWeight:
                                                                            FontWeight.w500),
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Text(
                                                                      "Rs " +
                                                                          product
                                                                              .originalPrice
                                                                              .toString(),
                                                                      style: const TextStyle(
                                                                          color:
                                                                              Colors.red)),
                                                                  const SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  SizedBox(
                                                                    width: 200,
                                                                    child: Text(
                                                                        product
                                                                            .shortDesc,
                                                                        maxLines:
                                                                            2,
                                                                        style: const TextStyle(
                                                                            color:
                                                                                Colors.black87)),
                                                                  ),
                                                                ],
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ));
                                          }));
                            })
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
