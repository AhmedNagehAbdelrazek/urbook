import 'package:flutter/material.dart';
import 'package:urbook/core/constants/image_paths.dart';
import 'package:urbook/features/categories/data/models/category_model.dart';

import 'category_card.dart';

class CategoriesGridView extends StatelessWidget {
  const CategoriesGridView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<CategoryModel> categories = [
      CategoryModel(
          imgPath: ImagePaths.electronics, categoryName: "electronics"),
      CategoryModel(
          imgPath: ImagePaths.constructionRealState,
          categoryName: "construction_real_estate"),
      CategoryModel(
          imgPath: ImagePaths.fabricationService,
          categoryName: "fabrication_service"),
      CategoryModel(
          imgPath: ImagePaths.electricalEquipment,
          categoryName: "electrical_equipment"),
      CategoryModel(imgPath: ImagePaths.fashion, categoryName: "fashion"),
      CategoryModel(imgPath: ImagePaths.furniture, categoryName: "furniture"),
      CategoryModel(imgPath: ImagePaths.industrial, categoryName: "industrial"),
      CategoryModel(imgPath: ImagePaths.homeDecor, categoryName: "home_decor"),
      CategoryModel(imgPath: ImagePaths.health, categoryName: "health"),
      CategoryModel(
          imgPath: ImagePaths.electronics2, categoryName: "electronics"),
    ];

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return CategoryCard(
            categoryModel: category,
          );
        },
      ),
    );
  }
}
