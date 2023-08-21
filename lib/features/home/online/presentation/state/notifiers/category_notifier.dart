import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryNotifier extends StateNotifier<List<String>?> {
  CategoryNotifier() : super(null);

  void setCategory(List<String> category) {
    state = category;
  }
}
