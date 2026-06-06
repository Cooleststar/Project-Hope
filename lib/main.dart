import 'package:flutter/material.dart';
import 'pages/landing_page.dart';
import 'constants.dart';

void main() => runApp(const MyApp());

const APIKEY = 'APIKEY'; // Add your API KEY Here

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Project Hope',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryPurple,
          primary: AppColors.primaryPurple,
          secondary: AppColors.primaryPink,
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.backgroundGray,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.backgroundGray,
          elevation: 0,
          iconTheme: IconThemeData(color: AppColors.darkBlue),
          titleTextStyle: TextStyle(
            color: AppColors.darkBlue,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryPink,
            foregroundColor: Colors.white,
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      home: LandingPage(),
    );
  }
}
