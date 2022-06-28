// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class Constants {
//   static String appName = "Trailer Express";
//   static const btn_grey = Color(0xffD1D1D1);
//   static const bg_grey = Color.fromRGBO(245, 248, 250, 1);
//   static const real_grey = Color.fromRGBO(195, 197, 199, 1);
//   static const back_grey = Color.fromRGBO(195, 197, 199, 1);

//   static const normal_grey = Color(0xC4C6C8);

//   static const black_light = Color(0xff0D1724);
//   static const light_grey = Color(0xffF5F8FA);
//   static const light_black = Color(0xff171717);
//   static const white = Color(0xffFFFFFF);
//   static Color green = Color(0xff03A45E);
//   static Color red = Color(0xffF31D41);

//   static ThemeData lightTheme = ThemeData(
//     backgroundColor: white,
//     primaryColor: white,
//     accentColor: white,
//     cursorColor: white,
//     scaffoldBackgroundColor: Color(0xffFFFFFF),
//     appBarTheme: AppBarTheme(
//       textTheme: TextTheme(
//         headline6: TextStyle(
//           color: black_light,
//           fontSize: 18.0,
//           fontWeight: FontWeight.w800,
//         ),
//       ),
//     ),
//   );

//   static TextStyle letridestyle() {
//     return TextStyle(
//         fontSize: 35,
//         // fontFamily: 'Montserrat',
//         fontWeight: FontWeight.w700,
//         color: white);
//   }

//   static TextStyle loginbuttonstyle() {
//     return TextStyle(
//       fontSize: 17,
//       fontFamily: 'Ubuntu',
//       color: Colors.white,
//       fontWeight: FontWeight.w500,
//     );
//   }

//   static TextStyle blackbuttonstyle() {
//     return TextStyle(
//         fontSize: 15, fontWeight: FontWeight.w700, color: Color(0xff0D1724));
//   }

//   static TextStyle whitebuttonstyle() {
//     return TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: white);
//   }

//   static TextStyle welcomestyle() {
//     return TextStyle(
//         fontSize: 24, fontWeight: FontWeight.w400, color: Colors.black); //18
//   }

//   static TextStyle white70style() {
//     return TextStyle(fontSize: 12, color: Colors.white60);
//   }

//   static TextStyle black70style() {
//     return TextStyle(fontSize: 12, color: Colors.black87);
//   }

//   static TextStyle whiteunderlinestyle() {
//     return TextStyle(
//         fontSize: 14,
//         // fontWeight: FontWeight.bold,
//         decoration: TextDecoration.underline,
//         decorationColor: Colors.white70,
//         decorationThickness: 1,
//         color: Colors.white70);
//   }

//   static TextStyle blackunderlinestyle() {
//     return TextStyle(
//         fontSize: 13,
//         // fontWeight: FontWeight.bold,
//         decoration: TextDecoration.underline,
//         decorationColor: Colors.black,
//         decorationThickness: 1,
//         color: Colors.black);
//   }

//   static TextStyle blackboldstyle() {
//     return TextStyle(
//         fontSize: 16, fontWeight: FontWeight.w400, color: Color(0xff0D1724));
//   }

//   static TextStyle whitenormalstyle() {
//     return TextStyle(fontSize: 12, color: white);
//   }

//   static TextStyle blacknormalstyle() {
//     return TextStyle(
//         fontSize: 15,
//         color: Colors.black.withOpacity(0.4),
//         fontWeight: FontWeight.w400);
//   }

//   static TextStyle normalstyle() {
//     return TextStyle(
//         fontSize: 15, fontWeight: FontWeight.normal, color: Colors.grey);
//   }

//   static TextStyle boldstyle() {
//     return TextStyle(
//         // decoration: TextDecoration.underline,
//         fontSize: 15,
//         fontWeight: FontWeight.bold,
//         color: Colors.white);
//   }

//   static TextStyle blacksmallboldstyle() {
//     return TextStyle(
//         // decoration: TextDecoration.underline,
//         fontSize: 15,
//         fontWeight: FontWeight.w400,
//         color: Colors.black);
//   }

//   static BoxDecoration containerstyle() {
//     return BoxDecoration(
//       border: Border.all(
//         width: 0.2,
//         color: Colors.white,
//         // color: Color.fromRGBO(0,0, 0, 1)
//       ),
//       borderRadius: BorderRadius.all(
//           Radius.circular(20.0) //         <--- border radius here
//           ),
//       color: Constants.white,
//       boxShadow: [
//         BoxShadow(
//           color: Color.fromRGBO(57, 57, 57, 0.1),
//           offset: Offset(0.0, 1.4), //(x,y)
//           blurRadius: 1.4,
//         ),
//       ],
//       // image: DecorationImage(image: AssetImage("assets/images/Search.png")),
//     );
//   }

//   static BoxDecoration productpagebuttonstyle() {
//     return BoxDecoration(
//       borderRadius: BorderRadius.all(
//           Radius.circular(30.0) //         <--- border radius here
//           ),
//       color: Colors.black,
//     );
//   }

