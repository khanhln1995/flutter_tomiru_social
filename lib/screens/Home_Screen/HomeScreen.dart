import 'package:flutter/material.dart';
import 'package:tomiru_social_flutter/screens/Group_Screen/group_screen.dart';
import 'package:tomiru_social_flutter/screens/Profile_Screen/Profile_Screen.dart';
import 'package:tomiru_social_flutter/screens/Signin_Screen/Signin_Screent.dart';
import "../Signup_Screen/Signup_Screen.dart";

import "../Friend_Screen/Friend_Screen.dart";
import "../../widgets/bottom_menu_bar/bottom_menu_bar.dart";
import "../Friend2_Screen/Friend2_Screen.dart";
import "../home/Home.dart";
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController passwordController = TextEditingController();
    bool isAdmin = true;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome to My Flutter App!'),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Signup_Screen(),
                  ),
                );
              },
              child: const Text('Register'),
            ),
            
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignIn_Screen(
                      phoneController: null,
                      passwordController: passwordController,
                      emailController: null,
                      isCreatedSuccess: false,
                    ),
                  ),
                );
              },
              child: const Text('Login'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Home(),
                  ),
                );
              },
              child: const Text('Home'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GroupScreen(isAdmin: isAdmin),
                  ),
                );
              },
              child: const Text('Group'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileScreen(),
                  ),
                );
              },
              child: const Text('Profile'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Friend2Screen(),
                  ),
                );
              },
              child: const Text('Friend2'),
            ),
            
          ],
        ),
      ),
      bottomNavigationBar: const BottomMenubar(),
    );
  }
}

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration'),
      ),
      body: const Center(
        child: Text('This is the registration page.'),
      ),
    );
  }
}
