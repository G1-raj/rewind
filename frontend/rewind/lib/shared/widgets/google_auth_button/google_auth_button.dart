import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rewind/app/theme/theme.dart';

class GoogleAuthButton extends StatelessWidget {
  final VoidCallback? onPressed;
  const GoogleAuthButton({super.key, this.onPressed});

  final String googleLogo = "lib/assets/google_logo.png";

  @override
  Widget build(BuildContext context) {

    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;


    return SizedBox(
      width: screenWidth * 0.85,
      height: screenHeight * 0.06,

      child: ElevatedButton(
        onPressed: onPressed, 
        style: ElevatedButton.styleFrom(
          backgroundColor: AppTheme.white,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(15.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              width: screenWidth * 0.08,
              image: AssetImage(googleLogo),
            ),

            const SizedBox(width: 12,),

            Text(
              "Continue with Google",
              style: GoogleFonts.inter(
                color: AppTheme.heading,
                fontWeight: FontWeight.w700,
                fontSize: 15,
                letterSpacing: -0.3
              ),
            )
          ],
        )
      ),
    );
  }
}