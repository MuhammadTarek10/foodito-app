import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodito/config/extensions.dart';
import 'package:foodito/config/utils/strings.dart';
import 'package:foodito/config/utils/values.dart';

class ProfileOptions extends StatelessWidget {
  const ProfileOptions({
    super.key,
    required this.ref,
  });

  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSizes.s10),
      child: Column(
        children: [
          ProfileOption(
            icon: Icons.history,
            onTap: () => log("History"),
            title: AppStrings.history.tr(),
          ),
          ProfileOption(
            icon: Icons.group,
            onTap: () => log("Room"),
            title: AppStrings.rooms.tr(),
          ),
        ],
      ),
    );
  }
}

class ProfileOption extends StatelessWidget {
  const ProfileOption({
    super.key,
    required this.icon,
    required this.onTap,
    required this.title,
  });

  final IconData icon;
  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSizes.s10),
      child: ListTile(
        leading: Icon(icon, size: context.width * 0.1),
        title: Text(title, style: context.textTheme.bodyMedium),
        onTap: onTap,
      ),
    );
  }
}
