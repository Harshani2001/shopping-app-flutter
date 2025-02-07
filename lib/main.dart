import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_project/auth/bloc/sign_in_bloc.dart';
import 'package:my_project/auth/bloc/sign_up_bloc.dart';
import 'package:my_project/auth/ui/sign_in_screen.dart';
import 'package:my_project/auth/ui/sign_up_screen.dart';
import 'package:my_project/onbording/bloc/onboarding_bloc.dart';
import 'package:my_project/onbording/ui/find_store_screen.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => OnboardingBloc()),
        BlocProvider(create: (context) => AuthBloc()),
        BlocProvider(create: (context) => SignUpBloc()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const FindStoreScreen(),
        '/signin': (context) => SignInScreen(),
        '/signup': (context) => SignUpScreen(),
      },
    );
  }
}