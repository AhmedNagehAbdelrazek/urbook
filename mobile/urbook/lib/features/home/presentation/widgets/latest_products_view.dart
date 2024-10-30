import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'product_card.dart';

class LatestProductsView extends StatelessWidget {
  const LatestProductsView({super.key});

  final SliverGridDelegate gridDelegate =
      const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    mainAxisSpacing: 0,
    crossAxisSpacing: 0,
    childAspectRatio: 0.9,
  );

  Widget itemBuilder(BuildContext context, int index) {
    return const ProductCard();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: GridView.builder(
        gridDelegate: gridDelegate,
        itemBuilder: itemBuilder,
        itemCount: 19,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
      ),
    );
  }
}
