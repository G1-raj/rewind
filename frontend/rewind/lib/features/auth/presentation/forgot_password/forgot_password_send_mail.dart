import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rewind/app/theme/theme.dart';
import 'package:rewind/shared/widgets/custom_button/custom_button.dart';
import 'package:rewind/shared/widgets/input_field/input_field.dart';

class ForgotPasswordSendMail extends StatefulWidget {
  const ForgotPasswordSendMail({super.key});

  @override
  State<ForgotPasswordSendMail> createState() => _ForgotPasswordSendMailState();
}

class _ForgotPasswordSendMailState extends State<ForgotPasswordSendMail> {

  final TextEditingController _emailController = TextEditingController();

  final mailMascotOne = 'lib/assets/mail_mascot_one.png';

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

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
          
                const SizedBox(height: 15,),

                 SizedBox(
                  height: screenHeight * 0.35,
                  child: Image.asset(
                    mailMascotOne,
                    fit: BoxFit.contain,
                  ),
                ),

                const SizedBox(height: 15),

                InputField(
                  hintText: "Email address", 
                  prefixIcon: Icon(Icons.mail_outline), 
                  textEditingController: _emailController
                ),

                const SizedBox(height: 35,),

                 CustomButton(
                  buttonText: "Send Reset Link", 
                  width: screenWidth * 0.8,
                  height: screenHeight * 0.06, 
                  borderRadius: 15.0, 
                  buttonColor: Colors.transparent, 
                  textColor: AppTheme.white, 
                  textSize: 18.0,
                  isGradient: true,
                  gradientColors: [AppTheme.gradientOne, AppTheme.gradientTwo],
                  onPressed: () {},
                ),

                const SizedBox(height: 60,),

                TextButton(
                  onPressed: () {}, 
                  child: Text(
                    "Back to sign in",
                    style: TextStyle(
                      color: AppTheme.theme,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.3,
                    ),
                  )
                )
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
          "Forgot Password?",
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
          "Don't worry! it happens.",
          style: GoogleFonts.manrope(
            color: AppTheme.subHeading,
            fontWeight: FontWeight.w500,
            height: 1.6
          ),
        ),

        Text(
          "Enter your email and we'll send you",
          style: GoogleFonts.manrope(
            color: AppTheme.subHeading,
            fontWeight: FontWeight.w500,
            height: 1.6
          ),
        ),

        Text(
          "a link to reset password",
          style: GoogleFonts.manrope(
            color: AppTheme.subHeading,
            fontWeight: FontWeight.w500,
            height: 1.6
          ),
        ),
      ],
    );
  }
}