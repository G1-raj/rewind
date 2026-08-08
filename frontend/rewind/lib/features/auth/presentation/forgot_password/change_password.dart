import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rewind/app/theme/theme.dart';
import 'package:rewind/shared/widgets/custom_button/custom_button.dart';
import 'package:rewind/shared/widgets/input_field/input_field.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _cnfPasswordController = TextEditingController();

  @override
  void dispose() {

    _passwordController.dispose();
    _cnfPasswordController.dispose();

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
          child: Form(
            key: _formKey,
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

                  const SizedBox(height: 12,),

                  InputField(
                    hintText: "Password",
                    isPassword: true,
                    textEditingController: _passwordController,
                    prefixIcon: Icon(Icons.lock_outlined),

                    validator: (value) {
                      return validatePassword(value);
                    }

                  ),

                  const SizedBox(height: 12,),

                  InputField(
                    hintText: "Confirm password",
                    isPassword: true,
                    textEditingController: _cnfPasswordController,
                    prefixIcon: Icon(Icons.lock_outlined),

                    validator: (value) {
                      return validatePassword(value);
                    }

                  ),

                  const SizedBox(height: 25,),

                  Container(
                    width: screenWidth * 0.85,
                    height: screenHeight * 0.25,
                    color: AppTheme.themeAccent,
                  ),

                  const SizedBox(height: 25,),

                  CustomButton(
                    buttonText: "Reset Password", 
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

                  const SizedBox(
                    height: 35,
                  ),

                  TextButton(
                    onPressed: () {
                      
                    }, 
                    child: Text("Back to sign in", style: GoogleFonts.inter(
                      color: AppTheme.theme,
                      fontWeight: FontWeight.w600
                    ),)
                  )
                ],
              ),
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
              "Create new",
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
              "password",
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
          "Enter your new password below",
          style: GoogleFonts.manrope(
            color: AppTheme.subHeading,
            fontWeight: FontWeight.w500,
            height: 1.6
          ),
        ),


        Text(
          "to reset your account password",
          style: GoogleFonts.manrope(
            color: AppTheme.subHeading,
            fontWeight: FontWeight.w500,
            height: 1.6
          ),
        ),
      ],
    );
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Please provide the password";
    }

    if (value.length < 6 || value.length > 12) {
      return "Password length must be between 6 and 12 characters";
    }

    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return "Must contain at least one capital letter";
    }

    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return "Must contain at least one small letter";
    }

    if (!RegExp(r'\d').hasMatch(value)) {
      return "Must contain at least one number";
    }

    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return "Must contain at least one special character";
    }

    return null;
  }
}