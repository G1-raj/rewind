import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rewind/app/theme/theme.dart';
import 'package:rewind/shared/widgets/custom_button/custom_button.dart';

class ForgotPasswordRedirect extends StatelessWidget {
  const ForgotPasswordRedirect({super.key});

  final String mailMascot = 'lib/assets/mail_mascot_two.png';

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
                SizedBox(
                  height: screenHeight * 0.35,
                  child: Image.asset(
                    mailMascot,
                    fit: BoxFit.contain,
                  ),
                ),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50, left: 25),
                    child: welcomeMessage()
                  )
                ),
          
                const SizedBox(height: 35,),

                alertBox(screenWidth * 0.9, screenHeight * 0.1),

                const SizedBox(height: 25,),

                CustomButton(
                  buttonText: "Open email app", 
                  width: screenWidth * 0.8,
                  height: screenHeight * 0.06, 
                  borderRadius: 15.0, 
                  buttonColor: Colors.transparent, 
                  textColor: AppTheme.white, 
                  textSize: 18.0,
                  isGradient: true,
                  gradientColors: [AppTheme.gradientOne, AppTheme.gradientTwo],
                  onPressed: () {
                    context.push('/change_password');
                  },
                ),
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
        Row(
          children: [
            Text(
              "Check your",
              style: GoogleFonts.plusJakartaSans(
                fontSize: 30,
                letterSpacing: -0.8,
                height: 1.1,
                fontWeight: FontWeight.bold,
                color: AppTheme.heading
              ),
            ),

            const SizedBox(width: 8,),

            Text(
              "email",
              style: GoogleFonts.plusJakartaSans(
                fontSize: 28,
                letterSpacing: -0.8,
                height: 1.1,
                fontWeight: FontWeight.w800,
                color: AppTheme.theme
              ),
            ),
          ],
        ),

        const SizedBox(height: 5,),

        Text(
          "We've sent a password reset link to",
          style: GoogleFonts.manrope(
            color: AppTheme.subHeading,
            fontWeight: FontWeight.w500,
            height: 1.6
          ),
        ),

        Text(
          "example@gmail.com",
          style: GoogleFonts.manrope(
            color: AppTheme.heading,
            fontWeight: FontWeight.w900,
            height: 1.6
          ),
        ),

        const SizedBox(height: 12,),

        Text(
          "Please check your inbox and follow the ",
          style: GoogleFonts.manrope(
            color: AppTheme.subHeading,
            fontWeight: FontWeight.w500,
            height: 1.6
          ),
        ),

        Text(
          "instructions",
          style: GoogleFonts.manrope(
            color: AppTheme.subHeading,
            fontWeight: FontWeight.w500,
            height: 1.6
          ),
        ),
      ],
    );
  }

  Widget alertBox(double width, double height) {
    return Container(
      width: width,
      height: height,
      color: AppTheme.themeAccent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.info_outline, color: AppTheme.theme,),
          const SizedBox(width: 18,),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "If you didn't see the email",
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  color: AppTheme.heading,
                  letterSpacing: -0.3
                ),
              ),
              Text(
                "check you spam or junk folder.",
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  color: AppTheme.heading,
                  letterSpacing: -0.3
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}