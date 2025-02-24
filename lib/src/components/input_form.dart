import 'package:flutter/material.dart';
import 'package:flutter_test_users/src/theme/colors.dart';
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
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.label, style: AppFonts.bodyBold),
          TextField(
            onChanged: widget.onChanged,
            controller: widget.controller,
            obscureText: showPassword,
            decoration: InputDecoration(
              errorText: widget.errorText != null && widget.errorText!.isNotEmpty ? widget.errorText : null,
              contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              labelStyle: AppFonts.bodyGray,
              fillColor: AppColors.tertiaryColor.withOpacity(0.1),
              filled: true,
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.transparent),
              ),
              errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.red),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: AppColors.primaryColor),
              ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.transparent),
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
          ),
        ],
      );
  }
}
