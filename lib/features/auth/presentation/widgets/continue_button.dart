import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:foodito/config/utils/colors.dart';
import 'package:foodito/config/utils/strings.dart';
import 'package:foodito/config/utils/values.dart';

class ContinueButton extends StatelessWidget {
  const ContinueButton({
    super.key,
    required StreamController<bool?> activateContinueController,
    required this.onTap,
  }) : _activateContinueController = activateContinueController;

  final StreamController<bool?> _activateContinueController;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSizes.s10),
      child: StreamBuilder<bool?>(
          stream: _activateContinueController.stream,
          builder: (context, snapshot) {
            final right = snapshot.hasData && snapshot.requireData == true;
            return ElevatedButton(
              onPressed: () => right ? onTap() : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: right ? AppColors.primaryColor : Colors.grey,
              ),
              child: Text(AppStrings.continueSign.tr()),
            );
          }),
    );
  }
}
