import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:urbook/core/routes/app_views.dart';
import 'package:urbook/core/themes/color_palette.dart';
import 'package:urbook/features/categories/data/models/category_model.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel categoryModel;

  const CategoryCard({required this.categoryModel, super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, PageRouteName.subCategoriesView,
            arguments: categoryModel);
      },
      child: Card(
        color: LightColorPalette.white,
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                categoryModel.imgPath,
                scale: 0.65,
              ),
              const SizedBox(height: 10),
              Text(categoryModel.categoryName,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodySmall)
                  .tr(),
            ],
          ),
        ),
      ),
    );
  }
}
