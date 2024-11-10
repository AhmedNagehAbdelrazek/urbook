import 'package:flutter/material.dart';
import 'package:urbook/core/routes/app_views.dart';

import '../../data/models/category_model.dart';
import '../../data/models/sub_category_model.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (settings) {
        Widget page;
        switch (settings.name) {
          case PageRouteName.categoriesView:
            page = const CategoriesView();
            break;
          case PageRouteName.subCategoriesView:
            final CategoryModel categoryModel =
                settings.arguments as CategoryModel;
            page = SubCategoriesView(
              categoryModel: categoryModel,
            );
            break;
          case PageRouteName.productListingView:
            final SubCategoryModel subCategoryModel =
                settings.arguments as SubCategoryModel;
            page = ProductListingView(subCategoryModel: subCategoryModel);
            break;
          default:
            page = const CategoriesView();
        }
        return MaterialPageRoute(builder: (_) => page);
      },
    );
  }
}
