import 'package:get/get.dart';
import 'package:pyramid_pharmacy/screens/dashboard.dart';
import 'package:pyramid_pharmacy/screens/login.dart';
import 'package:pyramid_pharmacy/screens/onboarding_page.dart';
import 'package:pyramid_pharmacy/screens/register.dart';
import 'package:pyramid_pharmacy/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:pyramid_pharmacy/screens/send_prescription.dart';
import 'package:pyramid_pharmacy/screens/splash.dart';

import 'screens/input_page.dart';

void main() {
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xff173882),
        scaffoldBackgroundColor: Color(0xFFfafafa),
      ),
      home: InputPage(),
      initialRoute: '/splash',
      routes: {
        ResultPage.routeName: (context) => ResultPage(),
        '/splash': (context) => SplashScreen(),
        '/onboarding': (context) => OnboardingScreen(),
        '/login' : (context) => LoginScreen(),
        '/register' : (context)=> RegisterScreen(),
        '/dashboard': (context) => DashboardPage(),
        '/bmi-input': (context) => InputPage(),
        '/send-presecription' : (context) => SubmitSubscription()
      },
    );
  }
}
