import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodito/config/extensions.dart';
import 'package:foodito/config/utils/assets.dart';
import 'package:foodito/config/utils/strings.dart';
import 'package:foodito/config/utils/values.dart';
import 'package:foodito/core/widgets/empty_orders.dart';
import 'package:foodito/core/widgets/search_widget.dart';
import 'package:foodito/features/home/offline/domain/entities/order.dart';
import 'package:foodito/features/home/offline/presentation/state/providers/order_provider.dart';
import 'package:foodito/features/home/offline/presentation/state/providers/search_provider.dart';
import 'package:foodito/features/home/offline/presentation/widgets/order_widget.dart';
import 'package:uuid/uuid.dart';

class OrderView extends ConsumerStatefulWidget {
  const OrderView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OrderViewState();
}

class _OrderViewState extends ConsumerState<OrderView> {
  late TextEditingController _searchController;
  List<Order>? filteredOrders;
  late TextEditingController _orderController;
  late TextEditingController _nameController;
  late TextEditingController _priceController;
  late TextEditingController _payedController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _searchController.addListener(_search);
    _orderController = TextEditingController();
    _nameController = TextEditingController();
    _priceController = TextEditingController();
    _payedController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
    _orderController.dispose();
    _nameController.dispose();
    _priceController.dispose();
    _payedController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final orders = ref.watch(searchProvider(_searchController.text));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.colorScheme.onPrimary,
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(AppSizes.s14),
                  child: Column(
                    children: [
                      SearchWidget(searchController: _searchController),
                      orders == null
                          ? const Expanded(
                              child: Center(child: CircularProgressIndicator()))
                          : orders.isEmpty
                              ? const EmptyOrders()
                              : Expanded(
                                  child: ListView.builder(
                                    itemCount: orders.length,
                                    itemBuilder: (context, index) {
                                      final order = orders[index];
                                      return OrderWidget(
                                        order: order,
                                        onEdit: (order) => _edit(order),
                                        onDelete: (order) => _delete(order),
                                      );
                                    },
                                  ),
                                ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: context.height * AppSizes.s01,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: context.colorScheme.onPrimary,
                          blurRadius: 10,
                          offset: const Offset(0, 0),
                        ),
                      ],
                    ),
                    child: GestureDetector(
                      onTap: _addOrder,
                      child: SvgPicture.asset(AppAssets.addOrder),
                    ),
                  ),
                )
              ],
            ),
          ),
          SafeArea(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.only(
                right: AppSizes.s20,
                left: AppSizes.s20,
              ),
              child: ElevatedButton(
                onPressed: () => _check(orders),
                child: Text(AppStrings.check.tr()),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _search() {
    setState(() {
      filteredOrders = ref.read(searchProvider(_searchController.text));
    });
  }

  void _check(List<Order>? orders) {
    if (orders != null) log(orders.map((e) => e.toJson()).toString());
  }

  Future<void> _addOrder() async {
    await ref.read(orderProvider.notifier).addOrder(
          Order(
            id: const Uuid().v4(),
            person: "LOL",
            name: "Shrimp",
            price: 200,
            payed: 150,
            remaining: 50,
          ),
        );
  }

  Future<void> _edit(Order order) async {
    await ref.read(orderProvider.notifier).editOrder(
          Order(
            id: order.id,
            person: order.person,
            name: "Edited",
            price: order.price - 10,
            payed: order.payed - 10,
            remaining: order.remaining,
          ),
        );
  }

  Future<void> _delete(Order order) async {
    await ref.read(orderProvider.notifier).deleteOrder(order);
  }

  void _clear() {
    _orderController.clear();
    _nameController.clear();
    _priceController.clear();
    _payedController.clear();
    context.navigator.pop();
  }
}

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    required this.label,
    required this.controller,
  });

  final String label;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSizes.s14),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          label: Text(label),
          labelStyle: context.textTheme.displaySmall,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
