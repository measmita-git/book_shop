import 'package:book_bazaar/auth/login_or_register.dart';

import 'package:book_bazaar/services/database/auth_gate.dart';
import 'package:book_bazaar/themes/theme_provider.dart';
import 'package:book_bazaar/view/screens/onboarding/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


import 'package:provider/provider.dart';
import 'package:khalti/khalti.dart';
import 'model/book_store.dart';


void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
        appId: '1:187820135619:android:58b7b12107ae387db9fe76',
        apiKey: 'AIzaSyA65S3SLuvZxciWrYJoSWG9j3cSaIHv6lI',

        projectId: 'book-bazaar-78c63',
        storageBucket: 'myapp-b9yt18.appspot.com', messagingSenderId: '187820135619',
      )
  );

  await Khalti.init(
    publicKey: 'test_public_key_fef331272f8b47f3b4022d377ad52b85',
    enabledDebugging: false,
  );

  runApp(
    MultiProvider(
      providers: [

        //theme provider
        ChangeNotifierProvider(create: (context) => ThemeProvider()),

        //restaurant provider
        ChangeNotifierProvider(create: (context) => Restaurant()),
      ],
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthGate(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
