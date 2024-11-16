import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:urbook/core/themes/color_palette.dart';

import '../widgets/my_cart_product.dart';

class MyCartView extends StatefulWidget {
  const MyCartView({super.key});

  @override
  State<MyCartView> createState() => _MyCartViewState();
}

bool isChecked = true;
int quantity = 1;

class _MyCartViewState extends State<MyCartView> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "my_card",
            style: theme.textTheme.bodyLarge,
          ).tr(),
          actions: [
            TextButton(
              onPressed: () {},
              child: Text("voucher_code",
                  style: theme.textTheme.bodyLarge!.copyWith(
                    color: LightColorPalette.cyan,
                  )).tr(),
            )
          ],
        ),
        body: ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, index) {
              return const MyCartProduct();
            }));
  }
}
