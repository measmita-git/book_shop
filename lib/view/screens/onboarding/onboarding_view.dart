
import 'package:book_bazaar/view/screens/onboarding/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../components/dt_button.dart';
import '../../../util/dt_colors.dart';
import '../../../util/dt_styles.dart';
import 'login_screen.dart';
import 'onboarding_item.dart';
import 'package:onboarding/onboarding.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final controller = OnboardingItems();
  final pageController = PageController();

  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        actions: [
          // Skip Button

          TextButton(
              onPressed: () {},
              child: Text(
                "Skip",
                style: AppTextStyles.muliTextStyle.copyWith(
                  color: Colors.black,
                  fontSize: 16,
                ),
              )),
        ],
      ),
      bottomSheet: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
        child: isLastPage
            ? getStarted()
            : Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //Indicator
            Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.35),
              child: SmoothPageIndicator(
                controller: pageController,
                count: controller.items.length,
                onDotClicked: (index) => pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 600),
                    curve: Curves.easeIn),
                effect: const WormEffect(
                  dotHeight: 12,
                  dotWidth: 12,
                  activeDotColor: AppColors.primaryColor,
                ),
              ),
            ),

            //Next Button
            // TextButton(
            //     onPressed: ()=>pageController.nextPage(
            //         duration: const Duration(milliseconds: 600), curve: Curves.easeIn),
            //     child: const Text("Next")),
          ],
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: PageView.builder(
            onPageChanged: (index) => setState(
                    () => isLastPage = controller.items.length - 1 == index),
            itemCount: controller.items.length,
            controller: pageController,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(controller.items[index].image,height: screenHeight*0.5,),
                  SizedBox(height: screenHeight*0.02),
                  Text(
                    controller.items[index].title,
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    margin: EdgeInsets.only(left: screenWidth*0.14,right: screenWidth*0.14),
                    child: Text(controller.items[index].descriptions,
                        style: const TextStyle(color: Colors.grey, fontSize: 18,fontWeight: FontWeight.w400),
                        textAlign: TextAlign.center),
                  ),
                ],
              );
            }),
      ),
    );
  }

  //  one time onboarding

  //Get started button

  Widget getStarted() {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.primaryColor,
      ),
      width: MediaQuery.of(context).size.width * .7,
      height: 55,
      child: DTButton(
        onClick: () async {
          final pres = await SharedPreferences.getInstance();
          pres.setBool("onboarding", true);

          //After we press get started button this onboarding value become true
          // same key
          if (!mounted) return;
          Get.to(() => const WelcomeScreen(), transition: Transition.upToDown);
        },
        label: "Get started",
        textColor: Colors.white,
        buttonColor: Colors.black,
        borderRadius: 6,
        width: screenWidth * 0.6,
        textAlign: TextAlign.center,
      ),
    );
  }
}
