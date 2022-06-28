import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant/Theme/Theme.dart';
import 'package:restaurant/controller/documents_controller.dart';
import 'package:restaurant/controller/login_controller.dart';
import 'package:restaurant/utills/Displaywidth.dart';
import 'package:restaurant/utills/customtextbutton.dart';
import 'package:restaurant/views/pages/document/documents.dart';
import 'package:restaurant/views/pages/order/orders.dart';
import 'package:restaurant/views/pages/signin/sign_in_page.dart';
import 'package:restaurant/views/widgets/wavy_first_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {


LoginController loginController=Get.put(LoginController());
DocumentsController documentsController=Get.put(DocumentsController());

 bool isLogin;
 int companyStatus;

  userLogin()async{
  SharedPreferences pref = await SharedPreferences.getInstance();


  var user = pref.getBool("isLogin");
  var status = pref.getInt("company_status");
  if(user == null){
    isLogin=false;
  }
  else{
     isLogin=user;
  }
  if(status == null){
    companyStatus=0;
  }
  else{
    companyStatus=status;
  }
  
  print("Login is :$isLogin");

  }

  @override
  void initState() {
    // TODO: implement initState
    userLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
     final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(

        child: Column(
          children: [
            WavyHeaderImage(),
            SizedBox(height: displayHeight(context)*0.22,),
            Container(
              child: CustomTextButton(
                buttonName: 'GET STARTED',
                buttonTextStyle: GoogleFonts.ubuntu(
                textStyle: Constants.loginbuttonstyle()),
                buttoncolor: Constants.black_light,
                height: height * 0.09,
                width: displayWidth(context) * 0.9,
                highlightColor: Constants.black_light,
                onPressed: () async{
      
                   loginController.setLoading(true);
      
                   if(isLogin==false){
                     Get.offAll(SignIn());
                     print("login false");
      
                   }else if(isLogin==true){
                    
                     if (companyStatus==0) {
                         print("company status 0");
                      showbottonSheetDialog();
                      } else if (companyStatus==1) {
                          print("company status 1");
                         Get.offAll( () => OrderPage(),);
                                }
                   }
                      loginController.setLoading(false);
      
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => SignIn()),
                  // );
                }, textStyle: TextStyle(
      
              ),
              ),
            ),
           SizedBox(height: displayHeight(context)*0.09,),
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
        height: MediaQuery.of(context).size.height /2.8,
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
                      Get.offAll(() => DocumentsPage(),
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




