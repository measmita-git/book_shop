import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../util/dt_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:   Center(
        child: Column(
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
      ),
    );
  }
}
