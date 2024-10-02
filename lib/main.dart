import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'views/onboarding_screen/onboarding_screen.dart';

void main() async{
  runApp(const MyApp());
}
////////////

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      title: 'Event Management',
      //home:  BottomBarView(),
      home:  const OnBoardingScreen(),
    );
  }
}

