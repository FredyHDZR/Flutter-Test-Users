import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_users/src/components/user_item_list.dart';
import 'package:flutter_test_users/src/screens/HomeScreen/home_bloc.dart';
import 'package:flutter_test_users/src/theme/Colors.dart';
import 'package:flutter_test_users/src/theme/fonts.dart';

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
              style: AppFonts.subtitleWhite,
            ),
          ),
          body: body(),
        ));
  }

  Widget body() {
    var blocBuilder =
        BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      if (state is HomeLoaded) {
        var listView = ListView.builder(
          padding: const EdgeInsets.only(bottom: 100),
          itemCount: state.users.length,
          itemBuilder: (context, index) {
            return UserItemList(
                image: 'https://picsum.photos/200/300?random=${index + 1}',
                user: state.users[index]);
          },
        );

        return Padding(
          padding: const EdgeInsets.fromLTRB(12, 16, 12, 0),
          child: listView,
        );
      }
      return const Center(child: CircularProgressIndicator());
    });
    
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
          child: blocBuilder,
        ));
  }
}
