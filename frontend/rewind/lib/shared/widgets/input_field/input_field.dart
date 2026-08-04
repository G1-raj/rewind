import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputField extends StatefulWidget {
  final String hintText;
  final Icon prefixIcon;
  final bool isPassword;
  final TextEditingController textEditingController;
  final String? Function(String?)? validator; 
  const InputField(
    {
      super.key,
      required this.hintText,
      required this.prefixIcon,
      this.isPassword = false,
      required this.textEditingController,
      this.validator
    }
  );

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {

  late bool _obscureText;

  @override
  void initState() {
    super.initState();

    _obscureText = widget.isPassword;
  }


  @override
  Widget build(BuildContext context) {

    // final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: screenWidth * 0.9,
      child: TextFormField(
        controller: widget.textEditingController,
        obscureText: _obscureText,
        validator: widget.validator,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: GoogleFonts.plusJakartaSans(
            color: Color.fromRGBO(177, 178, 193, 1),
            letterSpacing: -0.3,
            fontWeight: FontWeight.w600
          ),
          prefixIcon: widget.prefixIcon,
          prefixIconColor: Color.fromRGBO(177, 178, 193, 1),
          suffixIcon: widget.isPassword ? GestureDetector(
            onTap: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
      
            child: Icon(
              _obscureText ? Icons.visibility_outlined : Icons.visibility_off_outlined
            ),
          ) : null,
          suffixIconColor: Color.fromRGBO(177, 178, 193, 1),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(
              color: Color.fromRGBO(177, 178, 193, 1)
            )
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(
              color: Color.fromRGBO(177, 178, 193, 1)
            )
          ),
      
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(
              color: Color.fromRGBO(177, 178, 193, 1)
            )
          ),
      
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(
              color: Colors.red
            ),
          ),
        ),
      )
    );
  }
}