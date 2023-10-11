import 'package:flutter/material.dart';
import 'package:foodito/config/extensions.dart';
import 'package:foodito/config/utils/values.dart';

class ValueContainer extends StatelessWidget {
  const ValueContainer({
    super.key,
    required this.text,
    required this.total,
  });

  final String text;
  final double total;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(AppSizes.s14),
        padding: const EdgeInsets.all(AppSizes.s10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSizes.s20),
          border: Border.all(
            color: Colors.black,
          ),
        ),
        child: Column(
          children: [
            Text(
              text,
              style: context.textTheme.bodyLarge,
            ),
            Text(
              total.toString(),
              style: context.textTheme.headlineSmall,
            ),
          ],
        ),
      ),
    );
  }
}
