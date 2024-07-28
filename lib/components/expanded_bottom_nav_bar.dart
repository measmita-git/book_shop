import 'package:book_bazaar/components/shared_preferences.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../controller/expanded_nav_controller.dart';
import '../util/dt_assets.dart';
import '../util/dt_colors.dart';
import '../view/screens/dashboard/home_screen.dart';

class ExpandedBottomNavBar extends StatefulWidget {
  final PrefrencesManager prefs = Get.put(PrefrencesManager());

  ExpandedBottomNavBar({
    Key? key,

  }) : super(key: key);

  @override
  State<ExpandedBottomNavBar> createState() => _ExpandedBottomNavBarState();
}

class _ExpandedBottomNavBarState extends State<ExpandedBottomNavBar> {
  late ExpandedNavController controller = ExpandedNavController();



  final PrefrencesManager prefrencesManager = Get.put(PrefrencesManager());


  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ExpandedNavController());
    // var token = prefrencesManager.getAuthToken();

    var navbarItem = [
      BottomNavigationBarItem(
        icon: Obx(() => Image.asset(

          DTImages.home,
          width: 24,
          height: 24,
          color: controller.currentNavIndex.value == 0
              ? AppColors.redButton
              : Color(0xff868686),
        )),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Obx(() => Image.asset(

          DTImages.cart,
          width: 24,
          height: 24,
          color: controller.currentNavIndex.value == 1
              ? AppColors.redButton
              : Color(0xff868686),
        )),
        label: 'Cart',
      ),
      BottomNavigationBarItem(
        icon: Obx(
              () => Image.asset(

                DTImages.library,
            width: 24,
            height: 24,
            color: controller.currentNavIndex.value == 2
                ? AppColors.redButton
                : Color(0xff868686),
          ),
        ),
        label: 'My Library',
      ),
      BottomNavigationBarItem(
        icon: Obx(() => Image.asset(

          DTImages.more,
          width: 24,
          height: 24,
          color: controller.currentNavIndex.value == 3
              ? AppColors.redButton
              : Color(0xff868686),
        )),
        label: 'More',
      ),


    ];

    var navBody = [
      HomePage(),
      Container(),
      Container(),
      Container(),
      // NewsScreen(),
      // ExploreScreen(),

    ];

    return WillPopScope(
      onWillPop: () async {
        if (controller.currentNavIndex.value == 0) {
          SystemNavigator.pop();
          return false;
        } else {
          controller.currentNavIndex.value = 0;
          return false;
        }
      },
      child: Scaffold(
        body: Obx(() => navBody[controller.currentNavIndex.value]),
        bottomNavigationBar: Obx(() => BottomNavigationBar(
          currentIndex: controller.currentNavIndex.value,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: Color(0xff868686),
          selectedIconTheme: IconThemeData(color: AppColors.primaryColor),
          backgroundColor: Theme.of(context).brightness == Brightness.dark
              ? Color(0xff222222)
              : Color(0xffFFFFFF),
          items: navbarItem,
          selectedLabelStyle: TextStyle(
            color: AppColors.redButton,
            fontSize: 12,
          ),
          unselectedLabelStyle: TextStyle(
            color: Color(0xff868686),
            fontSize: 10,
          ),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          onTap: (value) {
            controller.currentNavIndex.value = value;
            IconThemeData(color: AppColors.primaryColor);
          },
        )),

      ),
    );
  }
}
