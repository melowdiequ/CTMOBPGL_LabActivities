import 'package:bermudez_mobileprog/screens/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'screens/newsfeed_screen.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return ScreenUtilInit(
      designSize: const Size(412, 715),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Glyza Facebook', 
          initialRoute: '/home',
          routes: {
            '/newsfeed': (context) => const NewsFeedScreen(), 
            '/home': (context) => const HomeScreen(),
            '/notification': (context) => NotificationScreen(),
          },
        );
      },
    );
  }
}