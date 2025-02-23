import 'package:flutter/material.dart';
import 'package:flutter_test_users/src/theme/Colors.dart';
import 'package:flutter_test_users/src/theme/fonts.dart';

class SectionProfileContainer extends StatelessWidget {
  final String title;
  final IconData icon;
  final String value;
  const SectionProfileContainer(
      {super.key,
      required this.title,
      required this.icon,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.green),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppFonts.bodyBold),
                Text(value,
                    style: AppFonts.bodyGray,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
