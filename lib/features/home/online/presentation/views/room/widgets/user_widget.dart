import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodito/config/extensions.dart';
import 'package:foodito/config/utils/assets.dart';
import 'package:foodito/config/utils/values.dart';
import 'package:foodito/features/auth/domain/entities/user.dart';

class UserWidget extends StatelessWidget {
  const UserWidget({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(AppSizes.s8),
      decoration: BoxDecoration(
          color: context.colorScheme.background,
          borderRadius: BorderRadius.circular(AppSizes.s8),
          boxShadow: [
            BoxShadow(
              color: context.colorScheme.onBackground.withOpacity(0.1),
              blurRadius: AppSizes.s8,
              offset: const Offset(0, 4),
            ),
          ]),
      child: ListTile(
        leading: const Icon(Icons.people),
        title: Text(user.name),
        trailing: SvgPicture.asset(AppAssets.delete),
      ),
    );
  }
}
