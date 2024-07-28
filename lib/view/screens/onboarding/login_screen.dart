import '../../../components/expanded_bottom_nav_bar.dart';
import '../../../util/dt_colors.dart';
import '../../../util/dt_styles.dart';
import '../dashboard/home_screen.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import '../../../components/dt_button.dart';
import '../../../components/dt_textfield.dart';
import '../../../global/common/toast.dart';
import '../../../model/firebase_auth_services.dart';
import '../../../util/dt_assets.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool _isSigning = false;
  bool hidePassword = true;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();


  // final FirebaseAuthService _auth = FirebaseAuthService();


  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();


  @override
  void dispose() {

    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Builder(
        builder: (context) => Form(
          key: globalFormKey,
          child: _loginUI(context),
        ),
      ),
    );
  }

  Widget _loginUI(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(

        child: Column(

          children: [
            Image.asset(DTImages.lframe),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            Text(
              'Login',
              style: AppTextStyles.muliLargeTextStyle.copyWith(
                fontSize: 30,
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  left: screenWidth * 0.1, top: screenHeight * 0.03),
              child: Row(
                children: [
                  Text(
                    'Email',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenHeight * 0.01,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.borderColor,
                ),
                borderRadius: BorderRadius.circular(40),
              ),
              child: DTTextField(
                placeholder: '',
                borderWidth: 0.8,
                borderColor: Colors.transparent,
                width: screenWidth * 0.8,
                borderRadius: 100,
                height: screenHeight * 0.07,
                controller: _emailController,

              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  left: screenWidth * 0.1, top: screenHeight * 0.03),
              child: Row(
                children: [
                  Text(
                    'Password',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenHeight * 0.01,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.borderColor,
                ),
                borderRadius: BorderRadius.circular(40),
              ),
              child: DTTextField(
                placeholder: '',
                borderWidth: 0.8,
                borderColor: Colors.transparent,
                width: screenWidth * 0.8,
                borderRadius: 100,
                height: screenHeight * 0.07,
                controller: _passwordController,

              ),
            ),
            SizedBox(
              height: screenHeight * 0.04,
            ),
            DTButton(
              // onClick: _signIn,
              label: "Login",
              textColor: Colors.white,
              buttonColor: AppColors.primaryColor,
              borderRadius: 40,
              width: screenWidth * 0.6,
              textAlign: TextAlign.center, onClick: (){
                Get.to(()=>HomePage());
            },
            ),
          ],
        ),
      );

  }

  // void _signIn() async {
  //   setState(() {
  //     _isSigning = true;
  //   });
  //
  //   String email = _emailController.text.trim();
  //   String password = _passwordController.text.trim();
  //
  //   try {
  //     // User? user = await _auth.signInWithEmailAndPassword(email, password);
  //
  //     setState(() {
  //       _isSigning = false;
  //     });
  //
  //     if (user != null) {
  //       showToast(message: "User successfully logged in");
  //       Navigator.of(context).push(MaterialPageRoute(builder: (context) => ExpandedBottomNavBar()));
  //     } else {
  //       showToast(message: "Login failed. Please try again.");
  //     }
  //   } catch (e) {
  //     setState(() {
  //       _isSigning = false;
  //     });
  //     showToast(message: "Error: ${e.toString()}");
  //   }
  // }

}


