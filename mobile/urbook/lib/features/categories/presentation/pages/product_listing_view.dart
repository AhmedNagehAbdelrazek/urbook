import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:urbook/core/constants/icon_paths.dart';
import 'package:urbook/features/categories/data/models/sub_category_model.dart';

import '../widgets/filter_bottom_sheet.dart';

class ProductListingView extends StatelessWidget {
  const ProductListingView({super.key, required this.subCategoryModel});
  final SubCategoryModel subCategoryModel;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          subCategoryModel.subCategoryName,
          style: theme.textTheme.bodyLarge,
        ).tr(),
        actions: [
          IconButton(
            onPressed: () {
              _showFilterBottomSheet(context);
            },
            icon: const ImageIcon(
              AssetImage(IconPaths.setting),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const ImageIcon(
              AssetImage(IconPaths.search),
            ),
          ),
        ],
      ),
    );
  }

  void _showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return const FilterBottomSheet();
      },
    );
  }
}
