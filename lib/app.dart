import 'package:flutter/material.dart';
import 'screens/Home_Screen/HomeScreen.dart';
import "ui/theme/theme.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import "state/signup_state.dart";
import "./state/app_state.dart";
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<SignupState>(create: (_) => SignupState()),
           ChangeNotifierProvider<AppState>(create: (_) => AppState()),
        ],
        child: MaterialApp(
          title: 'My Flutter App',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.appTheme.copyWith(
            textTheme: GoogleFonts.mulishTextTheme(
              Theme.of(context).textTheme,
            ),
          ),
          home: const HomeScreen(),
        ));
  }
}
