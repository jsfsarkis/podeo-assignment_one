import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:podeo_assignment_one/cubits/auth/user_cubit.dart';
import 'package:podeo_assignment_one/ui/screens/calculator_screen.dart';
import 'package:podeo_assignment_one/ui/screens/login_screen.dart';

import '../theme/app_colors.dart';

class SplashScreen extends StatelessWidget {
  static const String id = 'splash_screen';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      if (BlocProvider.of<UserCubit>(context).state.isLoggedIn) {
        await Future.delayed(const Duration(milliseconds: 750), () {
          Navigator.pushNamedAndRemoveUntil(context, CalculatorScreen.id, (route) => false);
        });
      } else {
        await Future.delayed(const Duration(microseconds: 750), () {
          Navigator.pushNamedAndRemoveUntil(context, LoginScreen.id, (route) => false);
        });
      }
    });
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Container(
          padding: const EdgeInsets.only(left: 100, right: 100),
          child: SvgPicture.asset(
            'assets/icons/calculator-icon.svg',
            color: AppColors.accent,
          ),
        ),
      ),
    );
  }
}
