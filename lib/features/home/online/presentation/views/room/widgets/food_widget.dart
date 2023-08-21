import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:foodito/config/extensions.dart';
import 'package:foodito/config/utils/values.dart';
import 'package:foodito/features/home/online/domain/entities/add_order.dart';
import 'package:foodito/features/home/online/domain/entities/food.dart';
import 'package:foodito/features/home/online/presentation/state/providers/order_provider.dart';
import 'package:foodito/features/home/online/presentation/views/room/widgets/order_dialog.dart';

class FoodWidget extends StatelessWidget {
  const FoodWidget({
    super.key,
    required this.food,
    required this.roomId,
    required this.userId,
  });

  final Food food;
  final String roomId;
  final String userId;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showDialog(
        context: context,
        builder: (context) => AddOrderDialog(
          onAdd: (quantity) => addOrderProvider(
            AddOrder(
              userId: userId,
              foodId: food.id.toString(),
              roomId: roomId,
            ),
            quantity,
          ),
        ),
      ),
      onLongPress: () => log("Delete"),
      child: Container(
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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
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
              padding: const EdgeInsets.all(AppSizes.s4),
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
      ),
    );
  }
}
