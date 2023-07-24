import 'dart:async';
import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:foodito/config/extensions.dart';
import 'package:foodito/config/routes.dart';
import 'package:foodito/config/utils/strings.dart';
import 'package:foodito/config/utils/values.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationCodeView extends StatefulWidget {
  const VerificationCodeView({super.key, required this.email});

  final String email;

  @override
  State<VerificationCodeView> createState() => _VerificationCodeViewState();
}

class _VerificationCodeViewState extends State<VerificationCodeView> {
  late TextEditingController _codeController;
  late StreamController<bool> _validateController;

  @override
  void initState() {
    super.initState();
    _codeController = TextEditingController();
    _validateController = StreamController<bool>.broadcast();

    _codeController.addListener(() {
      _validateController.add(
        _codeController.text.length == 4,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _codeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.transparent,
        title: Text(
          AppStrings.verification.tr(),
          style: const TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.s14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: AppSizes.s20),
              child: RichText(
                text: TextSpan(
                  text: "${AppStrings.sentEmail.tr()} ",
                  style: context.textTheme.bodyMedium,
                  children: [
                    TextSpan(
                      text: widget.email,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            PinCodeTextField(
              controller: _codeController,
              autoDisposeControllers: false,
              appContext: context,
              length: 4,
              pastedTextStyle: TextStyle(
                color: Colors.green.shade600,
                fontWeight: FontWeight.bold,
              ),
              blinkWhenObscuring: true,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: AppSizes.s60,
                fieldWidth: AppSizes.s50,
                activeFillColor: context.colorScheme.primary,
                activeColor: context.colorScheme.primary,
                selectedColor: context.colorScheme.primary,
                selectedFillColor: context.colorScheme.onPrimary,
                inactiveColor: context.colorScheme.outline,
              ),
              keyboardType: TextInputType.number,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: AppSizes.s20),
              child: RichText(
                text: TextSpan(
                  text: "${AppStrings.didntReceiveCode.tr()} ",
                  style: context.textTheme.bodyMedium,
                  children: [
                    TextSpan(
                      text: AppStrings.resendCode.tr(),
                      style: const TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.grey,
                      ),
                      recognizer: TapGestureRecognizer()..onTap = _resend,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppSizes.s14),
              child: StreamBuilder<bool>(
                stream: _validateController.stream,
                builder: (context, snapshot) {
                  return ElevatedButton(
                    onPressed: snapshot.data == true ? _verify : null,
                    child: Text(AppStrings.verify.tr()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _resend() async {
    log("RESEND to ${widget.email}");
  }

  Future<void> _verify() async {
    log(_codeController.text);
    context.navigator.pushNamed(
      Routes.login,
    );
  }
}
