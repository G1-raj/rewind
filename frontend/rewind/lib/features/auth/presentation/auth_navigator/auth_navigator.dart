import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rewind/app/theme/theme.dart';
import 'package:rewind/shared/widgets/custom_button/custom_button.dart';

class AuthNavigator extends StatelessWidget {
  const AuthNavigator({super.key});

  final String authMascot = "lib/assets/auth_mascot.png";

  @override
  Widget build(BuildContext context) {

    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;


    return Scaffold(
      backgroundColor: AppTheme.white,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
          
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50, left: 25),
                    child: welcomeMessage()
                  )
                ),
          
                const SizedBox(height: 35,),
          
                SizedBox(
                  height: screenHeight * 0.35,
                  child: Image.asset(
                    authMascot,
                    fit: BoxFit.contain,
                  ),
                ),
          
                const SizedBox(height: 50,),
          
                CustomButton(
                  buttonText: "Create Account", 
                  width: screenWidth * 0.85,
                  height: screenHeight * 0.06, 
                  borderRadius: 15.0, 
                  buttonColor: Colors.transparent, 
                  textColor: AppTheme.white, 
                  textSize: 18.0,
                  isGradient: true,
                  gradientColors: [AppTheme.gradientOne, AppTheme.gradientTwo],
                  onPressed: () {},
                ),
          
                const SizedBox(height: 20,),
          
                CustomButton(
                  buttonText: "Sign in", 
                  width: screenWidth * 0.85,
                  height: screenHeight * 0.06, 
                  borderRadius: 15.0, 
                  borderColor: AppTheme.subHeading,
                  buttonColor: AppTheme.white, 
                  textColor: AppTheme.heading, 
                  textSize: 18.0,
                  onPressed: () {},
                ),
          
                const SizedBox(
                  height: 40,
                ),
          
                termsAndPrivacySection(),
          
                const SizedBox(height: 28,)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget welcomeMessage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Welcome to",
          style: GoogleFonts.plusJakartaSans(
            fontSize: 30,
            letterSpacing: -0.8,
            height: 1.1,
            fontWeight: FontWeight.bold,
            color: AppTheme.heading
          ),
        ),

        Text(
          "rewind",
          style: GoogleFonts.plusJakartaSans(
            fontSize: 28,
            letterSpacing: -0.8,
            height: 1.1,
            fontWeight: FontWeight.w800,
            color: AppTheme.theme
          ),
        ),

        const SizedBox(height: 6,),

        Text(
          "Your digital memory timeline.",
          style: GoogleFonts.manrope(
            color: AppTheme.subHeading,
            fontWeight: FontWeight.w500,
            height: 1.6
          ),
        ),

        Text(
          "Save every moment, Relive anytime.",
          style: GoogleFonts.manrope(
            color: AppTheme.subHeading,
            fontWeight: FontWeight.w500,
            height: 1.6
          ),
        ),
      ],
    );
  }

  Widget termsAndPrivacySection() {
    return Column(
      children: [
        Text(
          "By continuing, you agree to our",
          style: GoogleFonts.inter(
            color: AppTheme.subHeading,
            fontWeight: FontWeight.w500,
            fontSize: 13,
            letterSpacing: -0.3
          ),
        ),

        const SizedBox(height: 8,),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              "Terms of Service",
              style: GoogleFonts.inter(
                color: AppTheme.theme,
                fontWeight: FontWeight.w500,
                fontSize: 14
              ),
            ),

            const SizedBox(width: 14,),

            Text(
              "Privacy Policy",
              style: GoogleFonts.inter(
                color: AppTheme.theme,
                fontWeight: FontWeight.w500,
                fontSize: 14
              ),
            ),

          ],
        )
      ],
    );
  }
}
