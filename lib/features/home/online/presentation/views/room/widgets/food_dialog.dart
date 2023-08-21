import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:foodito/config/extensions.dart';
import 'package:foodito/config/utils/strings.dart';
import 'package:foodito/config/utils/values.dart';
import 'package:foodito/features/home/online/domain/entities/add_food.dart';

typedef OnAddFood = void Function(AddFood food);

class AddFoodDialog extends StatefulWidget {
  const AddFoodDialog({
    super.key,
    required this.userId,
    required this.roomId,
    required this.onAdd,
  });

  final String userId;
  final String roomId;
  final OnAddFood onAdd;

  @override
  State<AddFoodDialog> createState() => _AddFoodDialogState();
}

class _AddFoodDialogState extends State<AddFoodDialog> {
  late final TextEditingController _foodNameController;
  late final TextEditingController _foodPriceController;
  late final TextEditingController _foodRestaurantController;

  @override
  void initState() {
    super.initState();
    _foodNameController = TextEditingController();
    _foodPriceController = TextEditingController();
    _foodRestaurantController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _foodNameController.dispose();
    _foodPriceController.dispose();
    _foodRestaurantController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(AppStrings.addFood.tr()),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _inputField(_foodNameController, AppStrings.addFoodName.tr()),
          _inputField(_foodPriceController, AppStrings.addFoodPrice.tr()),
          _inputField(
              _foodRestaurantController, AppStrings.addFoodRestaurant.tr()),
        ],
      ),
      actions: [
        TextButton(
            onPressed: () {
              if (_foodNameController.text.isNotEmpty &&
                  _foodPriceController.text.isNotEmpty) {
                {
                  widget.onAdd(
                    AddFood(
                      userId: widget.userId,
                      name: _foodNameController.text,
                      price: double.parse(_foodPriceController.text),
                      restaurant: _foodRestaurantController.text,
                      roomId: widget.roomId,
                    ),
                  );
                }
                context.navigator.pop();
              } else {
                context.snackBar(
                  message: AppStrings.unknownError.tr(),
                  isError: true,
                );
              }
            },
            child: Text(AppStrings.add.tr())),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(AppStrings.cancel.tr())),
      ],
    );
  }

  Padding _inputField(TextEditingController controller, String label) =>
      Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSizes.s8),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            labelText: label,
            border: const OutlineInputBorder(),
          ),
        ),
      );
}
