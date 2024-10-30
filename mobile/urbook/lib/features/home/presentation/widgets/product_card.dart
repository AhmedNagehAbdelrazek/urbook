import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:urbook/core/constants/icon_paths.dart';
import 'package:urbook/core/themes/color_palette.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                          color: LightColorPalette.cyan, width: 0.4)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSe99Qmooaqix7uhJmJCZ6teDP6NDvT8VwgWQ&s',
                      fit: BoxFit.cover,
                      height: 100.h,
                      width: double.infinity,
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: IconButton(
                    onPressed: () {},
                    icon: const ImageIcon(
                      AssetImage(IconPaths.heart),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Text(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                "phone 34rtrttdtytyufdftdfghghghghh",
                style: theme.textTheme.bodyMedium!
                    .copyWith(fontWeight: FontWeight.w700)),
            Text(
              "\$345",
              style: theme.textTheme.bodySmall!
                  .copyWith(fontWeight: FontWeight.w700),
            ),
            Text(
              "\$456",
              style: theme.textTheme.bodySmall!.copyWith(
                  fontWeight: FontWeight.w700,
                  decoration: TextDecoration.lineThrough),
            ),
          ],
        ),
      ),
    );
  }
}
