import '../../../components/expanded_bottom_nav_bar.dart';
import '../../../model/firebase_auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import '../../../components/component_wrapper.dart';
import '../../../components/dt_button.dart';
import '../../../components/dt_textfield.dart';
import '../../../global/common/toast.dart';
import '../../../util/dt_assets.dart';
import '../../../util/dt_colors.dart';
import '../../../util/dt_styles.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  bool _isSigningUp = false;

  final FirebaseAuthService _auth = FirebaseAuthService();

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();


  @override
  void dispose() {
  _usernameController.dispose();
  _emailController.dispose();
  _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Stack(
                children: [
                  Column(
                    children: [
                      Image.asset(
                        DTImages.bg,
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: screenWidth * 0.081,
                        right: screenWidth * 0.082,
                        top: screenHeight * 0.2),
                    child: ComponentWrapper(
                      width: double.infinity,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xffFFFFFF),
                              border: Border.all(color: Color(0xffEEEEEE), width: 1),
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: screenWidth * 0.04, top: screenHeight * 0.01),
                              child: DTTextField(
                                placeholder: 'Username',
                                hintStyle: TextStyle(color: Color(0xff808389),),
                                keyboardType: TextInputType.emailAddress,
                                controller: _usernameController,
                                width: screenWidth,
                                height: 47,
                                borderWidth: 1,
                                borderColor: Colors.transparent,
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xffFFFFFF),
                              border: Border.all(color: Color(0xffEEEEEE), width: 1),
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: screenWidth * 0.04, top: screenHeight * 0.01),
                              child: DTTextField(
                                placeholder: 'Email Address',
                                hintStyle: TextStyle(color: Color(0xff808389),),
                                keyboardType: TextInputType.emailAddress,
                                controller: _emailController,
                                width: screenWidth,
                                height: 47,
                                borderWidth: 1,
                                borderColor: Colors.transparent,
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xffFFFFFF),
                              border:
                              Border.all(color: Color(0xffEEEEEE), width: 1),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(0),
                                  topRight: Radius.circular(0)),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: screenWidth * 0.04, top: screenHeight * 0.01),
                              child: DTTextField(
                                placeholder: 'Password',

                                keyboardType: TextInputType.emailAddress,
                                hintStyle: TextStyle(color: Color(0xff808389),),
                                controller: _passwordController,
                                width: screenWidth,
                                height: 47,
                                borderWidth: 1,
                                borderColor: Colors.transparent,
                                suffixIcon: Icons.visibility_off,
                                suffixIconColor: AppColors.labelGreyText,
                                obscureText: true,
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xffFFFFFF),
                              border:
                              Border.all(color: Color(0xffEEEEEE), width: 1),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(0),
                                  topRight: Radius.circular(0)),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: screenWidth * 0.04, top: screenHeight * 0.01),
                              child: DTTextField(
                                placeholder: 'Confirm Password',
                                keyboardType: TextInputType.emailAddress,
                                hintStyle: TextStyle(
                                  color: Color(0xff808389),
                                ),
                                width: screenWidth,
                                height: 47,
                                borderWidth: 1,
                                borderColor: Colors.transparent,
                                suffixIcon: Icons.visibility,
                                suffixIconColor: AppColors.labelGreyText,
                                obscureText: true,
                              ),
                            ),
                          ),


                          Container(
                            margin: EdgeInsets.only(
                                left: screenWidth * 0.09,
                                right: screenWidth * 0.09,
                                top: screenHeight*0.01,bottom: screenHeight*0.02),
                            child: DTButton(
                              onClick: _signUp,
                              label: 'Sign up',
                              buttonColor: AppColors.primaryColor,
                              textAlign: TextAlign.center,
                              height: screenHeight * 0.07,
                              width: screenWidth * 0.7,
                              borderRadius: 30,
                              textSize: 14,
                              textFont: FontWeight.w700,
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.only(left: screenWidth*0.09,right: screenWidth*0.09,bottom: 15),
                            child: Text('By signing up, up agree to the Privacy Policy and Terms Of Service ',style: AppTextStyles.muliTextStyle.copyWith(
                              color: AppColors.labelGreyText,
                            ),),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                    ],
              ),


            ],
          ),
        ),
      ),
    );
  }

  void _signUp() async {

    setState(() {
      _isSigningUp = true;
    });

    String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signUpWithEmailAndPassword(email, password);

    setState(() {
      _isSigningUp = false;
    });
    if (user != null) {
      showToast(message: "User is successfully created");
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ExpandedBottomNavBar()));
    } else {
      showToast(message: "Some error happend");
    }
  }

}