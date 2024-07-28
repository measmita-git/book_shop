import '../../../util/dt_assets.dart';
import '../../../util/dt_colors.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../onboarding/login_screen.dart';
import 'cart_screen.dart';

import 'featured_book_banner.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Book Bazaar',
          style: GoogleFonts.alatsi(
            fontSize: 26.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.primaryColor,
          ),
        ),
        actions: [
          IconButton(
            icon: Image.asset(
              DTImages.cart,
              color: AppColors.primaryColor,
              width: 24,
              height: 24,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => CartScreen(),
              ));
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/user_profile.jpg'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Welcome, User!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.category),
              title: Text('Categories'),
              onTap: () {
                // Handle Categories tap
              },
            ),

            ListTile(
              leading: Icon(Icons.new_releases),
              title: Text('New Releases'),
              onTap: () {
                // Handle New Releases tap
              },
            ),
            ListTile(
              leading: Icon(Icons.library_books),
              title: Text('My Library'),
              onTap: () {
                // Handle My Library tap
              },
            ),
            GestureDetector(
              onTap: (){
                FirebaseAuth.instance.signOut();
                Get.offAll(()=>LoginScreen());
              },
              child: ListTile(
                leading: Icon(Icons.favorite),
                title: Text('Logout'),
                onTap: () {
                  // Handle Wishlist tap
                },
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FeaturedBookBanner(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
                child: Row(
                  children: [
                    _buildCategoryContainer('Fiction'),
                    SizedBox(width: 20.w),
                    _buildCategoryContainer('Biography'),
                    SizedBox(width: 20.w),
                    _buildCategoryContainer('Poetry'),
                    SizedBox(width: 20.w),
                    _buildCategoryContainer('Comics'),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'New Releases',
                    style: GoogleFonts.roboto(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'View All',
                    style: GoogleFonts.roboto(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryColor,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 10.h),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          DTImages.n1,
                          height: 300.h,
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        Text(
                          'इजोरिया',
                          style: GoogleFonts.roboto(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Column(
                      children: [
                        Image.asset(
                          DTImages.n2,
                          height: 300.h,
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        Text(
                          'त्यस बखतको नेपाल',
                          style: GoogleFonts.roboto(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Column(
                      children: [
                        Image.asset(
                          DTImages.n3,
                          height: 300.h,
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        Text(
                          'दरबारको दुःखान्त',
                          style: GoogleFonts.roboto(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Column(
                      children: [
                        Image.asset(
                          DTImages.n4,
                          height: 300.h,
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        Text(
                          'सम्बन्धहरू',
                          style: GoogleFonts.roboto(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Column(
                      children: [
                        Image.asset(
                          DTImages.n5,
                          height: 300.h,
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        Text(
                          'पल्पसा क्याफे',
                          style: GoogleFonts.roboto(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Column(
                      children: [
                        Image.asset(
                          DTImages.n6,
                          height: 300.h,
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        Text(
                          'Beyond Possible',
                          style: GoogleFonts.roboto(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Column(
                      children: [
                        Image.asset(
                          DTImages.n7,
                          height: 300.h,
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        Text(
                          'The Talking Points',
                          style: GoogleFonts.roboto(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Column(
                      children: [
                        Image.asset(
                          DTImages.n8,
                          height: 300.h,
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        Text(
                          'Cabals and Cartels',
                          style: GoogleFonts.roboto(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Column(
                      children: [
                        Image.asset(
                          DTImages.n9,
                          height: 300.h,
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        Text(
                          'Between Queens and the Cities',
                          style: GoogleFonts.roboto(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Column(
                      children: [
                        Image.asset(
                          DTImages.n10,
                          height: 300.h,
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        Text(
                          'Lost in Transition',
                          style: GoogleFonts.roboto(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Column(
                      children: [
                        Image.asset(
                          DTImages.n11,
                          height: 300.h,
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        Text(
                          'Sapiens',
                          style: GoogleFonts.roboto(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Column(
                      children: [
                        Image.asset(
                          DTImages.n12,
                          height: 300.h,
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        Text(
                          'Dignified Menstruation',
                          style: GoogleFonts.roboto(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
              child: Row(
                children: [
                  _buildCategoryContainer('All Books'),
                  SizedBox(width: 20.w),
                  _buildCategoryContainer('Bestsellers'),
                  SizedBox(width: 20.w),
                  _buildCategoryContainer('New Realese'),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Nepali biographies and memoirs',
                    style: GoogleFonts.roboto(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'View All',
                    style: GoogleFonts.roboto(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryColor,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 10.h),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          DTImages.v1,
                          height: 300.h,
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        Text(
                          'रुकमाङ्गद कटवाल',
                          style: GoogleFonts.roboto(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Column(
                      children: [
                        Image.asset(
                          DTImages.v2,
                          height: 300.h,
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        Text(
                          'मैले देखेको दरबार',
                          style: GoogleFonts.roboto(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Column(
                      children: [
                        Image.asset(
                          DTImages.v3,
                          height: 300.h,
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        Text(
                          'महावीर पुन',
                          style: GoogleFonts.roboto(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Column(
                      children: [
                        Image.asset(
                          DTImages.v4,
                          height: 300.h,
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        Text(
                          'अच्युतकृष्ण खरेल',
                          style: GoogleFonts.roboto(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Column(
                      children: [
                        Image.asset(
                          DTImages.v5,
                          height: 300.h,
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        Text(
                          'मान्छेको मन',
                          style: GoogleFonts.roboto(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Column(
                      children: [
                        Image.asset(
                          DTImages.v6,
                          height: 300.h,
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        Text(
                          'राष्ट्र-परराष्ट्र',
                          style: GoogleFonts.roboto(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Column(
                      children: [
                        Image.asset(
                          DTImages.v7,
                          height: 300.h,
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        Text(
                          'सन्दुक रूइत',
                          style: GoogleFonts.roboto(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Column(
                      children: [
                        Image.asset(
                          DTImages.v8,
                          height: 300.h,
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        Text(
                          'कूटनीति र राजनीति',
                          style: GoogleFonts.roboto(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Column(
                      children: [
                        Image.asset(
                          DTImages.v9,
                          height: 300.h,
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        Text(
                          'खुसी',
                          style: GoogleFonts.roboto(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Column(
                      children: [
                        Image.asset(
                          DTImages.v10,
                          height: 300.h,
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        Text(
                          'फूलको आँखामा',
                          style: GoogleFonts.roboto(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recently Viewed',
                    style: GoogleFonts.roboto(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 10.h),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          DTImages.r1,
                          height: 300.h,
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        Text(
                          'The Kite Runner',
                          style: GoogleFonts.roboto(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Column(
                      children: [
                        Image.asset(
                          DTImages.r2,
                          height: 300.h,
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        Text(
                          'All Roads Lead North',
                          style: GoogleFonts.roboto(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryContainer(String text) {
    return Container(
      width: 100.w,
      height: 50.h,
      decoration: BoxDecoration(
        color: AppColors.blueColor,
        borderRadius: BorderRadius.circular(9.r),
        border: Border.all(color: Colors.transparent),
      ),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          text,
          style: GoogleFonts.roboto(
            fontSize: 12.sp,
          ),
        ),
      ),
    );
  }
}

















