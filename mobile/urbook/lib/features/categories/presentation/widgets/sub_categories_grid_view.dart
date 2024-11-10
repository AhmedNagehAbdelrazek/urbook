import 'package:flutter/material.dart';
import 'package:urbook/core/constants/image_paths.dart';
import '../../data/models/sub_category_model.dart';
import 'sub_category_card.dart';

class SubCategoriesGridView extends StatelessWidget {
  const SubCategoriesGridView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<SubCategoryModel> subCategories = [
      SubCategoryModel(
          imgPath: ImagePaths.electronics, subCategoryName: "electronics"),
      SubCategoryModel(
          imgPath: ImagePaths.constructionRealState,
          subCategoryName: "construction_real_estate"),
      SubCategoryModel(
          imgPath: ImagePaths.fabricationService,
          subCategoryName: "fabrication_service"),
      SubCategoryModel(
          imgPath: ImagePaths.electricalEquipment,
          subCategoryName: "electrical_equipment"),
      SubCategoryModel(imgPath: ImagePaths.fashion, subCategoryName: "fashion"),
      SubCategoryModel(
          imgPath: ImagePaths.furniture, subCategoryName: "furniture"),
      SubCategoryModel(
          imgPath: ImagePaths.industrial, subCategoryName: "industrial"),
      SubCategoryModel(
          imgPath: ImagePaths.homeDecor, subCategoryName: "home_decor"),
      SubCategoryModel(imgPath: ImagePaths.health, subCategoryName: "health"),
      SubCategoryModel(
          imgPath: ImagePaths.electronics2, subCategoryName: "electronics"),
    ];

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: subCategories.length,
        itemBuilder: (context, index) {
          final category = subCategories[index];
          return SubCategoryCard(
            subCategoryModel: category,
          );
        },
      ),
    );
  }
}
