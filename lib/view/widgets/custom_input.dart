import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {

  String text;
  Function onSave;
  Function validatorText;
  bool hint;
  String hintText;

  CustomInput({this.text,this.onSave,this.validatorText,this.hint,this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(  
        hintText: text ?? hintText
      ),
      onSaved: onSave,
      validator: validatorText,
      obscureText: hint ?? false, 
      
    );
  }
}