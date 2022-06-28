import 'package:flutter/material.dart';

class TabButton extends StatelessWidget {
  final String text;
  final int selectedPage;
  final int pageNumber;
  final VoidCallback onPressed;
  TabButton({this.text, this.selectedPage, this.pageNumber, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 1000),
        curve: Curves.fastLinearToSlowEaseIn,
        decoration: BoxDecoration(
          // color: selectedPage == pageNumber ? Colors.blue : Colors.transparent,
          // borderRadius: BorderRadius.circular(4.0),
          border: Border(
              bottom: selectedPage == pageNumber
                  ? BorderSide(
                      color: Color.fromRGBO(237, 41, 57, 1),
                      width: 2.5,
                    )
                  : BorderSide(
                      color: Color.fromRGBO(0, 0, 0, 0.1),
                      width: 2.5,
                    )),
        ),
        padding: EdgeInsets.symmetric(
          vertical: selectedPage == pageNumber ? 8.0 : 8.0,
          horizontal: selectedPage == pageNumber ? 8.0 : 8.0,
        ),
        margin: EdgeInsets.symmetric(
          vertical: selectedPage == pageNumber ? 0 : 8.0,
          horizontal: selectedPage == pageNumber ? 0 : 8.0,
        ),
        child: Text(
          text ?? "Tab Button",
          style: TextStyle(
            color: selectedPage == pageNumber ? Colors.red : Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
