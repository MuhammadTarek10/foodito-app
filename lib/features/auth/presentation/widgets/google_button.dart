import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:foodito/config/extensions.dart';
import 'package:foodito/config/utils/assets.dart';
import 'package:foodito/config/utils/strings.dart';
import 'package:foodito/config/utils/values.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSizes.s14),
      child: ElevatedButton(
        onPressed: () => log("Google"),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          elevation: 5,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppAssets.googleIcon,
              height: AppSizes.s20,
              width: AppSizes.s20,
            ),
            const SizedBox(width: AppSizes.s10),
            Text(
              AppStrings.continueWithGoogle.tr(),
              style: context.textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
