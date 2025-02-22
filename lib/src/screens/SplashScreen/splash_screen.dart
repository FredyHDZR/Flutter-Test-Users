import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_users/src/routes/routes_names.dart';
import 'package:flutter_test_users/src/theme/Colors.dart';
import 'package:lottie/lottie.dart';
import 'splash_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return BlocListener<SplashCubit, bool>(
      listener: (context, state) {
        if (state) {
          Navigator.pushReplacementNamed(context, RoutesNames.home);
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
