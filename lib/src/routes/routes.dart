import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_users/src/routes/routes_names.dart';
import 'package:flutter_test_users/src/screens/HomeScreen/home_bloc.dart';
import 'package:flutter_test_users/src/screens/HomeScreen/home_screen.dart';
import 'package:flutter_test_users/src/screens/SplashScreen/splash_bloc.dart';
import 'package:flutter_test_users/src/screens/SplashScreen/splash_screen.dart';

Map<String, Widget Function(BuildContext)> appRoutes = {
  RoutesNames.splash: (context) => BlocProvider(
      create: (context) => SplashCubit()..initSplash(),
      child: const SplashScreen()),
  RoutesNames.home: (context) =>
      BlocProvider(create: (context) => HomeCubit(), child: const HomeScreen()),
};
