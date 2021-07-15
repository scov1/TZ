
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {

  String text;
  Alignment textAlignment;
  TextStyle textStyle;
  int maxLine;
  double height;
 
  CustomText({this.text,this.textAlignment,this.textStyle,this.maxLine,this.height = 1});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: textAlignment,
      child: Text( 
        text,
        style: textStyle,
        maxLines: maxLine,
      ),
    );
  }
}