import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodito/config/extensions.dart';
import 'package:foodito/config/utils/assets.dart';
import 'package:foodito/config/utils/strings.dart';
import 'package:foodito/config/utils/values.dart';

class ServerTryAgain extends StatelessWidget {
  const ServerTryAgain({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          AppAssets.serverError,
          height: context.height * AppSizes.s03,
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: AppSizes.s20),
          child: ElevatedButton(
            onPressed: onPressed,
            child: Text(AppStrings.tryAgain.tr()),
          ),
        ),
      ],
    );
  }
}
