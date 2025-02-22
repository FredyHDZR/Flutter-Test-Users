import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_users/src/screens/HomeScreen/home_bloc.dart';
import 'package:flutter_test_users/src/theme/Colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is HomeLoaded) {
            print(state.users);
          }
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.primaryColor,
            title: const Text(
              'Users',
              style: TextStyle(color: AppColors.white),
            ),
          ),
          body: body(),
        ));
  }

  Widget body() {
    return Container(
      color: AppColors.primaryColor,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Text('User ${index + 1}');
            },
          ),
        ),
      ),
    );
  }
}

