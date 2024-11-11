import 'package:flutter/material.dart';
import 'package:urbook/core/widgets/product_card.dart';

class ProductListingGridView extends StatelessWidget {
  const ProductListingGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.9,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: 23,
        itemBuilder: (context, index) {
          return const ProductCard();
        },
      ),
    );
  }
}
