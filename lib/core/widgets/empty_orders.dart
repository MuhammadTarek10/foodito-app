import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodito/config/utils/assets.dart';
import 'package:foodito/config/utils/strings.dart';

class EmptyOrders extends StatelessWidget {
  const EmptyOrders({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(AppAssets.emptyOrder),
        Text(AppStrings.addOrder.tr()),
      ],
    );
  }
}
