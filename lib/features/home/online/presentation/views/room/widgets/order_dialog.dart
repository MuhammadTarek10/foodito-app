import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:foodito/config/extensions.dart';
import 'package:foodito/config/utils/strings.dart';
import 'package:foodito/config/utils/values.dart';

typedef OnAddFood = void Function(int quantity);

class AddOrderDialog extends StatefulWidget {
  const AddOrderDialog({
    super.key,
    required this.onAdd,
  });

  final OnAddFood onAdd;

  @override
  State<AddOrderDialog> createState() => _AddOrderDialogState();
}

class _AddOrderDialogState extends State<AddOrderDialog> {
  late final TextEditingController _quantityController;

  @override
  void initState() {
    super.initState();
    _quantityController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _quantityController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(AppStrings.howManyOrders.tr()),
      content: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSizes.s8),
          color: context.colorScheme.background,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _quantityController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: AppStrings.quantity.tr(),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            widget.onAdd(_quantityController.text.isNotEmpty
                ? int.parse(_quantityController.text)
                : 1);
            context.navigator.pop();
          },
          child: Text(AppStrings.add.tr()),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(AppStrings.cancel.tr()),
        ),
      ],
    );
  }
}
