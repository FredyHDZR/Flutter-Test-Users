import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_users/src/routes/routes_names.dart';
import 'package:flutter_test_users/src/screens/SplashScreen/bloc/splash_bloc.dart';
import 'package:flutter_test_users/src/screens/SplashScreen/splash_screen.dart';

Map<String, Widget Function(BuildContext)> appRoutes = {
  RoutesNames.splash: (context) => BlocProvider(
      create: (context) => SplashCubit()..initSplash(),
      child: const SplashScreen()),
};
