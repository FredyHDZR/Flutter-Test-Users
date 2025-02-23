// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_users/src/routes/routes_names.dart';
import 'package:flutter_test_users/src/theme/Colors.dart';
import 'package:flutter_test_users/src/utils/local_storage.dart';
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
          var token = await LocalStorage.getToken();
          if (token != null) {
            Navigator.pushReplacementNamed(context, RoutesNames.home);
          } else {
            Navigator.pushReplacementNamed(context, RoutesNames.login);
          }
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
