import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodito/config/extensions.dart';
import 'package:foodito/config/utils/assets.dart';
import 'package:foodito/config/utils/strings.dart';
import 'package:foodito/config/utils/values.dart';
import 'package:foodito/features/home/offline/domain/entities/order.dart';

typedef OrderCallback = Function(Order order);

class OrderWidget extends StatelessWidget {
  const OrderWidget({
    super.key,
    required this.order,
    required this.onEdit,
    required this.onDelete,
  });

  final Order order;
  final OrderCallback onEdit;
  final OrderCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) => onDelete(order),
      child: Container(
        height: AppSizes.s100,
        margin: const EdgeInsets.symmetric(vertical: AppSizes.s14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppSizes.s10),
          boxShadow: [
            BoxShadow(
              color: context.colorScheme.onPrimary,
              blurRadius: 5,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: InkWell(
          onTap: () => log(order.person),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSizes.s10,
                    ),
                    child: CircleAvatar(
                      radius: AppSizes.s30,
                      backgroundColor: context.colorScheme.onPrimary,
                      child: Image.asset(AppAssets.noImage),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(AppSizes.s14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  order.name.length > 8
                                      ? "${order.name.substring(0, 8)} | "
                                      : "${order.name} | ",
                                  style: context.textTheme.bodyMedium,
                                ),
                                Text(
                                  order.person.length > 8
                                      ? order.person.substring(0, 8)
                                      : order.person,
                                  style: context.textTheme.bodyMedium!.copyWith(
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: AppSizes.s30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildDetails(
                                  context,
                                  AppStrings.price.tr(),
                                  order.price.toString(),
                                ),
                                _buildDetails(
                                  context,
                                  AppStrings.payed.tr(),
                                  order.payed.toString(),
                                ),
                              ],
                            ),
                            _buildDetails(
                              context,
                              AppStrings.remaining.tr(),
                              order.remaining.toString(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: AppSizes.s10,
                    ),
                    child: InkWell(
                      onTap: () => onEdit(order),
                      child: SvgPicture.asset(AppAssets.edit),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSizes.s10,
                    ),
                    child: InkWell(
                      onTap: () => onDelete(order),
                      child: SvgPicture.asset(AppAssets.delete),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  RichText _buildDetails(BuildContext context, String prefix, String data) {
    return RichText(
      text: TextSpan(
        text: "$prefix: ",
        style: context.textTheme.displaySmall,
        children: [
          TextSpan(
            text: "$data ",
            style: context.textTheme.displaySmall!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
