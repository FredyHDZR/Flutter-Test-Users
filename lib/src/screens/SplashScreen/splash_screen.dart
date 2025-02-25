// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_users/src/screens/auth/LoginScreen/login_cubit.dart';
import 'package:flutter_test_users/src/screens/auth/LoginScreen/login_screen.dart';
import 'package:flutter_test_users/src/theme/colors.dart';
import 'package:lottie/lottie.dart';
import 'splash_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return BlocListener<SplashCubit, bool>(
      listener: (context, state) async {
        if (state) {
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 500),
              pageBuilder: (context, animation, secondaryAnimation) =>
                  BlocProvider(
                      create: (context) => LoginCubit(),
                      child: const LoginScreen()),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                var begin = const Offset(0.0, 1.0);
                var end = Offset.zero;
                var curve = Curves.easeInOut;
                var tween = Tween(begin: begin, end: end).chain(
                  CurveTween(curve: curve),
                );
                return SlideTransition(
                  position: animation.drive(tween),
                  child: child,
                );
              },
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: Stack(
          alignment: Alignment.center,
          children: [
            Lottie.asset('assets/animations/sparkles.json',
                width: width, height: height),
            Center(
              child: Lottie.asset('assets/animations/launch_screen.json',
                  width: width / 2, height: width / 2),
            ),
          ],
        ),
      ),
    );
  }
}
