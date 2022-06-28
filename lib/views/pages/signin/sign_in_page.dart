// import 'package:country_code_picker/country_code.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant/Theme/Theme.dart';
import 'package:restaurant/utills/Displaywidth.dart';
import 'package:restaurant/utills/customtextbutton.dart';
import 'package:restaurant/views/pages/otp_screen/otp_screen.dart';
// import 'package:restaurant_app/utills/textInputfield.dart';
// import 'package:restaurant_app/utills/validation.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String code = '+92';
  String phoneNumber = "+923043110089";
  String countryName = "Singapore";
  bool buttonColor;

  TextEditingController controllernumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: displayHeight(context) * 0.060,
                    ),
                    Image(
                        image:
                            const AssetImage("assets/images/vendor_logo.png"),
                        height: displayHeight(context) * 0.25,
                        width: displayWidth(context) * 0.45),
                    SizedBox(
                      height: displayHeight(context) * 0.040,
                    ),
                    Text(
                      "Welcome, Let's Start",
                      style: GoogleFonts.ubuntu(
                        textStyle: Constants.welcomestyle(),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: displayHeight(context) / 2 * 0.066,
                    ),
                    Text(
                      "Login",
                      style: GoogleFonts.ubuntu(
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Colors.red,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: displayHeight(context) / 2 * 0.066,
                    ),
                  ],
                ),
              ),
            ),

            //-----------------------------------------------------------------------
            //second part of the screen
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: displayHeight(context) / 2 * 0.08,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 35, right: 35),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

// country code picker --------------------------------------------------------------------------

                        Container(
                          margin: const EdgeInsets.only(left: 12),
                          child: Text(
                            "Country Code",
                            textAlign: TextAlign.start,
                            style: GoogleFonts.ubuntu(
                                textStyle: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black.withOpacity(0.4))),
                          ),
                        ),
                        
                      
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CountryCodePicker(
                                    initialSelection: 'SG',
                                    enabled: true,
                                    // showDropDownButton: true,
                                    onChanged: (value) {
                                      setState(() {
                                        code = value.toString();
                                        countryName = value.name;
                                        print(countryName);
                                        print(code);
                                      });
                                    },
                                  ),
                                  Text(countryName.toString(),
                                      style: GoogleFonts.ubuntu(
                                          color: Colors.black87, fontSize: 15))
                                ],
                              ),
                             
                                  const Icon(Icons.arrow_drop_down_sharp),
                            ],
                          ),
                        


                        Container(
                          margin: const EdgeInsets.only(
                            left: 12,
                          ),
                          // padding: EdgeInsets.only(top: -10),
                          child:const Divider(
                            height: 1,
                            thickness: 1,
                            color: Colors.black54,
                            
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: displayHeight(context) / 2 * 0.066,
                  ),

                // phone number section --------------------------------------------------------------------------               
                  Container(
                    margin: const EdgeInsets.only(left: 45, right: 35),
                    child: Text(
                      "Phone Number",
                      style: GoogleFonts.ubuntu(
                          textStyle: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black.withOpacity(0.4))),
                    ),
                  ),

                  Container(
                      margin: const EdgeInsets.only(left: 45, right: 35),
                      child: TextFormField(
                      //focusNode: FocusNode(),
                        controller: controllernumber,
                        keyboardType: TextInputType.phone,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black54,)
                            ),
                            
                            hintText: 'Enter phone number ',
                            hintStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.black87)
                            //labelText: 'enter Phone Number ',
                            ),
                        // ignore: missing_return
                        validator: (value) {
                          String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                         RegExp regExp = new RegExp(patttern);
                            if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                           }
                          
                          else if(!regExp.hasMatch(value)){
                             return 'Please enter valid phone number';
                           };
                           
                        },
                        onChanged: (value){
                          
                          setState(() {
                        String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                         RegExp regExp = RegExp(patttern);
                          
                            if(!regExp.hasMatch(value)){
                              buttonColor=false;
                            }
                            else{
                              buttonColor=true;
                            }
                          });

                        },
                      )),
                  SizedBox(
                    height: displayHeight(context) / 2 * 0.1,
                  ),

                  //Otp button-----------------------------------------------------------------
                  Container(
                    margin: const EdgeInsets.only(left: 35, right: 35),
                    child: CustomTextButton(
                      buttonName: 'SEND OTP',
                      buttonTextStyle: GoogleFonts.ubuntu(
                          textStyle: Constants.loginbuttonstyle()),
                      buttoncolor: buttonColor==true?Constants.black_light:Colors.grey.shade400,
                      height: _height * 0.09,
                      width: displayWidth(context) * 0.9,
                      highlightColor: Constants.black_light,
                      onPressed: () {
                        setState(() {
                          // here is phone number using with country code

                          phoneNumber = code + controllernumber.text;
                        });
                        // Navigator.pop(context);
                        if (controllernumber.text.isNotEmpty) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OTPSCREEN(phoneNumber)),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      const Text("Enter Your Phone Number.")));
                        }
                      },
                      textStyle: const TextStyle(),
                    ),
                  ),
                ],
              ),
            ),
        
        
          ],
        ),
      ),
    );
  }
}
