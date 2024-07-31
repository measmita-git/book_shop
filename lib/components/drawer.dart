import 'package:book_bazaar/view/screens/dashboard/settings_page.dart';
import 'package:flutter/material.dart';

import '../services/database/auth_services.dart';
import 'drawer_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout(){
    final authService = AuthService();
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          // App Logo
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Icon(
              Icons.lock_open_rounded,
              size: 80,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          const SizedBox(height: 25),
          // Home list tile
          MyDrawerTile(
            text: "HOME",
            icon: Icons.home,
            onTap: () {
              // Handle home tap
            },
          ),
          const Padding(
            padding: EdgeInsets.all(25.0),
            child: Divider(),
          ),
          // Settings list tile
          MyDrawerTile(
            text: "SETTINGS",
            icon: Icons.settings,
            onTap: () {
             Navigator.pop(context);
             Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingsPage()));
            },
          ),
          const Spacer(),
          // Logout list tile
          MyDrawerTile(
            text: "LOGOUT",
            icon: Icons.logout,
            onTap: logout,
          ),
          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
