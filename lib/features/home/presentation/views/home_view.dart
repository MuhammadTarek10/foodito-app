import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodito/config/extensions.dart';
import 'package:foodito/config/routes.dart';
import 'package:foodito/config/utils/assets.dart';
import 'package:foodito/config/utils/strings.dart';
import 'package:foodito/config/utils/values.dart';
import 'package:foodito/features/auth/presentation/widgets/custom_divider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(AppSizes.s14),
            child: Text(
              AppStrings.chooseMethod.tr(),
              style: context.textTheme.headlineSmall,
            ),
          ),
          InkWell(
            onTap: () => context.navigator.pushNamed(Routes.order),
            child: SvgPicture.asset(AppAssets.orderForGroup),
          ),
          const CustomDivider(),
          InkWell(
            onTap: () {},
            child: SvgPicture.asset(AppAssets.createRoom),
          ),
        ],
      ),
    );
  }
}
