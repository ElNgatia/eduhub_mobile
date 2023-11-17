// Account
// settings
// sign out
// language options
// account information
// theme options

import 'package:eduhub_mobile/util/navigation_util.dart';
import 'package:eduhub_mobile/widgets/navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // remove back button
        title: const Text('Account'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        // account tile to have name and email and picture on left - stack
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 150,
                  width: double.infinity,
                  color: Colors.blue,
                ),
                Positioned(
                  top: 25,
                  left: 20,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage('url'),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 140,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'John Doe',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          // color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'email',
                        style: TextStyle(
                          fontSize: 15,
                          // color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 50,
                  right: 20,
                  child: GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.edit,
                      // color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),

            // settings tile
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // navigate to settings screen
              },
            ),

            // language options tile
            ListTile(
              leading: const Icon(Icons.language),
              title: const Text('Language Options'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // navigate to language options screen
              },
            ),
            // theme options tile
            ListTile(
              leading: const Icon(Icons.color_lens),
              title: const Text('Theme Options'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // navigate to theme options screen
              },
            ),
            // sign out tile
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Sign Out'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // navigate to sign out screen
                FirebaseAuth.instance.signOut();
                Navigator.pushNamedAndRemoveUntil(
                    context, '/login', (route) => false);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: 4,
        onTap: (index) {
          NavigationUtil.onItemTapped(context, index);
        },
      ),
    );
  }
}
