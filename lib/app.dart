import 'package:flutter/material.dart';
import 'features/home_screen/screens/HomeScreen.dart';
import "ui/theme/theme.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import "state/signup_state.dart";
import "./state/app_state.dart";

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
        home: Builder(
          builder: (context) {
            final appLogo = Image.asset(
              'assets/images/app-avatar.png', // Đường dẫn đến hình ảnh mới của bạn
              width: 48, // Kích thước biểu tượng ứng dụng
              height: 48,
            );

            return Scaffold(
              appBar: AppBar(
                title: const Text('Home Screen'),
                leading: appLogo, // Sử dụng biểu tượng ứng dụng ở đây
              ),
              body: const HomeScreen(),
            );
          },
        ),
      ),
    );
  }
}