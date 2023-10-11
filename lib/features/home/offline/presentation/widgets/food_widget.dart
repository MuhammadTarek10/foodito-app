import 'package:flutter/material.dart';
import 'package:foodito/config/utils/values.dart';
import 'package:foodito/features/home/offline/presentation/widgets/utils/checker.dart';

class FoodWidget extends StatelessWidget {
  const FoodWidget({
    super.key,
    required this.item,
  });

  final MapEntry<String, Map<int, List<UserMap>>> item;

  @override
  Widget build(BuildContext context) {
    final food = item.key;
    final count = item.value.keys.first;
    return InkWell(
      onTap: () => showDetails(context, item.value[count]!),
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(AppSizes.s10),
          decoration: BoxDecoration(
            color: Colors.orange.shade400,
            borderRadius: BorderRadius.circular(AppSizes.s25),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(food),
              Text(count.toString()),
            ],
          ),
        ),
      ),
    );
  }

  void showDetails(
    BuildContext context,
    List<UserMap> map,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.orange.shade100,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Name"),
            Text("Payed"),
            Text("Remaining"),
          ],
        ),
        content: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSizes.s25),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: AppSizes.s10),
              ...map.map((e) => ListTile(
                    leading: Text(e.user),
                    title: Text(e.payed.toString()),
                    trailing: Text(
                      e.remaining.toString(),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
