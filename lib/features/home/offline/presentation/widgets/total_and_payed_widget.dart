import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:foodito/config/utils/strings.dart';
import 'package:foodito/features/home/offline/presentation/widgets/value_container_widget.dart';

class TotalAndPriceWidget extends StatelessWidget {
  const TotalAndPriceWidget({
    super.key,
    required this.total,
    required this.payed,
  });

  final double total;
  final double payed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ValueContainer(
          text: AppStrings.total.tr(),
          total: total,
        ),
        ValueContainer(
          text: AppStrings.payed.tr(),
          total: payed,
        ),
      ],
    );
  }
}
