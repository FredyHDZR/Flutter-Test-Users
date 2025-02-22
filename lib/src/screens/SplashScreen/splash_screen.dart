import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_users/src/routes/routes_names.dart';
import 'splash_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, bool>(
      listener: (context, state) {
        if (state) {
          Navigator.pushReplacementNamed(context, RoutesNames.home);
        }
      },
      child: const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
