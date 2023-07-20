import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:foodito/config/utils/strings.dart';

class InboxView extends StatelessWidget {
  const InboxView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(AppStrings.inbox.tr()),
    );
  }
}
