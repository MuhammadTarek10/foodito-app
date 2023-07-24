import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodito/config/extensions.dart';
import 'package:foodito/config/utils/assets.dart';
import 'package:foodito/config/utils/values.dart';
import 'package:foodito/core/widgets/empty_orders.dart';
import 'package:foodito/core/widgets/search_widget.dart';
import 'package:foodito/features/home/offline/domain/entities/order.dart';
import 'package:foodito/features/home/offline/presentation/state/providers/search_provider.dart';
import 'package:foodito/features/home/offline/presentation/widgets/order_widget.dart';

class OrderView extends ConsumerStatefulWidget {
  const OrderView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OrderViewState();
}

class _OrderViewState extends ConsumerState<OrderView> {
  late TextEditingController _searchController;
  List<Order>? filteredOrders;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();

    _searchController.addListener(_search);
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
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
                                      return OrderWidget(order: order);
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
                    child: SvgPicture.asset(AppAssets.addOrder),
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
}
