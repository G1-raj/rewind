import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rewind/app/theme/theme.dart';
import 'package:rewind/shared/widgets/agreement_checkbox/agreement_checkbox.dart';
import 'package:rewind/shared/widgets/custom_button/custom_button.dart';
import 'package:rewind/shared/widgets/google_auth_button/google_auth_button.dart';
import 'package:rewind/shared/widgets/input_field/input_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _cnfPasswordController = TextEditingController();

  final GlobalKey<FormState>  _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    
    _emailController.dispose();
    _nameController.dispose();
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

                  InputField(
                    hintText: "Full name",
                    prefixIcon: Icon(Icons.person_outline),
                    textEditingController: _nameController,
                  ),

                  const SizedBox(height: 12,),

                  InputField(
                    hintText: "Email address",
                    prefixIcon: Icon(Icons.mail_outline),
                    textEditingController: _emailController,
                  ),

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

                  const SizedBox(height: 15,),

                  SizedBox(
                    width: screenWidth * 0.6,
                    child: AgreementCheckbox(
                      value: false, 
                      onChanged: (value) {}, 
                      onPrivacyTap: () {}, 
                      onTermsTap: () {}
                    ),
                  ),

                  const SizedBox(
                    height: 35,
                  ),
            
                  CustomButton(
                    buttonText: "Create account", 
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
            
                  const SizedBox(height: 30,),
            
                  Text(
                    "or continue with",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w700,
                      color: AppTheme.subHeading,
                      letterSpacing: -0.3
                    ),
                  ),
            
                  const SizedBox(height: 30,),
            
                  GoogleAuthButton(
                    onPressed: () {},
                  ),
            
                  const SizedBox(height: 50,),

                  signUpRouter()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget signUpRouter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Already have an account?"),
        TextButton(
          onPressed: () {
            context.push('/signin');
          }, 
          child: Text("Sign In", style: GoogleFonts.inter(
            color: AppTheme.theme,
            fontWeight: FontWeight.w600
          ),)
        )
      ],
    );
  }

  Widget welcomeMessage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Create your",
          style: GoogleFonts.plusJakartaSans(
            fontSize: 30,
            letterSpacing: -0.8,
            height: 1.1,
            fontWeight: FontWeight.bold,
            color: AppTheme.heading
          ),
        ),

        Text(
          "account",
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
          "Let's get started with your",
          style: GoogleFonts.manrope(
            color: AppTheme.subHeading,
            fontWeight: FontWeight.w500,
            height: 1.6
          ),
        ),

        Text(
          "rewind journey",
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

