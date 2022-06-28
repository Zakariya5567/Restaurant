import 'dart:async';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:restaurant/Theme/Theme.dart';
import 'package:restaurant/controller/documents_controller.dart';
import 'package:restaurant/controller/login_controller.dart';
import 'package:restaurant/controller/otp_controller.dart';
import 'package:restaurant/services/login_api.dart';
import 'package:restaurant/utills/Displaywidth.dart';
import 'package:restaurant/utills/apiurl.dart';
import 'package:restaurant/utills/customtextbutton.dart';
import 'package:restaurant/views/pages/document/add_document.dart';
import 'package:restaurant/views/pages/document/documents.dart';
import 'package:restaurant/views/pages/order/orders.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class OTPSCREEN extends StatefulWidget {
  final String phone;
  OTPSCREEN(this.phone);

  // const OTPSCREEN({Key? key}) : super(key: key);

  @override
  _OTPSCREENState createState() => _OTPSCREENState();
}

class _OTPSCREENState extends State<OTPSCREEN> {
  LoginController loginController = Get.put(LoginController());
  DocumentsController documentsController = Get.put(DocumentsController());
  Otpcontroller otpcontroller = Get.put(Otpcontroller());

  String _verificationCode;
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  String _firebaseToken;
  String _currentTimeZone;

  bool isVerify = false;
  bool buttonColor;

  final int _duration = 30;

  final CountDownController _controller = CountDownController();

  final BoxDecoration pinPutDecoration = const BoxDecoration(
    border: Border(
      bottom: BorderSide(width: 1, color: Colors.black),
      // color: const Color.fromRGBO(126, 203, 224, 1),
    ),
  );

  String fcm_token;
  getToken() async {
    await FirebaseMessaging.instance.getToken().then((token) {
      fcm_token = token;
      print("fcm_token is : $fcm_token");
    });
  }
  
