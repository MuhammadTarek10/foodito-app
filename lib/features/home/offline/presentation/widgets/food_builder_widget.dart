import 'package:flutter/material.dart';
import 'package:foodito/features/home/offline/presentation/widgets/food_widget.dart';
import 'package:foodito/features/home/offline/presentation/widgets/utils/checker.dart';

class FoodBuilderWidget extends StatelessWidget {
  const FoodBuilderWidget({
    super.key,
    required this.map,
  });

  final Map<String, Map<int, List<UserMap>>> map;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 1.5,
      ),
      shrinkWrap: true,
      itemCount: map.length,
      itemBuilder: (context, index) {
        final item = map.entries.elementAt(index);
        return FoodWidget(item: item);
      },
    );
  }
}
