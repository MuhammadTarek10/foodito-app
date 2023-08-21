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
  late TextEditingController _quantityController;
  late OrderController _orderControllerProvider;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _searchController.addListener(_search);
    _orderController = TextEditingController();
    _nameController = TextEditingController();
    _priceController = TextEditingController();
    _payedController = TextEditingController();
    _quantityController = TextEditingController();
    _quantityController.text = "1";
    _orderControllerProvider = OrderController();
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
    _orderController.dispose();
    _nameController.dispose();
    _priceController.dispose();
    _payedController.dispose();
    _quantityController.dispose();
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
                      onTap: () => _addOrder(null),
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

  Future<void> _addOrder(Order? order) async {
    String id = const Uuid().v4();
    if (order != null) {
      id = order.id;
      _orderController.text = order.name;
      _nameController.text = order.person;
      _priceController.text = order.price.toString();
      _payedController.text = order.payed.toString();
    }
    await _orderControllerProvider.takeInputs(
      context: context,
      ref: ref,
      id: id,
      order: order,
      orderController: _orderController,
      nameController: _nameController,
      priceController: _priceController,
      payedController: _payedController,
      quantityController: _quantityController,
      addOne: () => setState(() {
        _quantityController.text =
            (int.parse(_quantityController.text) + 1).toString();
      }),
      minusOne: () => setState(() {
        if (int.parse(_quantityController.text) > 1) {
          _quantityController.text =
              (int.parse(_quantityController.text) - 1).toString();
        }
      }),
      clear: () => _clear(),
    );
    _clear();
  }

  Future<void> _edit(Order order) async {
    await _addOrder(order);
  }

  Future<void> _delete(Order order) async {
    await ref.read(orderProvider.notifier).deleteOrder(order);
  }

  void _clear() {
    _orderController.clear();
    _nameController.clear();
    _priceController.clear();
    _payedController.clear();
    _quantityController.text = "1";
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

class OrderController {
  Future<dynamic> takeInputs({
    required BuildContext context,
    required WidgetRef ref,
    required String id,
    required Order? order,
    required TextEditingController orderController,
    required TextEditingController nameController,
    required TextEditingController priceController,
    required TextEditingController payedController,
    required TextEditingController quantityController,
    required VoidCallback addOne,
    required VoidCallback minusOne,
    required VoidCallback clear,
  }) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(AppSizes.s14),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InputField(
                label: AppStrings.order.tr(),
                controller: orderController,
              ),
              InputField(
                label: AppStrings.name.tr(),
                controller: nameController,
              ),
              InputField(
                label: AppStrings.price.tr(),
                controller: priceController,
              ),
              InputField(
                label: AppStrings.payed.tr(),
                controller: payedController,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: context.colorScheme.primary,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: addOne,
                      icon: const Icon(Icons.add),
                    ),
                  ),
                  Container(
                    width: AppSizes.s50,
                    height: AppSizes.s50,
                    margin: const EdgeInsets.symmetric(
                      horizontal: AppSizes.s10,
                    ),
                    decoration: BoxDecoration(
                      color: context.colorScheme.background,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: TextField(
                        controller: quantityController,
                        textAlign: TextAlign.center,
                        readOnly: true,
                        style: context.textTheme.displaySmall,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: context.colorScheme.primary,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: IconButton(
                        onPressed: minusOne,
                        icon: const Icon(Icons.remove),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    if (nameController.text.isEmpty ||
                        orderController.text.isEmpty ||
                        priceController.text.isEmpty ||
                        payedController.text.isEmpty ||
                        priceController.text.runes
                            .any((element) => element < 48 || element > 57) ||
                        payedController.text.runes
                            .any((element) => element < 48 || element > 57)) {
                      context.navigator.pop();
                      return context.snackBar(
                        message: AppStrings.invalidInputs.tr(),
                        isError: true,
                      );
                    }

                    final quantity = int.parse(quantityController.text);
                    for (int i = 0; i < quantity; i++) {
                      final toAdd = Order(
                        id: id,
                        person: nameController.text,
                        name: orderController.text,
                        price: double.parse(priceController.text),
                        payed: i > 0 ? 0 : double.parse(payedController.text),
                        remaining: i > 0
                            ? double.parse(priceController.text)
                            : double.parse(priceController.text) -
                                double.parse(payedController.text),
                      );
                      order == null
                          ? await ref
                              .read(orderProvider.notifier)
                              .addOrder(toAdd)
                          : i > 0
                              ? ref.read(orderProvider.notifier).addOrder(toAdd)
                              : ref
                                  .read(orderProvider.notifier)
                                  .editOrder(toAdd);
                    }
                    if (context.mounted) context.navigator.pop();
                    clear();
                  },
                  child: Text(AppStrings.add.tr()),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
