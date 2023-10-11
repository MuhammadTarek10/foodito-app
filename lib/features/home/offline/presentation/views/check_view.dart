import 'package:flutter/material.dart';
import 'package:foodito/config/utils/values.dart';
import 'package:foodito/features/home/offline/domain/entities/order.dart';
import 'package:foodito/features/home/offline/presentation/widgets/food_builder_widget.dart';
import 'package:foodito/features/home/offline/presentation/widgets/remaining_widget.dart';
import 'package:foodito/features/home/offline/presentation/widgets/total_and_payed_widget.dart';
import 'package:foodito/features/home/offline/presentation/widgets/utils/checker.dart';

class CheckView extends StatefulWidget {
  const CheckView({
    super.key,
    required this.orders,
  });

  final List<Order> orders;

  @override
  State<CheckView> createState() => _CheckViewState();
}

class _CheckViewState extends State<CheckView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final total = widget.orders.map((order) => order.price).reduce(
          (value, element) => value + element,
        );
    final payed = widget.orders.map((order) => order.payed).reduce(
          (value, element) => value + element,
        );
    final remaining = total - payed;
    final map = Checker.check(widget.orders);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Check"),
      ),
      body: Column(
        children: [
          TotalAndPriceWidget(total: total, payed: payed),
          RemainingWidget(remaining: remaining),
          const SizedBox(height: AppSizes.s20),
          FoodBuilderWidget(map: map),
        ],
      ),
    );
  }
}
