import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_users/src/components/input_form.dart';
import 'package:flutter_test_users/src/components/main_button.dart';
import 'package:flutter_test_users/src/screens/LoginScreen/login_cubit.dart';
import 'package:flutter_test_users/src/theme/Colors.dart';
import 'package:flutter_test_users/src/theme/fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.secondaryColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.secondaryColor,
          appBar: AppBar(
            backgroundColor: AppColors.secondaryColor,
          ),
          body: body(),
        ),
      ),
    );
  }

  Widget body() {
    var blocBuilder =
        BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
      var rememberCheckbox = Transform.translate(
          offset: const Offset(-8, 0),
          child: Row(
            children: [
              Checkbox(
                checkColor: AppColors.secondaryColor,
                activeColor: AppColors.green,
                splashRadius: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                visualDensity: VisualDensity.compact,
                value: state.rememberMe,
                onChanged: (_) => context.read<LoginCubit>().toggleRememberMe(),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              const Text('Remember me', style: AppFonts.bodyBold),
            ],
          ));

      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('User', style: AppFonts.titlePrimary),
              Container(
                width: 100,
                height: 100,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: AppColors.green,
                  shape: BoxShape.circle,
                ),
                child: Text('App',
                    style: AppFonts.titlePrimary.copyWith(
                        color: AppColors.secondaryColor,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.secondaryColor,
                        decorationThickness: 2)),
              )
            ],
          ),
          const SizedBox(height: 32),
          InputForm(
              label: 'USER',
              controller: LoginState.userController,
              onChanged: (value) =>
                  context.read<LoginCubit>().validateUser(value),
              errorText: state.userError),
          const SizedBox(height: 5),
          InputForm(
              label: 'PASSWORD',
              controller: LoginState.passwordController,
              isPassword: true,
              onChanged: (value) =>
                  context.read<LoginCubit>().validatePassword(value),
              errorText: state.passwordError),
          const SizedBox(height: 20),
          rememberCheckbox,
          const SizedBox(height: 20),
          MainButton(
              text: 'LOGIN',
              onPressed: () => context.read<LoginCubit>().login(context)),
          const Expanded(child: SizedBox()),
          const Text('Don\'t have an account?', style: AppFonts.bodyBold),
          TextButton(
              onPressed: () {},
              child: Text('Create an account',
                  style: AppFonts.body.copyWith(color: AppColors.green)))
        ],
      );
    });

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: blocBuilder,
    );
  }
}
