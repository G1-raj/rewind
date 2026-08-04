import 'package:flutter/material.dart';
import 'package:rewind/app/theme/theme.dart';

class AgreementCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final VoidCallback onPrivacyTap;
  final VoidCallback onTermsTap;

  const AgreementCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    required this.onPrivacyTap,
    required this.onTermsTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
        ),
        Expanded(
          child: Wrap(
            children: [
              const Text("I agree to the "),
              GestureDetector(
                onTap: onPrivacyTap,
                child: const Text(
                  "Privacy Policy",
                  style: TextStyle(
                    color: AppTheme.theme,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              const Text(" and "),
              GestureDetector(
                onTap: onTermsTap,
                child: const Text(
                  "Terms & Conditions",
                  style: TextStyle(
                    color: AppTheme.theme,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              const Text("."),
            ],
          ),
        ),
      ],
    );
  }
}