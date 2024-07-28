
import 'package:book_bazaar/auth/auth_page.dart';
import 'package:book_bazaar/components/main_page.dart';
import 'package:book_bazaar/view/screens/onboarding/onboarding_view.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
        appId: '1:187820135619:android:58b7b12107ae387db9fe76',
        apiKey: 'AIzaSyA65S3SLuvZxciWrYJoSWG9j3cSaIHv6lI',

        projectId: 'book-bazaar-78c63',
        storageBucket: 'myapp-b9yt18.appspot.com', messagingSenderId: '187820135619',
      )
  );
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 930),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Book Bazaar',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MainPage(),
      ),
    );
  }
}

