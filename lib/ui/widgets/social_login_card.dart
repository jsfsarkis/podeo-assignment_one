import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:podeo_assignment_one/ui/theme/app_colors.dart';

class SocialLoginCard extends StatelessWidget {
  final IconData icon;
  const SocialLoginCard({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Fluttertoast.showToast(
          msg: 'Just a dummy :)',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          backgroundColor: AppColors.accent,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      },
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(color: Colors.grey),
        ),
        child: Icon(
          icon,
          size: 45,
          color: Colors.white,
        ),
      ),
    );
  }
}
