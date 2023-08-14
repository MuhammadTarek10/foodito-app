import 'package:flutter/material.dart';
import 'package:foodito/config/extensions.dart';
import 'package:foodito/config/utils/values.dart';
import 'package:foodito/features/home/online/domain/entities/food.dart';

class FoodWidget extends StatelessWidget {
  const FoodWidget({
    super.key,
    required this.food,
  });

  final Food food;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(AppSizes.s8),
      padding: const EdgeInsets.all(AppSizes.s8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSizes.s8),
          color: context.colorScheme.background,
          boxShadow: [
            BoxShadow(
              color: context.colorScheme.onSurface.withOpacity(0.1),
              blurRadius: AppSizes.s8,
              offset: const Offset(0, AppSizes.s4),
            ),
          ]),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(AppSizes.s8),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "${food.name.split(' ')[0]}: ",
                    style: context.textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: food.username.split(' ')[0],
                    style: context.textTheme.titleLarge,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppSizes.s8),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: food.price.toString(),
                    style: context.textTheme.titleLarge,
                  ),
                  TextSpan(
                    text: " EGP",
                    style: context.textTheme.titleLarge,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