  _verifyPhone() async {
    otpcontroller.setOtp(true);

    startCounter();
  
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '${widget.phone}',
      timeout: const Duration(seconds: 30),
      verificationCompleted: (PhoneAuthCredential credential) async {
        await FirebaseAuth.instance.signInWithCredential(credential);
        otpcontroller.setOtp(false);
        _controller.pause();
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: const Text("verification Failed.")));
        otpcontroller.setOtp(false);
        _controller.pause();
      },
      codeSent: (String verficationID, int resendToken) {
        setState(() {
          _verificationCode = verficationID;
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content:
                  Text('code sent succesfully! Please check your messages')));
        });
        otpcontroller.setOtp(false);
        _controller.pause();
      },
      codeAutoRetrievalTimeout: (String verificationID) {
        setState(() {
          _verificationCode = verificationID;
        });
      },
      // timeout: Duration(seconds: 25),
    );
  }
   _gettimezone() async {
    _currentTimeZone = await FlutterNativeTimezone.getLocalTimezone();
    // return _currentTimeZone;
  }

   startCounter()async{
    Future.delayed(Duration.zero,(){
 Timer(Duration.zero, () {
   _controller.start();
});
    });
  
    
  }


  @override
  void initState() {
    super.initState();
    getToken();
    _verifyPhone();
    _firebaseMessaging.getToken().then((token) {
      _firebaseToken = token;
    });
    _gettimezone();
  }

  @override
  void dispose() {
    super.dispose();
  }

 

  resendOtp() {
     getToken();
    _verifyPhone();
    _firebaseMessaging.getToken().then((token) {
      _firebaseToken = token;
    });
    _gettimezone();
  }

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Material(
              elevation: 1,
              borderRadius: BorderRadius.circular(30.0),
              child: Container(
                height: displayHeight(context) / 2,
                width: displayWidth(context),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: displayHeight(context) / 2 * 0.066,
                    ),
                    Image(
                        image:
                            const AssetImage("assets/images/vendor_logo.png"),
                        height: displayHeight(context) * 0.25,
                        width: displayWidth(context) * 0.45),
                    SizedBox(
                      height: displayHeight(context) / 2 * 0.066,
                    ),
                    Text(
                      "OTP VERIFICATION ",
                      style: GoogleFonts.ubuntu(
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 22,
                          color: Colors.black,
                        ),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: displayHeight(context) / 2 * 0.045,
                    ),
                    Text(
                      "Enter the OTP sent on your phone number",
                      style: GoogleFonts.ubuntu(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //second part of the screen
            loginController.isLoading == true
                ? const Padding(
                    padding: EdgeInsets.only(top: 50.0),
                    child: Center(
                        child: SpinKitFadingFour(
                      color: Colors.black,
                      size: 40,
                    )))
                : GetBuilder(
                    init: Otpcontroller(),
                    builder: (controller) {
                      return Container(
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: displayHeight(context) / 2 * 0.12,
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 2.0,
                                    ),
                                    child: PinPut(
                                      fieldsCount: 6,
                                      textStyle: const TextStyle(
                                          fontSize: 25.0, color: Colors.black),
                                      eachFieldWidth: 40.0,
                                      eachFieldHeight: 55.0,
                                      focusNode: _pinPutFocusNode,
                                      controller: _pinPutController,
                                      submittedFieldDecoration:
                                          pinPutDecoration,
                                      selectedFieldDecoration: pinPutDecoration,
                                      followingFieldDecoration:
                                          pinPutDecoration,
                                      pinAnimationType: PinAnimationType.fade,
                                      onChanged: (pin) {
                                        if (pin.length < 6) {
                                          setState(() {
                                            buttonColor = false;
                                          });
                                        } else {
                                          setState(() {
                                            buttonColor = true;
                                          });
                                        }
                                      },
                                      onSubmit: (pin) async {
                                        try {
                                          await FirebaseAuth.instance
                                              .signInWithCredential(
                                                  PhoneAuthProvider.credential(
                                                      verificationId:
                                                          _verificationCode,
                                                      smsCode: pin))
                                              .then((value) async {
                                            setState(() {
                                              isVerify = true;
                                            });

                                            if (value.user != null) {
                                              await _firebaseMessaging
                                                  .getToken()
                                                  .then((token) {});
                                            }
                                          });
                                        } catch (e) {
                                          FocusScope.of(context).unfocus();
                                          // ScaffoldMessenger.of(context)
                                          //     .showSnackBar(const SnackBar(
                                          //         content:
                                          //             const Text('invalid OTP')));
                                        }
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: displayHeight(context) / 2 * 0.05,
                                  ),

                                  // Resend-----------------------------------------------

                                  Container(
                                    margin: const EdgeInsets.only(right: 28),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        const Text(
                                          "Didn't received code?",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            resendOtp();
                                          },
                                          child: Text(
                                            "Resend",
                                            style: const TextStyle(
                                                color: Colors.red),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: displayHeight(context) * 0.08,
                            ),
                            otpcontroller.otp == true
                                ? CircularCountDownTimer(
                                    duration: _duration,
                                    initialDuration: 0,
                                    controller: _controller,
                                    width: MediaQuery.of(context).size.width *
                                        0.08,
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    ringColor: Colors.grey.shade100,
                                    ringGradient: null,
                                    fillColor: Colors.grey.shade100,
                                    fillGradient: null,

                                    backgroundGradient: null,
                                    strokeWidth: 20.0,
                                    strokeCap: StrokeCap.round,

                                    textStyle: const TextStyle(
                                      fontSize: 33.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textFormat: CountdownTextFormat.S,
                                    isReverse: false,

                                    // Handles Animation Direction (true for Reverse Animation, false for Forward Animation).
                                    isReverseAnimation: false,

                                    isTimerTextShown: true,

                                    autoStart: false,

                                    onStart: () {
                                      debugPrint('Countdown Started');
                                    },

                                    onComplete: () {
                                      debugPrint('Countdown Ended');
                                    },
                                  )
                                : SizedBox(
                                    height: 0,
                                  ),
                            SizedBox(
                              height: displayHeight(context) * 0.05,
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.only(left: 35, right: 35),
                              child: CustomTextButton(
                                buttonName: 'VERIFY OTP',
                                buttonTextStyle: GoogleFonts.ubuntu(
                                    textStyle: Constants.loginbuttonstyle()),
                                buttoncolor: buttonColor == true
                                    ? Constants.black_light
                                    : Colors.grey.shade400,
                                height: _height * 0.09,
                                width: displayWidth(context) * 0.9,
                                highlightColor: Constants.black_light,
                                onPressed: () {
                                  print("varification is :$isVerify");

                                  //showbottonSheetDialog();
                                  loginController.setLoading(true);
                                  isVerify == false
                                      ? ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content:
                                                  const Text('invalid OTP')))

                                      // calling login api=====================================

                                      : loginController
                                          .userLogin(widget.phone,
                                              _firebaseToken, _currentTimeZone)

                                          //====================================================
                                          .then((value) async {
                                          SharedPreferences sharedPreferences =
                                              await SharedPreferences
                                                  .getInstance();
                                          sharedPreferences.setString(
                                              "fcm_token",
                                              _firebaseToken.toString());
                                          final token = sharedPreferences
                                              .getString('fcm_token');

                                          sharedPreferences.setBool(
                                              "isLogin", true);
                                          print("Login true");

                                          // int companyStatus=1;

                                          if (loginController.loginApiModel
                                                  .company.status ==
                                              0) {
                                            showbottonSheetDialog();
                                          } else if (loginController
                                                  .loginApiModel
                                                  .company
                                                  .status ==
                                              1) {
                                            Get.offAll(
                                              () => OrderPage(),
                                            );
                                          }
                                        });
                                  loginController.setLoading(false);
                                },
                                textStyle: const TextStyle(),
                              ),
                            ),
                            SizedBox(
                              height: displayHeight(context) * 0.04,
                            ),
                          ],
                        ),
                      );
                    }),
          ],
        ),
      ),
    );
  }

  showbottonSheetDialog() {
    return showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      backgroundColor: Colors.white,
      isScrollControlled: true,
      context: context,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height / 2.8,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //SizedBox(height:10),

              Text(
                "Your application in under review please contact admin!",
                style: GoogleFonts.ubuntu(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              SizedBox(height: 40),

              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (() async {
                      documentsController.setLoading(true);
                      Get.off(() => DocumentsPage(),
                          duration: Duration(milliseconds: 500),
                          transition: Transition.leftToRight,
                          curve: Curves.easeInOut);

                      await documentsController.getAllDocumnents();

                      documentsController.setLoading(false);
                    }),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.black),
                      height: 45,
                      width: MediaQuery.of(context).size.width / 1.5,
                      child: Center(
                        child: Text(
                          "Verify Documnent",
                          style: GoogleFonts.ubuntu(
                              fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: (() {
                      Get.back();
                    }),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.black),
                      height: 45,
                      width: MediaQuery.of(context).size.width / 2,
                      child: Center(
                        child: Text("Cancel",
                            style: GoogleFonts.ubuntu(
                                fontSize: 16, color: Colors.white)),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
