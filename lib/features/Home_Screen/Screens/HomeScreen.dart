import 'package:flutter/material.dart';

import "package:tomiru_social_flutter/features/Auth/Sign_in/Screens/Sign_in_Screen.dart";
import "package:tomiru_social_flutter/features/Auth/Sign_up/Screens/Sign_up_Screen.dart";
import "package:tomiru_social_flutter/features/Business_Screen/Screens/Business_Screen.dart";
import "package:tomiru_social_flutter/features/Group_Screen/Screens/Chat_Group_Screen.dart";
import "package:tomiru_social_flutter/features/Group_Screen/Screens/Create_Group.dart";
import 'package:tomiru_social_flutter/features/Group_Screen/Screens/Group_Screen.dart';
import "../../Home_Social/Screens/Home.dart";
import "../../home/Screens/Home_Page.dart";
import "package:tomiru_social_flutter/features/Profile/Screens/Profile_Screen.dart";


import "../../../widgets/bottom_menu_bar/bottom_menu_bar.dart";
import "../../Friends/Screens/Friend_Screen.dart";



class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController passwordController = TextEditingController();
    bool isAdmin = true;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: SingleChildScrollView(
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
                      builder: (context) => const Home(),
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
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Homepage(),
                    ),
                  );
                },
                child: const Text('Home2'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BusinessScreen(),
                    ),
                  );
                },
                child: const Text('BusinessScreen'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CreateGroup(),
                    ),
                  );
                },
                child: const Text('Create Group'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatGroupScreen(
                        isAdmin: isAdmin,
                      ),
                    ),
                  );
                },
                child: const Text('ChatGroup'),
              ),
            ],
          ),
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
