import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:urbook/core/constants/icon_paths.dart';
import 'package:urbook/core/constants/image_paths.dart';
import 'package:urbook/core/themes/color_palette.dart';

class MyCartProduct extends StatefulWidget {
  const MyCartProduct({
    super.key,
  });

  @override
  State<MyCartProduct> createState() => _MyCartProductState();
}

class _MyCartProductState extends State<MyCartProduct> {
  bool isChecked = false;

  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 135.h,
            width: 135.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  ImagePaths.testImage,
                ),
              ),
            ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 140.w,
                      child: Text(
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        "Loop Silicone Strong Magnetic Watch ",
                        style: theme.textTheme.bodyLarge,
                      ),
                    ),
                    Transform.scale(
                      scale: 1.3,
                      child: Checkbox(
                        checkColor: LightColorPalette.white,
                        activeColor: LightColorPalette.cyan,
                        value: isChecked,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        onChanged: (value) {
                          setState(() {
                            isChecked = value ?? false;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('\$15.25', style: theme.textTheme.bodyLarge),
                    SizedBox(height: 4.h),
                    Text(
                      '\$20.00',
                      style: theme.textTheme.bodyMedium!.copyWith(
                        decoration: TextDecoration.lineThrough,
                        color: BaseColorPalette.red,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        border: Border.all(color: Colors.black, width: 0.4),
                      ),
                      child: _buildQuantityRow(),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        IconPaths.trash,
                        scale: 9,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row _buildQuantityRow() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: quantity > 1 ? () => setState(() => quantity--) : null,
          icon: const Icon(Icons.remove),
        ),
        Text(quantity.toString()),
        IconButton(
          onPressed: () => setState(() => quantity++),
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}
