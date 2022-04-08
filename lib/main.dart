import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:podeo_assignment_one/cubits/auth/user_cubit.dart';
import 'package:podeo_assignment_one/cubits/calculator/calculator_cubit.dart';
import 'package:podeo_assignment_one/ui/screens/calculator_screen.dart';
import 'package:podeo_assignment_one/ui/screens/login_screen.dart';
import 'package:podeo_assignment_one/ui/screens/splash_screen.dart';

import 'cubits/auth/login_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = await HydratedStorage.build(storageDirectory: await getApplicationDocumentsDirectory());
  HydratedBlocOverrides.runZoned(
    () => runApp(const MyApp()),
    storage: storage,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(create: (context) => LoginCubit()),
        BlocProvider<UserCubit>(create: (context) => UserCubit()),
        BlocProvider<CalculatorCubit>(create: (context) => CalculatorCubit()),
      ],
      child: MaterialApp(
        initialRoute: SplashScreen.id,
        routes: {
          SplashScreen.id: (context) => const SplashScreen(),
          LoginScreen.id: (context) => const LoginScreen(),
          CalculatorScreen.id: (context) => const CalculatorScreen(),
        },
      ),
    );
  }
}
