import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../widgets/categories_grid_view.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "categories",
            style: theme.textTheme.bodyLarge,
          ).tr(),
        ),
        body: const CategoriesGridView());
  }
}
