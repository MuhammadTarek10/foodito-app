import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodito/config/extensions.dart';
import 'package:foodito/config/routes.dart';
import 'package:foodito/config/utils/assets.dart';
import 'package:foodito/config/utils/strings.dart';
import 'package:foodito/config/utils/values.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  late TextEditingController _emailController;
  late StreamController<bool> _validEmailController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _validEmailController = StreamController<bool>.broadcast();
    _emailController.addListener(() {
      _validEmailController.add(_emailController.text.isNotEmpty);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _validEmailController.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.transparent,
        title: Text(
          AppStrings.resetPassword.tr(),
          style: const TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          SvgPicture.asset(AppAssets.resetPassword),
          Padding(
            padding: const EdgeInsets.all(AppSizes.s14),
            child: TextField(
              controller: _emailController,
              decoration: InputDecoration(
                label: Text(AppStrings.email.tr()),
                labelStyle: const TextStyle(color: Colors.grey),
                border: const OutlineInputBorder(),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(AppSizes.s14),
            child: StreamBuilder<bool>(
              stream: _validEmailController.stream,
              builder: (context, snapshot) {
                return ElevatedButton(
                  onPressed: snapshot.data == true ? _reset : null,
                  child: Text(AppStrings.verificationCode.tr()),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Future<void> _reset() async {
    // Check backend
    context.navigator
        .pushNamed(Routes.verificationCode, arguments: _emailController.text);
  }
}
