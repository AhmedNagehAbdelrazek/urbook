import 'package:flutter/material.dart';
import 'package:urbook/core/widgets/build_tag.dart';

class ProductRates extends StatelessWidget {
  const ProductRates({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildTag(context, text: "Top Rated", color: Colors.blue),
        const SizedBox(width: 8),
        buildTag(context,
            text: "Free Shipping", color: Colors.green),
      ],
    );
  }
}