import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_users/src/routes/routes_names.dart';
import 'package:flutter_test_users/src/screens/HomeScreen/home_bloc.dart';
import 'package:flutter_test_users/src/screens/HomeScreen/home_screen.dart';
import 'package:flutter_test_users/src/screens/LoginScreen/login_cubit.dart';
import 'package:flutter_test_users/src/screens/LoginScreen/login_screen.dart';
import 'package:flutter_test_users/src/screens/SplashScreen/splash_bloc.dart';
import 'package:flutter_test_users/src/screens/SplashScreen/splash_screen.dart';
import 'package:flutter_test_users/src/screens/UserDetail/user_detail_cubit.dart';
import 'package:flutter_test_users/src/screens/UserDetail/user_detail_screen.dart';

Map<String, Widget Function(BuildContext)> appRoutes = {
  RoutesNames.splash: (context) => BlocProvider(
      create: (context) => SplashCubit()..initSplash(),
      child: const SplashScreen()),
  RoutesNames.home: (context) =>
      BlocProvider(create: (context) => HomeCubit(), child: const HomeScreen()),
  RoutesNames.login: (context) => BlocProvider(
      create: (context) => LoginCubit(), child: const LoginScreen()),
  RoutesNames.userDetail: (context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return BlocProvider(
        create: (context) => UserDetailCubit(),
        child: UserDetailScreen(
          user: args['user'],
          image: args['image'],
      ));
  },
};
