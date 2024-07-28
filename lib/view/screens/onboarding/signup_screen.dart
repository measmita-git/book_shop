import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../util/dt_colors.dart';
import '../../../util/dt_styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../components/dt_button.dart';
import '../../../components/dt_textfield.dart';
import '../../../util/dt_assets.dart';


class SignUpScreen extends StatefulWidget {
  final VoidCallback showLoginPage;
  const SignUpScreen({Key? key, required this.showLoginPage}):super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  bool showLoginPage = true;
  bool hidePassword = true;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signUp() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim()
    );
  }

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
            height: screenHeight * 0.01,
          ),
          Text(
            'Register Here!',
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
                left: screenWidth * 0.1, top: screenHeight * 0.01),
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

          Container(
            margin: EdgeInsets.only(
                left: screenWidth * 0.1, top: screenHeight * 0.01),
            child: Row(
              children: [
                Text(
                  'Confirm Password',
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
            height: screenHeight * 0.02,
          ),
          DTButton(
            onClick: signUp,
            label: "Sign Up",
            textColor: Colors.white,
            buttonColor: AppColors.primaryColor,
            borderRadius: 40.r,
            width: screenWidth * 0.6,
            height: 50.h,

            textAlign: TextAlign.center,

          ),
          SizedBox(height: 20.h,),
          Wrap(
            spacing: 4,
            children: [
              Text('Not a member ?',style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),),
              InkWell(
                onTap: widget.showLoginPage,

                child: Text('Register Now',style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryColor,
                ),),
              )
            ],
          )
        ],
      ),
    );

  }

}