//   static BoxDecoration buttonstyle() {
//     return BoxDecoration(
//       border: Border.all(width: 0.2, color: Color.fromRGBO(223, 223, 223, 1)),
//       borderRadius: BorderRadius.all(
//           Radius.circular(30.0) //         <--- border radius here
//           ),
//       color: Colors.black,
//       boxShadow: [
//         BoxShadow(
//           color: Colors.grey,
//           offset: Offset(0.0, 1.4), //(x,y)
//           blurRadius: 1.4,
//         ),
//       ],
//     );
//   }

//   static TextStyle normalboldstyle() {
//     return TextStyle(
//         fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xff0D1724));
//   }

//   static TextStyle firstheading() {
//     return TextStyle(
//         fontSize: 24,
//         fontWeight: FontWeight.w400,
//         color: Colors.black,
//         height: 1);
//   }

//   static TextStyle secondheading() {
//     return TextStyle(
//       fontSize: 18,
//       fontWeight: FontWeight.w500,
//       color: Colors.red,
//     );
//   }

//   static TextStyle rowtextstyling() {
//     return TextStyle(
//       fontSize: 17,
//       fontWeight: FontWeight.w400,
//       color: Color.fromRGBO(0, 0, 0, 1),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class Constants {
  static String appName = "Restaurant App";
  static const btn_grey = Color(0xffD1D1D1);
  static const bg_grey = Color.fromRGBO(245, 248, 250, 1);
  static const real_grey = Color.fromRGBO(195, 197, 199, 1);
  static const back_grey = Color.fromRGBO(195, 197, 199, 1);

  static const normal_grey = Color(0xC4C6C8);

  static const black_light = Color(0xff0D1724);
  static const light_grey = Color(0xffF5F8FA);
  static const light_black = Color(0xff171717);
  static const white = Color(0xffFFFFFF);
  static Color green = Color(0xff03A45E);
  static Color red = Color(0xffF31D41);

  //

  static TextStyle blackboldstyle() {
    return TextStyle(
        fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xff0D1724));
  }

  static BoxDecoration favoritecontainerstyle() {
    return BoxDecoration(
      border: Border.all(
        width: 0.2,
        color: Colors.white,
        // color: Color.fromRGBO(0,0, 0, 1)
      ),
      borderRadius: BorderRadius.all(
          Radius.circular(29.0) //         <--- border radius here
          ),
      color: Constants.white,
      boxShadow: [
        BoxShadow(
          color: Color.fromRGBO(57, 57, 57, 0.1),
          offset: Offset(0.0, 1.4), //(x,y)
          blurRadius: 1.4,
        ),
      ],
      // image: DecorationImage(image: AssetImage("assets/images/Search.png")),
    );
  }

  static TextStyle otp1Style() {
    return TextStyle(
        fontSize: 24, fontWeight: FontWeight.w500, color: Colors.black); //18
  }

  //

  static ThemeData lightTheme = ThemeData(
    backgroundColor: white,
    primaryColor: white,
    accentColor: white,
    // ignore: deprecated_member_use
    cursorColor: white,
    scaffoldBackgroundColor: Color(0xffFFFFFF),
    appBarTheme: AppBarTheme(
      textTheme: TextTheme(
        headline6: TextStyle(
          color: black_light,
          fontSize: 18.0,
          fontWeight: FontWeight.w800,
        ),
      ),
    ),
  );

  static TextStyle letridestyle() {
    return TextStyle(
        fontSize: 35,
        // fontFamily: 'Montserrat',
        fontWeight: FontWeight.w700,
        color: white);
  }

  static TextStyle loginbuttonstyle() {
    return TextStyle(
      fontSize: 17,
      fontFamily: 'Ubuntu',
      color: Colors.white,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle blackbuttonstyle() {
    return TextStyle(
        fontSize: 15, fontWeight: FontWeight.w700, color: Color(0xff0D1724));
  }

  static TextStyle whitebuttonstyle() {
    return TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: white);
  }

  static TextStyle welcomestyle() {
    return TextStyle(
        fontSize: 24, fontWeight: FontWeight.w500, color: Colors.black); //18
  }

  static TextStyle otp1style() {
    return TextStyle(
        fontSize: 24, fontWeight: FontWeight.w500, color: Colors.black); //18
  }

  static TextStyle white70style() {
    return TextStyle(fontSize: 12, color: Colors.white60);
  }

  static TextStyle black70style() {
    return TextStyle(fontSize: 12, color: Colors.black87);
  }

  static TextStyle whiteunderlinestyle() {
    return TextStyle(
        fontSize: 14,
        // fontWeight: FontWeight.bold,
        decoration: TextDecoration.underline,
        decorationColor: Colors.white70,
        decorationThickness: 1,
        color: Colors.white70);
  }

  static TextStyle blackunderlinestyle() {
    return TextStyle(
        fontSize: 13,
        // fontWeight: FontWeight.bold,
        decoration: TextDecoration.underline,
        decorationColor: Colors.black,
        decorationThickness: 1,
        color: Colors.black);
  }

  static TextStyle blackboldlightstyle() {
    return TextStyle(
        fontSize: 16, fontWeight: FontWeight.w400, color: Color(0xff0D1724));
  }

  static TextStyle blackBoldstyle() {
    return TextStyle(
        fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xff0D1724));
  }

  static TextStyle whitenormalstyle() {
    return TextStyle(fontSize: 12, color: white);
  }

  static TextStyle blacknormalstyle() {
    return TextStyle(
        fontSize: 15,
        color: Colors.black.withOpacity(0.4),
        fontWeight: FontWeight.w400);
  }

  static TextStyle normalstyle() {
    return TextStyle(
        fontSize: 15, fontWeight: FontWeight.normal, color: Colors.grey);
  }

  static TextStyle boldstyle() {
    return TextStyle(
        // decoration: TextDecoration.underline,
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: Colors.white);
  }

  static TextStyle blacksmallboldstyle() {
    return TextStyle(
        // decoration: TextDecoration.underline,
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: Colors.black);
  }

  static BoxDecoration containerstyle() {
    return BoxDecoration(
      border: Border.all(
        width: 0.2,
        color: Colors.black38,
        // color: Color.fromRGBO(0,0, 0, 1)
      ),
      borderRadius: BorderRadius.all(
          Radius.circular(15.0) //         <--- border radius here
          ),
      color: Constants.white,
      boxShadow: [
        BoxShadow(
          color: Color.fromRGBO(57, 57, 57, 0.1),
          offset: Offset(0.0, 1.4), //(x,y)
          blurRadius: 1.4,
        ),
      ],
      // image: DecorationImage(image: AssetImage("assets/images/Search.png")),
    );
  }

  static BoxDecoration coloredcontainerstyle() {
    return BoxDecoration(
      border: Border.all(
          width: 0.2,
          // color: Colors.white,
          color: Color.fromRGBO(94, 207, 99, 1)),
      borderRadius: BorderRadius.all(
          Radius.circular(20.0) //         <--- border radius here
          ),
      color: Color.fromRGBO(94, 207, 99, 1),
      boxShadow: [
        BoxShadow(
          color: Color.fromRGBO(57, 57, 57, 0.1),
          offset: Offset(0.0, 1.4), //(x,y)
          blurRadius: 1.4,
        ),
      ],
      // image: DecorationImage(image: AssetImage("assets/images/Search.png")),
    );
  }

  static BoxDecoration messagecontainerstyle() {
    return BoxDecoration(
      border: Border.all(
        width: 0.2,
        color: Colors.white,
        // color: Color.fromRGBO(0,0, 0, 1)
      ),
      borderRadius: BorderRadius.all(
          Radius.circular(35.0) //         <--- border radius here
          ),
      color: Constants.white,
      boxShadow: [
        BoxShadow(
          color: Color.fromRGBO(57, 57, 57, 0.1),
          offset: Offset(0.0, 1.4), //(x,y)
          blurRadius: 1.4,
        ),
      ],
      // image: DecorationImage(image: AssetImage("assets/images/Search.png")),
    );
  }

  static BoxDecoration productpagebuttonstyle() {
    return BoxDecoration(
      borderRadius: BorderRadius.all(
          Radius.circular(30.0) //         <--- border radius here
          ),
      color: Colors.black,
    );
  }

  static BoxDecoration favoriteContainerstyle() {
    return BoxDecoration(
      border: Border.all(
        width: 0.2,
        color: Colors.white,
        // color: Color.fromRGBO(0,0, 0, 1)
      ),
      borderRadius: BorderRadius.all(
          Radius.circular(29.0) //         <--- border radius here
          ),
      color: Constants.white,
      boxShadow: [
        BoxShadow(
          color: Color.fromRGBO(57, 57, 57, 0.1),
          offset: Offset(0.0, 1.4), //(x,y)
          blurRadius: 1.4,
        ),
      ],
      // image: DecorationImage(image: AssetImage("assets/images/Search.png")),
    );
  }

  static BoxDecoration buttonstyle() {
    return BoxDecoration(
      border: Border.all(width: 0.2, color: Color.fromRGBO(223, 223, 223, 1)),
      borderRadius: BorderRadius.all(
          Radius.circular(30.0) //         <--- border radius here
          ),
      color: Colors.black,
      boxShadow: [
        BoxShadow(
          color: Colors.grey,
          offset: Offset(0.0, 1.4), //(x,y)
          blurRadius: 1.4,
        ),
      ],
    );
  }

  static TextStyle normalboldstyle() {
    return TextStyle(
        fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xff0D1724));
  }

  static TextStyle firstheading() {
    return TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        color: Colors.black,
        height: 1);
  }

  static TextStyle secondheading() {
    return TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: Colors.red,
    );
  }

  static TextStyle orderidstyle() {
    return TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w500,
      color: Color.fromRGBO(0, 0, 0, 1),
    );
  }

  static TextStyle ordersubcategory() {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    );
  }

  static TextStyle rowtextstyling() {
    return TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w400,
      color: Color.fromRGBO(0, 0, 0, 1),
    );
  }

  static TextStyle earningtextstyle() {
    return TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.black54,
    );
  }

  static TextStyle earningstyle() {
    return TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: Color.fromRGBO(94, 207, 99, 1),
    );
  }
}
