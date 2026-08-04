import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  final String background = "lib/assets/background.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image(
            height: MediaQuery.of(context).size.height,
            image: AssetImage(background),
            fit: BoxFit.cover,
          ),

          Positioned(
            top: 80,
            left: 150,
            child: Text("Welcome", style: TextStyle(
              fontSize: 35,
              color: Colors.white
            ),),
          )
        ],
      ),
    );
  }
}