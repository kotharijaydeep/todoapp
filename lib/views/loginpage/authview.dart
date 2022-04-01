import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/views/homepage/landing_screen.dart';
import 'package:todoapp/views/loginpage/login.dart';
import 'package:todoapp/views/signuppage/signup.dart';

import '../splashscreen/splashscreen.dart';
import 'bloc/auth_bloc.dart';

class AuthView extends StatefulWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  _AuthViewState createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthBloc()..add(LoginInitial()),
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (_, state) {
          print('======>$state');
          if (state is AuthInitial) {
            return SplashScreen();
          } else if (state is AuthLogin) {
            return LoginPage();
          } else if (state is AuthSignUp) {
            return const SignUp();
          } else if (state is HomeScreen) {
            return const LandingScreen();
          } else {
            return Container(
              child: const Center(child: CircularProgressIndicator()),
            );
          }
        },
      )
    );
  }
}
