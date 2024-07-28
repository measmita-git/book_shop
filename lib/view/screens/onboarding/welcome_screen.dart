import '../../../util/dt_colors.dart';
import '../../../util/dt_styles.dart';
import 'signup_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../../../components/dt_button.dart';
import '../../../util/dt_assets.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Image.asset(DTImages.frame1),
          SizedBox(height: screenHeight*0.02,),
          Text('Hello',style: AppTextStyles.muliLargeTextStyle.copyWith(
            fontSize: 30,
          ),),
          // SizedBox(height: screenHeight*0.01,),
          Text('Welcome to BookBazaar',style: AppTextStyles.muliTextStyle.copyWith(
            color: Colors.black,
            fontSize: 18,
          ),),
          SizedBox(height: screenHeight*0.09,),
          DTButton(
            onClick: () async {

              Get.to(() => const LoginScreen(), transition: Transition.upToDown);
            },
            label: "Login",
            textColor: Colors.white,
            buttonColor: AppColors.primaryColor,
            borderRadius: 40,
            width: screenWidth * 0.6,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: screenHeight*0.03,),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.primaryColor,
                width: 1,

              ),
              borderRadius: BorderRadius.circular(40),
            ),
            child: DTButton(
              onClick: () async {

                Get.to(() => const SignUpScreen(), transition: Transition.upToDown);
              },
              label: "Sign Up",
              textColor: AppColors.primaryColor,
              buttonColor: Colors.transparent,
              borderColor: AppColors.primaryColor,
              borderRadius: 40,
              width: screenWidth * 0.6,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
