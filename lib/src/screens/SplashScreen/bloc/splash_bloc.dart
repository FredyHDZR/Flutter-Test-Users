import 'package:flutter_bloc/flutter_bloc.dart';

class SplashCubit extends Cubit<bool> {
  SplashCubit() : super(false);

  Future<void> initSplash() async {
    await Future.delayed(const Duration(seconds: 2));
    emit(true);
  }
} 