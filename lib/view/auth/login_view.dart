import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_tz/view/widgets/custom_btn.dart';
import 'package:flutter_test_tz/view/widgets/custom_text.dart';
import 'package:get/get.dart';
import '../../constants.dart';
import '../home_view.dart';


enum CheckMobileState { SHOW_PHONE_STATE, SHOW_OTP_STATE }

class LoginView extends StatefulWidget {
  @override
  _LoginView createState() => _LoginView();
}

class _LoginView extends State<LoginView> {
  
  FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<ScaffoldState> _formKey = GlobalKey<ScaffoldState>();
  CheckMobileState currentState = CheckMobileState.SHOW_PHONE_STATE;
  String verificationId;
  bool isLoading = false;

  TextEditingController mobilyController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    setState(() {
      isLoading = true;
    });

    try {
      final authCredetial =
          await _auth.signInWithCredential(phoneAuthCredential);
      setState(() {
        isLoading = false;
      });

      if (authCredetial?.user != null) {
        Get.to(HomeView());
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message),
        ),
      );
    }
  }

  getPhoneForm(context) {
    return Column(
      children: [
        CustomText(
          text: "Phone",
          textAlignment: Alignment.topLeft,
          textStyle: Constants.greyLabelText,
        ),
        TextField(
          decoration: InputDecoration(
            hintText: "+77029552207",
          ),
          controller: mobilyController,
        ),
        SizedBox(height: 70),
        Container(
          width: double.infinity,
          height: 50,
          child: CustomBtn(
            text: "SEND",
            colorText: Constants.whiteLabelText,
            onPress: () async {
              setState(() {
                isLoading = true;
              });
              await _auth.verifyPhoneNumber(
                  phoneNumber: mobilyController.text,
                  verificationCompleted: (phoneAuthCredential) async {
                    setState(() {
                      isLoading = false;
                    });
                  },
                  verificationFailed: (verificationFailed) async {
                    setState(() {
                      isLoading = false;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(verificationFailed.message),
                      ),
                    );
                  },
                  codeSent: (verificationId, resendingToken) async {
                    setState(() {
                      isLoading = false;
                      currentState = CheckMobileState.SHOW_OTP_STATE;
                      this.verificationId = verificationId;
                    });
                  },
                  codeAutoRetrievalTimeout: (verificationId) async {});
            },
            btnBorder: true,
          ),
        ),
      ],
    );
  }

  getOTPForm(context) {
    return Column(
      children: [
        CustomText(
          text: "Code",
          textAlignment: Alignment.topLeft,
          textStyle: Constants.greyLabelText,
        ),
        TextField(
          decoration: InputDecoration(
            hintText: "123456",
          ),
          controller: otpController,
        ),
        SizedBox(height: 70),
        Container(
          width: double.infinity,
          height: 50,
          child: CustomBtn(
            text: "OTP",
            colorText: Constants.whiteLabelText,
            onPress: () async {
              PhoneAuthCredential phoneAuthCredential =
                  PhoneAuthProvider.credential(
                      verificationId: verificationId,
                      smsCode: otpController.text);
              signInWithPhoneAuthCredential(phoneAuthCredential);
            },
            btnBorder: true,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _formKey,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 120, left: 40, right: 40),
          child: Form(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: "Welcome",
                      textAlignment: Alignment.topLeft,
                      textStyle: Constants.boldHeadingText,
                    ),
                    GestureDetector(
                      onTap: () {
                      //  Get.to(RegistrationView());
                      },
                      child: CustomText(
                        text: "Sign In",
                        textAlignment: Alignment.topRight,
                        textStyle: Constants.greenRegularText,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 100),
                Container(
                  child: isLoading
                      ? Center(child: CircularProgressIndicator())
                      : currentState == CheckMobileState.SHOW_PHONE_STATE
                          ? getPhoneForm(context)
                          : getOTPForm(context),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
