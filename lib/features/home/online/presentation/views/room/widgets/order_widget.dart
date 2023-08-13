import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodito/config/extensions.dart';
import 'package:foodito/config/utils/assets.dart';
import 'package:foodito/config/utils/strings.dart';
import 'package:foodito/config/utils/values.dart';
import 'package:foodito/features/home/online/domain/entities/order.dart';

typedef OrderCallback = void Function(Order order);

class OrderWidget extends StatelessWidget {
  const OrderWidget({
    super.key,
    required this.index,
    required this.order,
    this.isAdmin = false,
    required this.onEdit,
    required this.onDelete,
  });

  final int index;
  final Order order;
  final bool isAdmin;
  final OrderCallback onEdit;
  final OrderCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * AppSizes.s01,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.s10,
        vertical: AppSizes.s14,
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: AppSizes.s10,
        vertical: AppSizes.s14,
      ),
      decoration: BoxDecoration(
        color: context.colorScheme.background,
        borderRadius: BorderRadius.circular(AppSizes.s10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: AppSizes.s01,
            blurRadius: AppSizes.s10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: AppSizes.s30,
                backgroundColor: context.colorScheme.onPrimary,
                child: Text(
                  order.username.toString().substring(0, 1),
                  style: context.textTheme.titleMedium,
                ),
              ),
              const SizedBox(width: AppSizes.s10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    order.food.toString(),
                    style: context.textTheme.titleLarge,
                  ),
                  Text(
                    order.restaurant.toString(),
                    style: context.textTheme.displaySmall,
                  ),
                  RichText(
                    text: TextSpan(
                      text: "${AppStrings.price.tr()}: ",
                      style: context.textTheme.displaySmall,
                      children: [
                        TextSpan(
                          text: order.price.toString(),
                          style: context.textTheme.displaySmall!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          isAdmin
              ? Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: AppSizes.s10,
                      ),
                      child: InkWell(
                        onTap: () {},
                        child: SvgPicture.asset(AppAssets.edit),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSizes.s10,
                      ),
                      child: InkWell(
                        onTap: () {},
                        child: SvgPicture.asset(AppAssets.delete),
                      ),
                    ),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }
}
