import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:urbook/core/themes/color_palette.dart';

class ExclusiveSalesCard extends StatelessWidget {
  const ExclusiveSalesCard({
    super.key,
    required this.imagePath,
    required this.voidCallback,
  });
  final String imagePath;
  final VoidCallback voidCallback;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: voidCallback,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: LightColorPalette.black, width: 0.1.w),
          image:
              DecorationImage(image: AssetImage(imagePath), fit: BoxFit.fill),
          borderRadius: BorderRadius.circular(24),
        ),
      ),
    );
  }
}
