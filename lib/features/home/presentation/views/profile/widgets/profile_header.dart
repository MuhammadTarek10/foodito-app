import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:foodito/config/extensions.dart';
import 'package:foodito/config/utils/assets.dart';
import 'package:foodito/config/utils/strings.dart';
import 'package:foodito/config/utils/values.dart';
import 'package:foodito/features/auth/domain/entities/user.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
    required this.user,
    required this.onEdit,
  });

  final User? user;
  final VoidCallback onEdit;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomLeft,
      height: context.height * AppSizes.s02,
      decoration: BoxDecoration(
        color: context.colorScheme.shadow,
        boxShadow: [
          BoxShadow(
            color: context.colorScheme.primary.withOpacity(0.5),
            blurRadius: 2,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.s20,
            ),
            child: Stack(
              children: [
                Container(
                  height: context.height * 0.1,
                  width: context.height * 0.1,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: context.colorScheme.background,
                    boxShadow: [
                      BoxShadow(
                        color: context.colorScheme.primary.withOpacity(0.5),
                        blurRadius: 2,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Image.asset(
                    AppAssets.noImage,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: InkWell(
                    onTap: onEdit,
                    child: Container(
                      height: context.height * AppSizes.s03,
                      width: context.height * AppSizes.s03,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: context.colorScheme.primary,
                      ),
                      child: const Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: AppSizes.s20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              user != null
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${AppStrings.hello.tr()}, ${user!.name}",
                          style: context.textTheme.headlineMedium,
                        ),
                        Text(
                          user!.email,
                          style: context.textTheme.bodyMedium,
                        )
                      ],
                    )
                  : const SizedBox.shrink(),
            ],
          )
        ],
      ),
    );
  }
}
