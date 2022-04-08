import 'package:flutter/material.dart';
import 'package:podeo_assignment_one/ui/theme/app_colors.dart';

class AuthTextField extends StatelessWidget {
  final String label;
  final String? hintText;
  final Function onChanged;
  final bool? obscureText;
  const AuthTextField({
    Key? key,
    required this.label,
    required this.onChanged,
    this.obscureText,
    this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 25,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 80,
          child: TextField(
            obscureText: (obscureText != null) ? obscureText! : false,
            cursorColor: AppColors.accent,
            onChanged: (value) {
              onChanged(value);
            },
            style: const TextStyle(
              fontSize: 23,
              color: Colors.white,
            ),
            decoration: InputDecoration(
              hintText: hintText ?? '',
              hintStyle: const TextStyle(
                color: Colors.grey,
                fontSize: 23,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey, width: 1.5),
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.accent, width: 1.5),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
