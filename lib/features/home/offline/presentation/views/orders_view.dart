import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodito/config/extensions.dart';
import 'package:foodito/config/utils/assets.dart';
import 'package:foodito/config/utils/strings.dart';
import 'package:foodito/config/utils/values.dart';
import 'package:foodito/core/widgets/custom_snackbar.dart';
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
  late TextEditingController _personController;
  late TextEditingController _priceController;
  late TextEditingController _payedController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _searchController.addListener(_search);
    _orderController = TextEditingController();
    _personController = TextEditingController();
    _priceController = TextEditingController();
    _payedController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
    _orderController.dispose();
    _personController.dispose();
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
                  left: 0,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: context.colorScheme.onPrimary,
                          blurRadius: 5,
                          offset: const Offset(0, 0),
                        ),
                      ],
                    ),
                    child: GestureDetector(
                      onTap: () => _showDialog(null),
                      child: SvgPicture.asset(AppAssets.addOrder),
                    ),
                  ),
                )
              ],
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

  Future<void> _addOrder(String? id) async {
    if (context.mounted) {
      if (_orderController.text.trim().isEmpty ||
          _personController.text.trim().isEmpty ||
          _priceController.text.trim().isEmpty ||
          _payedController.text.trim().isEmpty) {
        customSnackBar(
          context: context,
          message: AppStrings.unknownError.tr(),
          isError: true,
        );
        return;
      }
    }

    try {
      final person = _personController.text.trim();
      final order = _orderController.text.trim();
      final price = double.parse(_priceController.text.trim());
      final payed = double.parse(_payedController.text.trim());
      final remaining = payed - price;

      if (id == null) {
        await ref.read(orderProvider.notifier).addOrder(
              Order(
                id: const Uuid().v4(),
                person: person,
                name: order,
                price: price,
                payed: payed,
                remaining: remaining,
              ),
            );
      } else {
        await ref.read(orderProvider.notifier).editOrder(
              Order(
                id: id,
                person: person,
                name: order,
                price: price,
                payed: payed,
                remaining: remaining,
              ),
            );
      }
    } catch (e) {
      customSnackBar(
        context: context,
        message: AppStrings.unknownError.tr(),
        isError: true,
      );
      return;
    }
    _clear();
  }

  Future<void> _edit(Order order) async {
    _personController.text = order.person;
    _orderController.text = order.name;
    _priceController.text = order.price.toString();
    _payedController.text = order.payed.toString();
    await _showDialog(order.id);
  }

  Future<void> _delete(Order order) async {
    await ref.read(orderProvider.notifier).deleteOrder(order);
  }

  Future<dynamic> _showDialog(String? id) async {
    return await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text(AppStrings.order.tr()),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InputField(
              label: AppStrings.order.tr(),
              controller: _orderController,
            ),
            InputField(
              label: AppStrings.person.tr(),
              controller: _personController,
            ),
            InputField(
              label: AppStrings.price.tr(),
              controller: _priceController,
            ),
            InputField(
              label: AppStrings.payed.tr(),
              controller: _payedController,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: _clear,
            child: Text(AppStrings.cancel.tr()),
          ),
          TextButton(
            onPressed: () => _addOrder(id),
            child:
                Text(id == null ? AppStrings.add.tr() : AppStrings.save.tr()),
          ),
        ],
      ),
    );
  }

  void _clear() {
    _orderController.clear();
    _personController.clear();
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
