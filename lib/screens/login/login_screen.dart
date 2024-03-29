import 'package:bloc_pattern/screens/login/components/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/authentication/authentication_bloc.dart';
import '../home/home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is AuthenticationFailState) {
            SnackBar snackBar = const SnackBar(
              content: Text('No user found'),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
          if (state is AuthenticationSuccessState) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => HomeScreen(
                  user: state.user,
                ),
              ),
            );
          }
        },
        child: Body(),
      ),
    );
  }
}