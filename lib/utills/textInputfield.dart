import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant/Theme/Theme.dart';

// ignore: must_be_immutable
class TextInputField extends StatefulWidget {
  String hintText;
  var validateFunction;
  var onSaved;
  TextInputType keyboard;

  //passing props in the Constructor.
  //Java like style
  TextInputField({
     this.hintText,
     this.keyboard,
    this.validateFunction,
    this.onSaved,
  });

  @override
  _TextInputFieldState createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        kToolbarHeight;
    return Container(
      height: _height * 0.071,
      margin: EdgeInsets.only(left: 17, right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Constants.white,
        border: Border.all(
          color: Color.fromRGBO(255, 40, 40, 1),
        ),
      ),
      // margin: EdgeInsets.symmetric(vertical: 10),
      // color: Constants.white,
      child: TextFormField(
          keyboardType: widget.keyboard,
          cursorColor: Constants.black_light,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "phone number",
            hintStyle:
                GoogleFonts.ubuntuMono(textStyle: Constants.normalstyle()),
            contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            // focusedBorder: _outlineinputborder(Constants.btn_grey),
            errorBorder: _outlineinputborder(Constants.btn_grey),
            focusedErrorBorder: _outlineinputborder(Constants.btn_grey),
            // enabledBorder: _outlineinputborder(Constants.btn_grey),
          ),
          onSaved: widget.onSaved,
          validator: widget.validateFunction),
    );
  }

  OutlineInputBorder _outlineinputborder(bordercolor) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(color: bordercolor, width: 1.0),
    );
  }
}

// -------------------------password field -------------------//
// ignore: must_be_immutable
class PasswordInputField extends StatefulWidget {
  String hintText;

  var validateFunction;
  var onSaved;

  //passing props in the Constructor.
  //Java like style
  PasswordInputField({
     this.hintText,
    this.validateFunction,
    this.onSaved,
  });

  @override
  _PasswordInputFieldState createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  bool _obscure = true;
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        kToolbarHeight;
    return Container(
      height: _height * 0.061,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Constants.white,
        border: Border.all(color: Colors.black),
      ),
      child: TextFormField(
          obscureText: _obscure,
          cursorColor: Constants.black_light,
          decoration: InputDecoration(
            border: InputBorder.none,
            suffixIcon: _obscure
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        _toggle();
                      });
                    },
                    child: Icon(
                      Icons.visibility_off,
                      color: Constants.real_grey,
                    ))
                : GestureDetector(
                    onTap: () {
                      setState(() {
                        _toggle();
                      });
                    },
                    child: Icon(
                      Icons.visibility,
                      color: Constants.real_grey,
                    )),
            hintText: widget.hintText,
            hintStyle: Constants.normalstyle(),
            contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 13),
            // focusedBorder: _outlineinputborder(Constants.btn_grey),
            errorBorder: _outlineinputborder(Constants.btn_grey),
            focusedErrorBorder: _outlineinputborder(Constants.btn_grey),
            // enabledBorder: _outlineinputborder(Constants.btn_grey),
          ),
          onSaved: widget.onSaved,
          validator: widget.validateFunction),
    );
  }

  OutlineInputBorder _outlineinputborder(bordercolor) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(color: bordercolor, width: 1.0),
    );
  }

  void _toggle() {
    setState(() {
      _obscure = !_obscure;
    });
  }
}
