import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:restaurant/Theme/Theme.dart';
import 'package:restaurant/controller/categories_controller.dart';
import 'package:restaurant/services/categories_api.dart';
import 'package:restaurant/services/login_api.dart';
import 'package:restaurant/utills/Displaywidth.dart';
import 'package:restaurant/views/pages/category/categories_product.dart';
import 'package:restaurant/views/pages/category/categoryPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

class CategoryInfo extends StatefulWidget {
  const CategoryInfo({Key key}) : super(key: key);

  @override
  _CategoryInfoState createState() => _CategoryInfoState();
}

class _CategoryInfoState extends State<CategoryInfo> {
  CategoriesController categoriesController = Get.put(CategoriesController());
  TextEditingController categoryController = TextEditingController();

  File image;
  File coverImage;
  final picker = ImagePicker();

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

  Future getCoverImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        coverImage = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future<File> writeImageTemp(String base64Image, String imageName) async {
    final dir = await getTemporaryDirectory();
    await dir.create(recursive: true);
    final tempFile = File(path.join(dir.path, imageName));
    await tempFile.writeAsBytes(base64.decode(base64Image));
    return tempFile;
  }

  @override
  Widget build(BuildContext context) {
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
              // child: Container(
              //   height: displayHeight(context),
              //   width: displayWidth(context),
                child:
               categoriesController.isLoading == true
                                      ? const Padding(
                                          padding: EdgeInsets.only(top: 250.0),
                                          child: Center(
                                              child: SpinKitFadingFour(
                                            color: Colors.black,
                                            size: 40,
                                          )))
                                      :  Column(
                  children: [
                    Container(
                      height: 80,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 40.0, left: 15.0, right: 15.0),
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
                            Text("Category Title",
                                style: GoogleFonts.ubuntu(
                                    textStyle: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                        color: const Color.fromRGBO(0, 0, 0, 1)))),
                            Image.asset("assets/images/foodimages/Delete1.png")
                          ],
                        ),
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        print("object");
                        getCoverImage();
                      },
                      child: Container(
                          //height: displayHeight(context) * 0.38,
                          height: 200,
                          width: displayWidth(context),
                          color: Color.fromRGBO(0, 0, 0, 0.4),
                          child: coverImage != null
                              ? Image.file(
                                  coverImage,
                                  height: 130,
                                  width: 130,
                                  fit: BoxFit.fill,
                                )
                              : Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.camera_alt),
                                      Text("Upload Cover Picture  ")
                                    ],
                                  ),
                                )

                          //Icon(Icons.camera_alt_outlined),
                          ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                        onTap: () {
                          getImage();
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
                                : Icon(Icons.camera_alt_outlined),
                            borderRadius: BorderRadius.circular(150.0),
                          ),
                        )),
                    const SizedBox(
                      height: 20,
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
                    Divider(),
                    const SizedBox(
                      height: 20,
                    ),
                    
                             Container(
                        height: displayHeight(context) * 0.1,
                        width: displayWidth(context) * 0.8,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Category Name",
                              style: GoogleFonts.ubuntu(
                                  textStyle: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromRGBO(0, 0, 0, 0.4))),
                            ),
                            TextField(
                              controller: categoryController,
                            ),
                          ],
                        )),
                    const SizedBox(
                      height: 70,
                    ),

                    //add button to add catrgories

                    InkWell(
                      onTap: () async {

                        if(coverImage==null){
                           ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: const Text('Please upload cover image first')));
                       
                        }
                         else if(image==null){
                           ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: const Text('Please upload image first')));
                       
                        }
                           else if(categoryController.text.isEmpty){
                           ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: const Text('Please Add category name')));
                       
                        }

                       else if(coverImage != null && image != null 
                        && categoryController.text.isNotEmpty){

                          
                          categoriesController.setLoading(true);

                          

                        await categoriesController.adduploadCategories(
                            categoryController.text, image, coverImage);

                               categoriesController.setLoading(false);

                        categoryController.clear();

                        setState(() {
                          image = null;
                          coverImage = null;
                        });

                         

                          categoriesController.setLoading(true);
                      Get.to(() => CategoryPage(),
                      duration: Duration(milliseconds: 500),
                                  transition: Transition.leftToRight,
                                  curve: Curves.easeInOut);
                        

                       await categoriesController.getCatrgoriesList();
                     
                       categoriesController.setLoading(false);



                        }
                        // else{
                        //   ScaffoldMessenger.of(context).showSnackBar(
                        //         const SnackBar(
                        //             content: const Text('Please fill all fields first')));
                        // }
                         
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: displayHeight(context) * 0.09,
                        width: displayWidth(context) * 0.8,
                        decoration: Constants.buttonstyle(),
                        child: Text(
                          "Add",
                          style: GoogleFonts.ubuntu(
                              textStyle: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(246, 246, 249, 1))),
                        ),
                      ),
                    ),
                    
                    const SizedBox(
                      height: 30,
                    )
                 
                  ],
                ),
             // ),
            ),
          );
        }
      ),
    );
  }
}
