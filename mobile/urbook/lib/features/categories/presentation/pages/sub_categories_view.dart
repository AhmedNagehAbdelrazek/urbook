import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../data/models/category_model.dart';
import '../widgets/sub_categories_grid_view.dart';

class SubCategoriesView extends StatelessWidget {
  const SubCategoriesView({
    super.key,
    required this.categoryModel,
  });
  final CategoryModel categoryModel;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryModel.categoryName,
          style: theme.textTheme.bodyLarge,
        ).tr(),
      ),
      body: const SubCategoriesGridView(),
    );
  }
}
