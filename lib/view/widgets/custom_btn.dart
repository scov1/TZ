import 'package:flutter/material.dart';

import 'custom_text.dart';


class CustomBtn extends StatelessWidget {

  String text;
  Function onPress;
  MaterialStateProperty btnBackgroundColor;
  MaterialStateProperty btnTextColor;
  TextStyle colorText;
  bool btnBorder;
  Image imageAsset;

  CustomBtn({this.text,this.onPress,this.btnBackgroundColor,this.btnTextColor,this.colorText,this.btnBorder,this.imageAsset});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(  
        backgroundColor: btnBackgroundColor ?? MaterialStateProperty.all<Color>(Color.fromRGBO(28, 50, 75, 1),),
        foregroundColor: btnTextColor ?? MaterialStateProperty.all<Color>(Colors.black),
        shape: btnBorder ? MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(color: Colors.transparent)
          )): MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(color: Colors.grey)),
          ),
      ),
      onPressed: onPress,
      child: 
          CustomText(
            text: text ?? "GET",
            textStyle: colorText,
          )
      );
  }
}