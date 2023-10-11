import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:foodito/config/utils/strings.dart';
import 'package:foodito/features/home/offline/presentation/widgets/value_container_widget.dart';

class RemainingWidget extends StatelessWidget {
  const RemainingWidget({
    super.key,
    required this.remaining,
  });

  final double remaining;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ValueContainer(
          text: AppStrings.remaining.tr(),
          total: remaining,
        ),
      ],
    );
  }
}
