import 'dart:io';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:pinput/pin_put/pin_put_state.dart';
import 'package:restaurant/Theme/Theme.dart';
import 'package:restaurant/controller/order_controller.dart';
import 'package:restaurant/controller/profile_controller.dart';
import 'package:restaurant/utills/Displaywidth.dart';
import 'package:restaurant/utills/customtextbutton.dart';
import 'package:restaurant/views/widgets/tab_bar_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';

class AccountSetting extends StatefulWidget {
  const AccountSetting({Key key}) : super(key: key);

  @override
  _AccountSettingState createState() => _AccountSettingState();
}

class _AccountSettingState extends State<AccountSetting> {

  
  ProfileController profileController = Get.put(ProfileController());
   OrderController orderController=Get.put(OrderController());

  setIndex(){
     orderController.setseletctIndex(3);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero,(){
   setIndex();
    });
  }


  File image;
  final picker = ImagePicker();
  String profileImage;
  String phoneNumber;
  String name;
  String apiToken;
  String imageUploadStatus;

  void showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          didChangeDependencies();
          return SafeArea(
              child: Wrap(
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text("Close")),
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text("Gallery"),
                onTap: () {
                  imageFromGallery();
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text("Camera"),
                onTap: () {
                  imageFromCamera();
                  Navigator.pop(context);
                },
              ),
            ],
          ));
        });
  }

  Future imageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future imageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }


  void _displaySuccessMotionToast(BuildContext context, message) {
    MotionToast.success(
      title: message,
      titleStyle: TextStyle(fontWeight: FontWeight.bold),
      description: "Updated!",
      descriptionStyle: TextStyle(fontSize: 12),
      layoutOrientation: ORIENTATION.RTL,
      animationType: ANIMATION.FROM_RIGHT,
      position: MOTION_TOAST_POSITION.CENTER,
      width: 300,
    ).show(context);
  }

  @override
  void dispose() {
    didChangeDependencies();
    // dependOnInheritedWidgetOfExactType();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: GetBuilder(
          init: ProfileController(),
          builder: (controller) {
            return SingleChildScrollView(
              child: profileController.isLoading == true
                  ? Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 2),
                      child: Center(
                          child: SpinKitFadingFour(
                        color: Colors.black,
                        size: 40,
                      )))
                  : Container(
                      height: displayHeight(context),
                      width: displayWidth(context),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 50.0, left: 20.0, right: 20.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Account",
                                  style: GoogleFonts.ubuntu(
                                      textStyle: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black)),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    "Cancel",
                                    style: GoogleFonts.ubuntu(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 17,
                                          color: Colors.red),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 45.0),
                                  child: InkWell(
                                    onTap: () {
                                      showPicker(context);
                                    },
                                    child: Center(
                                      child: image != null
                                          ? CircleAvatar(
                                              radius: 60.0,
                                              child: ClipRRect(
                                                child: Image.file(
                                                  image,
                                                  height: 150,
                                                  width: 150,
                                                  fit: BoxFit.fill,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        150.0),
                                              ),
                                            )
                                          : 
                                             CircleAvatar(
                                                  radius: 60.0,
                                                  child: ClipRRect(
                                                    child: Image.network(
                                                      profileController
                                                          .getProfileModel.data.profileImage,
                                                      width: 150,
                                                      height: 150,
                                                      fit: BoxFit.fill,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            150.0),
                                                  ),
                                                )
                                              
                                    ),
                                  ),
                                ),
                                Positioned(
                                    top: 135,
                                    right: 117,
                                    // top: displayHeight(context) * 0.243,
                                    // right: displayWidth(context) * 0.24,
                                    child: GestureDetector(
                                      onTap: () {
                                        // _displaySuccessMotionToast(context);
                                        showPicker(context);
                                      },
                                      child: Container(
                                          height: 30,
                                          decoration: BoxDecoration(
                                              color: Colors.red,
                                              border: Border.all(
                                                color: Colors.red[500],
                                              ),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20))),
                                          child: Image.asset(
                                              "assets/images/Camera.png")),
                                    )),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 20, top: 25),
                              height: displayHeight(context) * 0.066,
                              width: displayWidth(context) / 1.17,
                              decoration: Constants.containerstyle(),
                              child: TextField(
                                keyboardType: TextInputType.text,
                                controller: profileController.nameController,
                                decoration: InputDecoration(
                                  hintText:  "Name",
                                  
                                  border: InputBorder.none,
                                  prefixIcon: Image.asset(
                                    "assets/images/Profile.png",
                                    color: Colors.red,
                                  ),
                                  // suffixIcon: Image.asset("assets/images/Filter.png"),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 20, top: 25),
                              height: displayHeight(context) * 0.066,
                              width: displayWidth(context) / 1.17,
                              decoration: Constants.containerstyle(),
                              child: TextField(
                                enableInteractiveSelection: false,
                                focusNode: AlwaysDisabledFocusNode(),
                                controller:profileController.phoneNumberController,
                                decoration: InputDecoration(
                                  hintText: "3213515431",
              
                                  border: InputBorder.none,
                                  prefixIcon:
                                      Image.asset("assets/images/Call.png"),
                                  // suffixIcon: Image.asset("assets/images/Filter.png"),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: displayHeight(context) * 0.15,
                            ),

                            InkWell(
                              onTap: () async {
                            
                                if (image != null) {
                                  profileController.setLoading(true);

                                  await profileController
                                      .updateProfileImage(image);
                                  profileController.setLoading(false);

                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              profileController
                                                  .imageUpdateMessage
                                                  .toString(),
                                              style: GoogleFonts.ubuntu(
                                                textStyle: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                    color: Colors.white),
                                              ))));

                                              image=null;
                                
                                }
                             

                                if (
                                    profileController.nameController.text.isNotEmpty &&
                                    profileController.phoneNumberController.text.isNotEmpty) {
                                      
                                  profileController.setLoading(true);

                                  await profileController.updateUserProfile(
                                      profileController.nameController.text,
                                     profileController. phoneNumberController.text);

                                  profileController.setLoading(false);

                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              profileController
                                                  .profileUpdateMessage
                                                  .toString(),
                                              style: GoogleFonts.ubuntu(
                                                textStyle: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                    color: Colors.white),
                                              ))));

                                              profileController.nameController.text=null;
                                    profileController.phoneNumberController.text=null;
                                }
                                // nameController.clear();
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: displayHeight(context) * 0.08,
                                width: displayWidth(context) * 0.8,
                                decoration: Constants.buttonstyle(),
                                child: Text(
                                  "Update profile",
                                  style: GoogleFonts.ubuntu(
                                      textStyle: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500,
                                          color: Color.fromRGBO(
                                              246, 246, 249, 1))),
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
            );
          }),
      bottomNavigationBar: TabBarViewData(),
    );
  }
}
