import 'package:flutter/material.dart';
import 'package:podeo_assignment_one/ui/theme/app_colors.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final bool isLoading;
  const CustomButton({
    Key? key,
    required this.onTap,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 70,
        decoration: BoxDecoration(
          color: AppColors.accent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: (isLoading == true)
              ? const Icon(
                  Icons.refresh,
                  color: Colors.white,
                  size: 45,
                )
              : const Text(
                  'Log In',
                  style: TextStyle(
                    fontSize: 23,
                    color: Colors.white,
                  ),
                ),
        ),
      ),
    );
  }
}
