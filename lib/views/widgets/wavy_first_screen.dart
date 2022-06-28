import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant/Theme/Theme.dart';
import 'package:restaurant/utills/Displaywidth.dart';

class WavyHeaderImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
    //  Stack(children: [
      ClipPath(
        child: Container(
          height: displayHeight(context) / 1.6,
          width: displayWidth(context),
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(image: AssetImage('assets/images/vendor_logo.png'),
              height: MediaQuery.of(context).size.height*0.30,
               width: MediaQuery.of(context).size.width*0.60,
              ),

              Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.05),
              child:  Text(
            "Let's Ride",
            style: GoogleFonts.ubuntu(
              textStyle: Constants.letridestyle(),
            ),
            textAlign: TextAlign.center,
          )
,
              )
             
            ],
          ),
        ),
        clipper: BottomWaveClipper(),
      )
      //,

      // Positioned(
      //     top: displayHeight(context) / 2 * 0.1,
      //     left: displayWidth(context) / 2 * 0.4,
      //     child: Image(image: AssetImage('assets/images/vendor_logo.png'))),
      // Positioned(
      //     top: displayHeight(context) / 2 * 0.64,
      //     left: displayWidth(context) / 2 * 0.6,
      //     child: Text(
      //       "Let's Ride",
      //       style: GoogleFonts.ubuntu(
      //         textStyle: Constants.letridestyle(),
      //       ),
      //       textAlign: TextAlign.center,
      //     ))
    
    // ]
    // )
    ;
  }
}

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 20);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2.25, size.height - 30.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint =
        Offset(size.width - (size.width / 3.25), size.height - 65);
    var secondEndPoint = Offset(size.width, size.height - 40);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height - 40);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
