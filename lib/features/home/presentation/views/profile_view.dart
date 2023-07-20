import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:foodito/config/utils/strings.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(AppStrings.profile.tr()),
    );
  }
}
