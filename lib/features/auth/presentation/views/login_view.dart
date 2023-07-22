import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodito/config/extensions.dart';
import 'package:foodito/config/routes.dart';
import 'package:foodito/config/utils/strings.dart';
import 'package:foodito/config/utils/values.dart';
import 'package:foodito/core/widgets/custom_snackbar.dart';
import 'package:foodito/features/auth/presentation/state/providers/auth_provider.dart';
import 'package:foodito/features/auth/presentation/widgets/continue_button.dart';
import 'package:foodito/features/auth/presentation/widgets/custom_circle.dart';
import 'package:foodito/features/auth/presentation/widgets/custom_divider.dart';
import 'package:foodito/features/auth/presentation/widgets/google_button.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final StreamController<bool?> _obscureStreamController;
  late final StreamController<bool?> _activateContinueController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _obscureStreamController = StreamController<bool?>.broadcast();
    _activateContinueController = StreamController<bool?>.broadcast();

    _emailController.addListener(() {
      _activateContinueController.add(_emailController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty);
    });

    _passwordController.addListener(() {
      _activateContinueController.add(_emailController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _obscureStreamController.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          AppStrings.signIn.tr(),
          style: const TextStyle(color: Colors.black),
        ),
        centerTitle: false,
      ),
      body: Stack(
        children: [
          const CustomCircle(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _inputField(_emailController, AppStrings.email.tr()),
                  _passwordField(),
                  _forgetPassword(),
                  const CustomDivider(),
                  const GoogleButton(),
                  InkWell(
                    onTap: () =>
                        context.navigator.pushReplacementNamed(Routes.register),
                    child: Text(
                      AppStrings.noAccount.tr(),
                      style: context.textTheme.bodySmall,
                    ),
                  ),
                ],
              ),
              Container(),
            ],
          ),
          Positioned(
            bottom: AppSizes.s80,
            right: 0,
            child: Consumer(
              builder: (context, ref, child) {
                return ContinueButton(
                  activateContinueController: _activateContinueController,
                  onTap: () => _login(ref),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Padding _forgetPassword() {
    return Padding(
      padding: const EdgeInsets.all(AppSizes.s10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            onTap: () => context.navigator.pushNamed(Routes.resetPassword),
            child: Text(
              AppStrings.forgotPassword.tr(),
              style: context.textTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
  }

  Padding _inputField(TextEditingController controller, String hintText,
      {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.s20, vertical: AppSizes.s10),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: hintText,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  Padding _passwordField() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.s20,
        vertical: AppSizes.s10,
      ),
      child: StreamBuilder<bool?>(
        stream: _obscureStreamController.stream,
        builder: (context, snapshot) {
          final obscure = snapshot.hasData ? snapshot.requireData : false;
          return Stack(
            children: [
              TextFormField(
                controller: _passwordController,
                obscureText: !(obscure ?? false),
                decoration: InputDecoration(
                  labelText: AppStrings.password.tr(),
                  border: const OutlineInputBorder(),
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                bottom: 0,
                child: IconButton(
                  onPressed: () =>
                      _obscureStreamController.add(!(obscure ?? false)),
                  icon: Icon(
                    (obscure ?? false)
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Future<void> _login(WidgetRef ref) async {
    await ref.read(authProvider.notifier).login(
          _emailController.text,
          _passwordController.text,
        );
    final state = ref.watch(authProvider);
    if (state != null) {
      state.fold(
        (failure) => customSnackBar(
          context: context,
          message: failure.message.tr(),
          isError: true,
        ),
        (user) => context.navigator.pushNamedAndRemoveUntil(
          Routes.home,
          (route) => false,
        ),
      );
    } else {
      if (context.mounted) {
        customSnackBar(
          context: context,
          message: AppStrings.unknownError.tr(),
          isError: true,
        );
      }
    }
  }
}
