import 'package:flutter/material.dart';
import 'package:flutter_test_users/src/theme/Colors.dart';
import 'package:flutter_test_users/src/theme/fonts.dart';

class InputForm extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final bool isPassword;
  final String? errorText;
  final Function(String) onChanged;
  const InputForm({super.key, required this.label, required this.controller, this.isPassword = false, this.errorText, required this.onChanged});

  @override
  State<InputForm> createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  bool showPassword = false;
  @override
  void initState() {
    showPassword = widget.isPassword;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
      return TextField(
        onChanged: widget.onChanged,
        controller: widget.controller,
        obscureText: showPassword,
        decoration: InputDecoration(
          errorText: widget.errorText != null && widget.errorText!.isNotEmpty ? widget.errorText : null,
          labelText: widget.label,
          contentPadding: const EdgeInsets.symmetric(vertical: 15),
          labelStyle: AppFonts.bodyGray,
          errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.tertiaryColor),
          ),
          suffixIcon: widget.isPassword ? IconButton(
            icon: Icon(showPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined, color: AppColors.green),
            onPressed: () {
              setState(() {
                showPassword = !showPassword;
              });
            },
          ) : null,
        ),
      );
  }
}
