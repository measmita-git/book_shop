import 'package:firebase_auth/firebase_auth.dart';

import '../../../util/dt_assets.dart';
import '../../../util/dt_colors.dart';

// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../onboarding/login_screen.dart';
import 'cart_screen.dart';

import 'featured_book_banner.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      drawer: _buildDrawer(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FeaturedBookBanner(),
            _buildHorizontalScroll([
              _buildCategoryContainer('Fiction'),
              _buildCategoryContainer('Biography'),
              _buildCategoryContainer('Poetry'),
              _buildCategoryContainer('Comics'),
            ]),
            _buildSectionTitle('New Releases', 'View All'),
            _buildHorizontalScroll([
              _buildBookColumn(DTImages.n1, 'इजोरिया'),
              _buildBookColumn(DTImages.n2, 'त्यस बखतको नेपाल'),
              _buildBookColumn(DTImages.n3, 'दरबारको दुःखान्त'),
              _buildBookColumn(DTImages.n4, 'सम्बन्धहरू'),
              _buildBookColumn(DTImages.n5, 'पल्पसा क्याफे'),
              _buildBookColumn(DTImages.n6, 'Beyond Possible'),
              _buildBookColumn(DTImages.n7, 'The Talking Points'),
              _buildBookColumn(DTImages.n8, 'Cabals and Cartels'),
              _buildBookColumn(DTImages.n9, 'Between Queens and the Cities'),
              _buildBookColumn(DTImages.n10, 'Lost in Transition'),
              _buildBookColumn(DTImages.n11, 'Sapiens'),
              _buildBookColumn(DTImages.n12, 'Dignified Menstruation'),
            ]),
            _buildHorizontalScroll([
              _buildCategoryContainer('All Books'),
              _buildCategoryContainer('Bestsellers'),
              _buildCategoryContainer('New Release'),
            ]),
            _buildSectionTitle('Nepali biographies and memoirs', 'View All'),
            _buildHorizontalScroll([
              _buildBookColumn(DTImages.v1, 'रुकमाङ्गद कटवाल'),
              _buildBookColumn(DTImages.v2, 'मैले देखेको दरबार'),
              _buildBookColumn(DTImages.v3, 'महावीर पुन'),
              _buildBookColumn(DTImages.v4, 'अच्युतकृष्ण खरेल'),
              _buildBookColumn(DTImages.v5, 'मान्छेको मन'),
              _buildBookColumn(DTImages.v6, 'राष्ट्र-परराष्ट्र'),
              _buildBookColumn(DTImages.v7, 'सन्दुक रूइत'),
              _buildBookColumn(DTImages.v8, 'कूटनीति र राजनीति'),
              _buildBookColumn(DTImages.v9, 'खुसी'),
              _buildBookColumn(DTImages.v10, 'फूलको आँखामा'),
            ]),
            _buildSectionTitle('Recently Viewed'),
            _buildHorizontalScroll([
              _buildBookColumn(DTImages.r1, 'The Kite Runner'),
              _buildBookColumn(DTImages.r2, 'All Roads Lead North'),
            ]),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
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
    );
  }

  Drawer _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/user_profile.jpg'),
                ),
                SizedBox(height: 10),
                Text(
                  '${user.email ?? 'Guest'}',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),

              ],
            ),
          ),
          _buildDrawerItem(Icons.home, 'Home', () => Navigator.pop(context)),
          _buildDrawerItem(Icons.category, 'Categories', () {}),
          _buildDrawerItem(Icons.new_releases, 'New Releases', () {}),
          _buildDrawerItem(Icons.library_books, 'My Library', () {}),
          SizedBox(height: 200.h,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(


                onPressed: (){
                  FirebaseAuth.instance.signOut();
                },
                color: AppColors.primaryColor,
                child: Text('Sign out'),

              ),
            ],
          ),
        ],
      ),
    );
  }

  ListTile _buildDrawerItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onTap,
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
      child: Center(
        child: Text(
          text,
          style: GoogleFonts.roboto(fontSize: 12.sp),
        ),
      ),
    );
  }

  Widget _buildBookColumn(String imagePath, String title) {
    return Column(
      children: [
        Image.asset(imagePath, height: 300.h),
        SizedBox(height: 6.h),
        Text(
          title,
          style: GoogleFonts.roboto(
            fontSize: 22.sp,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _buildHorizontalScroll(List<Widget> children) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: children,
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, [String? actionText]) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.roboto(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          if (actionText != null)
            Text(
              actionText,
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
    );
  }
}

















