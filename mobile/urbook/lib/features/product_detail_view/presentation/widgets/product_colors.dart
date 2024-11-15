import 'package:flutter/material.dart';
import 'package:urbook/core/widgets/build_color_option.dart';

class ProductColors extends StatelessWidget {
  const ProductColors({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildColorOption(Colors.black),
        buildColorOption(Colors.blue),
        buildColorOption(Colors.purple),
        buildColorOption(Colors.grey),
      ],
    );
  }
}