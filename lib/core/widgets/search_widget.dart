import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:foodito/config/extensions.dart';
import 'package:foodito/config/utils/strings.dart';
import 'package:foodito/config/utils/values.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
    required TextEditingController searchController,
  }) : _searchController = searchController;

  final TextEditingController _searchController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSizes.s20),
      child: TextField(
        controller: _searchController,
        style: context.textTheme.displaySmall,
        maxLines: 1,
        decoration: InputDecoration(
          hintText: AppStrings.search.tr(),
          hintStyle: context.textTheme.displaySmall,
          prefixIcon: const Icon(Icons.search),
          fillColor: context.colorScheme.secondary.withOpacity(0.12),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              context.width * AppSizes.s003,
            ),
          ),
        ),
      ),
    );
  }
}
