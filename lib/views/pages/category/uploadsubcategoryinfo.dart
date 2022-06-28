import 'dart:io';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:restaurant/Theme/Theme.dart';
import 'package:restaurant/controller/categories_controller.dart';
import 'package:restaurant/utills/Displaywidth.dart';
import 'package:restaurant/utills/customtextbutton.dart';
import 'package:restaurant/views/pages/category/categories_product.dart';
import 'package:restaurant/views/pages/category/categoryPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SubCategoryInfo extends StatefulWidget {
  const SubCategoryInfo({Key key}) : super(key: key);

  @override
  _SubCategoryInfoState createState() => _SubCategoryInfoState();
}

class _SubCategoryInfoState extends State<SubCategoryInfo> {
  CategoriesController categoriesController = Get.put(CategoriesController());

  File image;
  final picker = ImagePicker();
  // String profileImage;
  String apiToken;

  getUserValue() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    apiToken = pref.getString("user_api_token");
    print(apiToken);
  }

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  void initState() {
    getUserValue();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    return WillPopScope(
      // ignore: missing_return
      onWillPop: (() async {
        categoriesController.setLoading(true);
        Get.off(const CategoryPage(),
            duration: const Duration(milliseconds: 500),
            transition: Transition.leftToRight,
            curve: Curves.easeInOut);

        await categoriesController.getCatrgoriesList();

        categoriesController.setLoading(false);
      }),
      child: GetBuilder(
          init: CategoriesController(),
          builder: (controller) {
            return Scaffold(
              body: SingleChildScrollView(
                //child:
                //  Container(
                //   height: displayHeight(context),
                //   width: displayWidth(context),
                child:  categoriesController.uploadLoading == true
                        ?  Padding(
                            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/2),
                            child: Center(
                                child: SpinKitFadingFour(
                              color: Colors.black,
                              size: 40,
                            )))
                        : Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 55.0, left: 15.0, right: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                              onTap: () async {
                                categoriesController.setLoading(true);
                                Get.off(const CategoryPage(),
                                    duration: const Duration(milliseconds: 500),
                                    transition: Transition.leftToRight,
                                    curve: Curves.easeInOut);

                                await categoriesController.getCatrgoriesList();

                                categoriesController.setLoading(false);
                              },
                              child: Image.asset("assets/images/Vector.png")),
                          Text("Product detail",
                              style: GoogleFonts.ubuntu(
                                  textStyle: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromRGBO(0, 0, 0, 1)))),
                          Image.asset("assets/images/foodimages/Delete1.png")
                        ],
                      ),
                    ),
                    Stack(
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(top: 25.0),
                            child: Center(
                              child: InkWell(
                                  onTap: () {
                                    getImage();
                                    // _showPicker(context);
                                  },
                                  child: CircleAvatar(
                                    radius: 60.0,
                                    child: ClipRRect(
                                      child: image != null
                                          ? Image.file(
                                              image,
                                              height: 130,
                                              width: 130,
                                              fit: BoxFit.fill,
                                            )
                                          : 
                                          categoriesController.productPage ==
                                                  "editProduct"
                                              ? Image.network(
                                                  categoriesController
                                                      .updateproductImage,
                                                  height: 130,
                                                  width: 130,
                                                  fit: BoxFit.fill,)
                                                : Icon(Icons.camera_alt_outlined),
                                             
                                      borderRadius:
                                          BorderRadius.circular(150.0),
                                    ),
                                  )),
                            )),
                        Positioned(
                            top: MediaQuery.of(context).size.height * 0.15,
                            right: MediaQuery.of(context).size.width * 0.35,
                            // top: displayHeight(context) * 0.243,
                            // right: displayWidth(context) * 0.24,
                            child: GestureDetector(
                              onTap: () {
                                print("image picking");
                                getImage();
                              },
                              child: Container(
                                  height: 30,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      border: Border.all(
                                        color: Colors.red[500],
                                      ),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20))),
                                  child:
                                      Image.asset("assets/images/Camera.png")),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 20,
                      alignment: Alignment.center,
                      child: Text(
                        "Upload Product Picture",
                        style: GoogleFonts.ubuntu(
                            textStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(0, 0, 0, 0.4),
                        )),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                   SingleChildScrollView(
                            child: Container(
                                height: displayHeight(context) * 0.63,
                                width: displayWidth(context) * 0.8,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Divider(
                                    //   thickness: 1.2,
                                    //   color: Colors.black38,
                                    // ),
                                    Text(
                                      "Product Name",
                                      style: GoogleFonts.ubuntu(
                                          textStyle: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: const Color.fromRGBO(
                                                  0, 0, 0, 0.4))),
                                    ),
                                    TextField(
                                      controller:
                                          categoriesController.txtproductName,
                                          
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      "Short Discription",
                                      style: GoogleFonts.ubuntu(
                                          textStyle: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: Color.fromRGBO(
                                                  0, 0, 0, 0.4))),
                                    ),
                                    TextField(
                                      controller:
                                          categoriesController.txtshortDisc,
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      "Original Price",
                                      style: GoogleFonts.ubuntu(
                                          textStyle: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: Color.fromRGBO(
                                                  0, 0, 0, 0.4))),
                                    ),
                                    TextField(
                                      controller:
                                          categoriesController.txtorignalPrice,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      "Description",
                                      style: GoogleFonts.ubuntu(
                                          textStyle: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: Color.fromRGBO(
                                                  0, 0, 0, 0.4))),
                                    ),
                                    TextField(
                                      controller:
                                          categoriesController.txtlongDisc,
                                      minLines: 1,
                                      maxLines: 6,
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    InkWell(
                                        child: Container(
                                          height: _height * 0.078,
                                          width: displayWidth(context) * 0.9,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            color: Constants.black_light,
                                          ),
                                          child: Center(
                                            child: Text(
                                              categoriesController
                                                          .productPage ==
                                                      "addProduct"
                                                  ? "Add"
                                                  : "Update",
                                              style:
                                                  Constants.loginbuttonstyle(),
                                            ),
                                          ),
                                        ),
                                        onTap: () async {
                                          if (categoriesController
                                                  .productPage ==
                                              "editProduct") {
                                           
                                              categoriesController
                                                  .setUploadLoading(true);

                                              await categoriesController
                                                  .updateProduct(
                                                categoriesController
                                                    .txtproductName.text,
                                                  image,
                                                categoriesController
                                                    .txtorignalPrice.text,
                                                categoriesController
                                                    .txtshortDisc.text,
                                                categoriesController
                                                    .txtlongDisc.text,
                                                categoriesController.parentId
                                                    .toString(),
                                              );

                                             

                                                  categoriesController
                                                  .setUploadLoading(false);


                                                   categoriesController
                                                        .setLoading(true);

                                                  Get.to(CategoryProduct());
                                                   await categoriesController
                                                        .getProductList();

                                                    categoriesController
                                                        .setLoading(false);
                                            
                                          } else {


                                            if(image==null){
                                                ScaffoldMessenger.of(context)
                                                  .showSnackBar(const SnackBar(
                                                      content: Text(
                                                          'Please upload image first')));
                                           
                                            }
                                                 else if( categoriesController
                                                    .txtproductName
                                                    .text
                                                    .isEmpty){
                                                ScaffoldMessenger.of(context)
                                                  .showSnackBar(const SnackBar(
                                                      content: Text(
                                                          'Please add product name first')));
                                           
                                            }
                                             else if(    categoriesController
                                                    .txtshortDisc
                                                    .text
                                                    .isEmpty){
                                                ScaffoldMessenger.of(context)
                                                  .showSnackBar(const SnackBar(
                                                      content: Text(
                                                          'Please add short description first')));
                                           
                                            }
                                            else if( categoriesController
                                                    .txtorignalPrice
                                                    .text
                                                    .isEmpty){
                                                ScaffoldMessenger.of(context)
                                                  .showSnackBar(const SnackBar(
                                                      content: Text(
                                                          'Please add price first')));
                                           
                                            }
                                             else if(categoriesController.txtlongDisc
                                                    .text.isEmpty){
                                                ScaffoldMessenger.of(context)
                                                  .showSnackBar(const SnackBar(
                                                      content: Text(
                                                          'Please description first')));
                                           
                                            }
                                          
                                           else if (image != null &&
                                                categoriesController
                                                    .txtproductName
                                                    .text
                                                    .isNotEmpty &&
                                                categoriesController
                                                    .txtshortDisc
                                                    .text
                                                    .isNotEmpty &&
                                                categoriesController
                                                    .txtorignalPrice
                                                    .text
                                                    .isNotEmpty &&
                                                categoriesController.txtlongDisc
                                                    .text.isNotEmpty) {
                                              categoriesController
                                                  .setUploadLoading(true);
                                              await categoriesController
                                                  .addProduct(
                                                      categoriesController
                                                          .txtproductName.text,
                                                      image,
                                                      categoriesController
                                                          .txtorignalPrice.text,
                                                      categoriesController
                                                          .txtshortDisc.text,
                                                      categoriesController
                                                          .txtlongDisc.text);

                                          
                                                image = null;
                                                categoriesController
                                                    .txtproductName
                                                    .clear();
                                                // profileImage = null;
                                                categoriesController
                                                    .txtorignalPrice
                                                    .clear();
                                                categoriesController
                                                    .txtshortDisc
                                                    .clear();
                                                categoriesController.txtlongDisc
                                                    .clear();
                                              

                                              categoriesController
                                                  .setUploadLoading(false);

                                                    categoriesController
                                                        .setLoading(true);

                                                  Get.to(CategoryProduct());
                                                   await categoriesController
                                                        .getProductList();

                                                    categoriesController
                                                        .setLoading(false);
                                            } 
                                          }
                                        }),
                                  ],
                                )),
                          ),
                    // SizedBox(
                    //   height: 70,
                    // ),
                  ],
                ),
                //  ),
              ),
            );
          }),
    );
  }
}
