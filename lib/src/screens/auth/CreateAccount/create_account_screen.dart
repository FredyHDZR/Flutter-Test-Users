import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_users/src/components/input_form.dart';
import 'package:flutter_test_users/src/components/main_button.dart';
import 'package:flutter_test_users/src/screens/auth/CreateAccount/create_account_cubit.dart';
import 'package:flutter_test_users/src/theme/colors.dart';
import 'package:flutter_test_users/src/theme/fonts.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        leading: IconButton(
          padding: const EdgeInsets.all(5),
          onPressed: () {
            context.read<CreateAccountCubit>().closeControllers();
            Navigator.pop(context);
          },
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
        title: const Text('Create Account', style: AppFonts.subtitleWhite),
      ),
      body: body(),
    );
  }

  Widget body() {
    var blocBuilder = BlocBuilder<CreateAccountCubit, CreateAccountState>(
        builder: (context, state) {
      return Column(
        children: [
          InputForm(
              label: 'USER',
              controller: CreateAccountState.userController,
              onChanged: (value) =>
                  context.read<CreateAccountCubit>().validateUser(value),
              errorText: state.userError),
          const SizedBox(height: 20),
          InputForm(
              label: 'PASSWORD',
              controller: CreateAccountState.passwordController,
              isPassword: true,
              onChanged: (value) =>
                  context.read<CreateAccountCubit>().validatePassword(value),
              errorText: state.passwordError),
          const SizedBox(height: 20),
          InputForm(
              label: 'CONFIRM PASSWORD',
              controller: CreateAccountState.confirmpasswordController,
              isPassword: true,
              onChanged: (value) => context
                  .read<CreateAccountCubit>()
                  .validateConfirmPassword(value),
              errorText: state.confirmPasswordError),
          const Expanded(child: SizedBox()),
          MainButton(
              text: 'CREATE ACCOUNT',
              onPressed: () => context.read<CreateAccountCubit>().createAccount(context),
              enabled: state.enabledButton),
        ],
      );
    });

    return Container(
      color: AppColors.primaryColor,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        decoration: const BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: blocBuilder,
      ),
    );
  }
}
