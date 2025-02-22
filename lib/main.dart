import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'src/screens/SplashScreen/splash_screen.dart';
import 'src/screens/SplashScreen/bloc/splash_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => BlocProvider(
              create: (context) => SplashCubit()..initSplash(),
              child: const SplashScreen(),
            ),
        '/home': (context) => const Scaffold(
              body: Center(
                child: Text('Home Screen'),
              ),
            ),
      },
    );
  }
}
