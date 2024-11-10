import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:urbook/core/routes/app_views.dart';
import '../../data/models/sub_category_model.dart';

class SubCategoryCard extends StatelessWidget {
  final SubCategoryModel subCategoryModel;

  const SubCategoryCard({required this.subCategoryModel, super.key});

  @override
  Widget build(BuildContext context) {
    Color randomColor = _generateRandomColor();
    var theme = Theme.of(context);
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, PageRouteName.productListingView,
            arguments: subCategoryModel);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 110.h,
            decoration: BoxDecoration(
                color: randomColor, borderRadius: BorderRadius.circular(20)),
            child: Center(
              child: Image.asset(
                subCategoryModel.imgPath,
                scale: 0.65,
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Text(subCategoryModel.subCategoryName,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium)
              .tr(),
        ],
      ),
    );
  }

  Color _generateRandomColor() {
    final random = Random();
    return Color.fromARGB(
      50,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }
}
