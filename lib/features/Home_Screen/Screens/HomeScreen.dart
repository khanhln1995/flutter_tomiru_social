import 'package:flutter/material.dart';
import "package:tomiru_social_flutter/features/Business_Screen/Screens/Business_Screen.dart";



import 'package:tomiru_social_flutter/features/group_screen/Screens/Group_Screen.dart';
import "package:tomiru_social_flutter/features/group_screen/Screens/group_option.dart";
import 'package:tomiru_social_flutter/features/Profile-social/Screens/Profile_Screen.dart';




import "package:tomiru_social_flutter/features/Group_Screen/Screens/Chat_Group_Screen.dart";
import "package:tomiru_social_flutter/features/Group_Screen/Screens/Create_Group.dart";
import "package:tomiru_social_flutter/features/social_network/Screens/social_network.dart";
// import 'package:tomiru_social_flutter/features/Group_Screen/Screens/Group_Screen.dart';
import "../../home/Screens/Home_Page.dart";

//
import "../../../widgets/bottom_menu_bar/bottom_menu_bar.dart";
//
// import "../../../screens/Friend_Screen/Page_View.dart";

// import "../../Home/Screens/Home.dart";
import "package:tomiru_social_flutter/features/auth/screens/sign_in_screen.dart";

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

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome to My Flutter App!'),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignInScreen(
                      exitFromApp: true,
                      backFromThis: true,
                    ),
                  ),
                );
              },
              child: const Text('login_test_api'),
            ),
           
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(

                    builder: (context) => const Homepage(),

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
                    builder: (context) => const GroupOption(isAdmin: true),
                  ),
                );
              },
              child: const Text('GroupOption'),
            ),
           
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(

                    builder: (context) => SocialNetwork(),

                  ),
                );
              },
              child: const Text('Home Social'),
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
