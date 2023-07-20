import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodito/config/extensions.dart';
import 'package:foodito/config/routes.dart';
import 'package:foodito/config/utils/assets.dart';
import 'package:foodito/config/utils/colors.dart';
import 'package:foodito/config/utils/strings.dart';
import 'package:foodito/config/utils/values.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: context.height * AppSizes.s05,
            child: Center(
              child: Container(
                height: context.height * AppSizes.s05,
                width: context.width,
                color: AppColors.shadeColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          AppStrings.onBoardingWelcome.tr(),
                          style: context.textTheme.headlineLarge,
                        ),
                        Text(
                          AppStrings.onBoardingBody.tr(),
                          style: context.textTheme.bodyMedium,
                          maxLines: 2,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(AppSizes.s14),
                          child: ElevatedButton(
                            onPressed: () =>
                                Navigator.pushNamed(context, Routes.register),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.black,
                              backgroundColor: AppColors.primaryColor,
                              elevation: 10,
                              shadowColor: AppColors.secondaryColor3,
                            ),
                            child: Text(
                              AppStrings.signUp.tr(),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () =>
                              Navigator.pushNamed(context, Routes.login),
                          child: Text(
                            AppStrings.alreadyHaveAnAccount.tr(),
                            style: context.textTheme.bodySmall,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: context.height * AppSizes.s02,
            child: SvgPicture.asset(
              AppAssets.onBoarding,
              width: context.width,
            ),
          ),
        ],
      ),
    );
  }
}
