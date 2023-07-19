import 'package:flutter/material.dart';
import 'package:foodito/config/extensions.dart';
import 'package:foodito/config/utils/colors.dart';

class CustomCircle extends StatelessWidget {
  const CustomCircle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: -context.width * 0.65,
      left: -context.width * 0.5,
      child: Container(
        width: context.width,
        height: context.width,
        decoration: BoxDecoration(
          color: AppColors.shadeColor,
          borderRadius: BorderRadius.circular(context.width * 0.5),
        ),
      ),
    );
  }
}
