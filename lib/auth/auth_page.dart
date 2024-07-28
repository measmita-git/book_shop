import 'package:book_bazaar/view/screens/onboarding/login_screen.dart';
import 'package:book_bazaar/view/screens/onboarding/signup_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showLoginPage = true;

  void toggleScreen(){
    setState(() {
      showLoginPage = !showLoginPage;
    });

  }


  @override
  Widget build(BuildContext context) {
   if(showLoginPage){
     return LoginScreen(showRegisterPage: toggleScreen);
   }else{
     return SignUpScreen(showLoginPage: toggleScreen);
   }
  }
}
