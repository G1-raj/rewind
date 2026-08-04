import 'package:flutter/material.dart';
import 'package:rewind/features/auth/presentation/signin_screen/signin_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      // home: AuthNavigator(),
      home: SigninScreen(),
    );
  }
}