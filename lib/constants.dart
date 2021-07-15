import 'package:flutter/material.dart';

class Constants extends TextStyle{

  static var boldHeadingText = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: Color.fromRGBO(28, 50, 75, 1),
  );

  static var greenRegularText = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: Color.fromRGBO(28, 50, 75, 1),
    letterSpacing : 2.0
   );

   static var greyLabelText = TextStyle(
     fontSize:18,
     fontWeight: FontWeight.w300,
     color: Colors.grey.shade900
   );

    static var whiteLabelText = TextStyle(
     fontSize:18,
     fontWeight: FontWeight.w900,
     color: Colors.white
   );

    static var regularHeadingTextBold = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.black
  );

    static var regularHeadingText = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: Colors.black
  );

    static var redLabelText = TextStyle(
      fontSize: 16,
      color: Colors.red
   );

    static var greyText = TextStyle(
     fontSize:16,
     color: Colors.grey.shade600
   );

    static var regularHeadingDescText = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: Colors.black,
      height: 2.3
  );
}

