import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_tz/view/auth/login_view.dart';
import 'package:flutter_test_tz/view/home_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.marmeladTextTheme(Theme.of(context).textTheme)
      ),
      home: Scaffold(
        body:  InitialUser()
      ),
    );
  }
}

class InitialUser extends StatefulWidget {
  @override
  _InitialUserState createState() => _InitialUserState();
}

class _InitialUserState extends State<InitialUser> {

  FirebaseAuth _auth;

  User _user;
  bool isLoading = true;

  @override
  void initState() {
    _auth = FirebaseAuth.instance;
    _user = _auth.currentUser;
    isLoading = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading ? Scaffold(
      body: Center(
        child: CircularProgressIndicator()
      ),
    ):
    _user == null? LoginView(): HomeView(); 
  }
}



