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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: const Text(
          'Users',
          style: AppFonts.subtitleWhite,
        ),
      ),
      body: body(context),
    );
  }

  Widget body(BuildContext context) {
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

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
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
            )),
        Positioned(bottom: 30, child: bottomBar(context))
      ],
    );
  }

  Widget bottomBar(BuildContext context) {
    var widthSize = MediaQuery.of(context).size.width - 200;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      width: widthSize,
      decoration: const BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.home,
                  color: AppColors.secondaryColor, size: 32)),
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.person,
                  color: AppColors.secondaryColor, size: 32)),
        ],
      ),
    );
  }
}
