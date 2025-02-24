import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_users/src/components/section_profile_container.dart';
import 'package:flutter_test_users/src/models/user_model.dart';
import 'package:flutter_test_users/src/screens/UserDetail/user_detail_cubit.dart';
import 'package:flutter_test_users/src/theme/colors.dart';
import 'package:flutter_test_users/src/theme/fonts.dart';

class UserDetailScreen extends StatelessWidget {
  final User user;
  final String? image;
  const UserDetailScreen({super.key, required this.user, this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        automaticallyImplyLeading: true,
        leading: IconButton(
          padding: const EdgeInsets.all(5),
          onPressed: () => Navigator.pop(context),
          icon: Container(
            margin: const EdgeInsets.only(left: 10),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 23, 39, 54),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.arrow_back_ios_new,
                color: AppColors.secondaryColor, size: 18),
          ),
        ),
        title: const Text(
          'User Detail',
          style: AppFonts.subtitleWhite,
        ),
      ),
      body: body(),
    );
  }

  Widget body() {
    var blocBuilder = BlocBuilder<UserDetailCubit, UserDetailState>(
      builder: (context, state) {
        var content = SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(image ?? ''),
              ),
              const SizedBox(height: 10), 
              Text(user.name, style: AppFonts.subtitle),
              Text(user.email, style: AppFonts.bodyGray),
              const SizedBox(height: 30),
              SectionProfileContainer(
                title: 'Phone',
                icon: Icons.phone,
                value: user.phone,
              ),
              const SizedBox(height: 10 ),
              SectionProfileContainer(
                title: 'Website',
                icon: Icons.language,
                value: user.website,
              ),
              const SizedBox(height: 10),
              SectionProfileContainer(
                title: 'Company',
                icon: Icons.business,
                value: user.company.name,
              ),
              const SizedBox(height: 10),
              SectionProfileContainer(
                title: 'Address',
                icon: Icons.location_on,
                value: user.address.fullAddress,
              ),
            ],
          ),
        );

        return Container(
          margin: const EdgeInsets.fromLTRB(20, 12, 20, 32),
          padding: const EdgeInsets.all(20),
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(29, 21, 21, 21),
                offset: Offset(0, 10),
                blurRadius: 20,
              ),
            ],
          ),
          child: content,
        );
      },
    );

    return Container(
        color: AppColors.primaryColor,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            color: AppColors.secondaryColor,
          ),
          child: Stack(
            children: [
              Container(
                color: AppColors.primaryColor,
                height: 100,
              ),
              blocBuilder
            ],
          ),
        ));
  }
}
