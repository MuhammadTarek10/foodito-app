import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodito/config/extensions.dart';
import 'package:foodito/config/routes.dart';
import 'package:foodito/config/utils/strings.dart';
import 'package:foodito/core/widgets/custom_snackbar.dart';
import 'package:foodito/features/auth/presentation/state/providers/auth_provider.dart';
import 'package:foodito/features/home/presentation/views/profile/state/providers/user_provider.dart';
import 'package:foodito/features/home/presentation/views/profile/widgets/profile_header.dart';
import 'package:foodito/features/home/presentation/views/profile/widgets/profile_options.dart';

class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileHeader(user: user, onEdit: () => log("Edit")),
            SizedBox(height: context.height * 0.05),
            ProfileOptions(ref: ref),
          ],
        ),
        SignOutButton(
          onTap: () async {
            final result = await ref.read(authProvider.notifier).logout();
            if (context.mounted) {
              if (result) {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  Routes.login,
                  (route) => false,
                );
              } else {
                customSnackBar(
                  context: context,
                  message: AppStrings.unknownError.tr(),
                  isError: true,
                );
              }
            }
          },
        ),
      ],
    );
  }
}

class SignOutButton extends StatelessWidget {
  const SignOutButton({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 40,
      right: 20,
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Text(
              AppStrings.signout.tr(),
              style: const TextStyle(
                decoration: TextDecoration.underline,
              ),
            ),
            const SizedBox(width: 10),
            const Icon(Icons.logout_rounded),
          ],
        ),
      ),
    );
  }
}
