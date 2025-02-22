import 'package:flutter/material.dart';
import 'package:flutter_test_users/src/models/user_model.dart';
import 'package:flutter_test_users/src/routes/routes_names.dart';
import 'package:flutter_test_users/src/theme/fonts.dart';

class UserItemList extends StatelessWidget {
  final User user;
  final String? image;
  const UserItemList({super.key, required this.user, this.image});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        Navigator.pushNamed(context, RoutesNames.userDetail,
            arguments: {'user': user, 'image': image});
      },
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(image ?? ''),
        ),
        title: Text(user.name, style: AppFonts.bodyBold),
        subtitle: Text(user.email, style: AppFonts.bodyGray),
      ),
    );
  }
}
