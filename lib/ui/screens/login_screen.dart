import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:podeo_assignment_one/cubits/auth/login_cubit.dart';
import 'package:podeo_assignment_one/cubits/auth/user_cubit.dart';
import 'package:podeo_assignment_one/ui/screens/calculator_screen.dart';
import 'package:podeo_assignment_one/ui/theme/app_colors.dart';
import 'package:podeo_assignment_one/ui/widgets/auth_textfield.dart';
import 'package:podeo_assignment_one/ui/widgets/custom_button.dart';
import 'package:podeo_assignment_one/ui/widgets/social_login_card.dart';

class LoginScreen extends StatelessWidget {
  static const String id = 'login_screen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.background,
        elevation: 0,
      ),
      body: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            context.read<UserCubit>().login(state.user);
            Navigator.pushNamedAndRemoveUntil(context, CalculatorScreen.id, (route) => false);
          }
          if (state is LoginValidationError) {
            Fluttertoast.showToast(
              msg: state.message,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.TOP,
              backgroundColor: AppColors.accent,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildScreenHeader(context),
                const SizedBox(height: 25),
                _buildSocialLogin(context),
                const SizedBox(height: 25),
                _buildNameField(context),
                const SizedBox(height: 5),
                _buildEmailField(context),
                const SizedBox(height: 5),
                _buildPasswordField(context),
                const SizedBox(height: 25),
                _buildLoginButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildScreenHeader(BuildContext context) {
    return const Text(
      'Login',
      style: TextStyle(
        color: Colors.white,
        fontSize: 45,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildSocialLogin(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Flexible(
          fit: FlexFit.loose,
          child: Text(
            'Login with one of the following options.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Flexible(
          fit: FlexFit.loose,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Flexible(
                flex: 20,
                fit: FlexFit.tight,
                child: SocialLoginCard(
                  icon: Icons.facebook,
                ),
              ),
              Spacer(flex: 2),
              Flexible(
                flex: 20,
                fit: FlexFit.tight,
                child: SocialLoginCard(
                  icon: Icons.apple,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildNameField(BuildContext context) {
    return AuthTextField(
      label: 'Full Name',
      hintText: 'Enter your full name...',
      onChanged: (value) {
        context.read<LoginCubit>().setFullName(value);
      },
    );
  }

  Widget _buildEmailField(BuildContext context) {
    return AuthTextField(
      label: 'Email',
      hintText: 'Enter your email...',
      onChanged: (value) {
        context.read<LoginCubit>().setEmail(value);
      },
    );
  }

  Widget _buildPasswordField(BuildContext context) {
    return AuthTextField(
      label: 'Password',
      hintText: 'Enter your password...',
      obscureText: true,
      onChanged: (value) {
        context.read<LoginCubit>().setPassword(value);
      },
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return CustomButton(
          isLoading: (state is LoginLoading) ? true : false,
          onTap: () {
            context.read<LoginCubit>().onLoginPressed();
          },
        );
      },
    );
  }
}
