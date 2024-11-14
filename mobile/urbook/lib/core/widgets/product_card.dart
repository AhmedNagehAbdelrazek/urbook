import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:urbook/core/constants/icon_paths.dart';
import 'package:urbook/core/services/shimmer_service.dart';

import '../themes/color_palette.dart';

class ProductCard extends StatelessWidget {
  final bool isLoading;

  const ProductCard({
    super.key,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.w),
        margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.w),
        decoration: BoxDecoration(
          color: LightColorPalette.grey50.withOpacity(0.5),
          borderRadius: BorderRadius.circular(16),
        ),
        child: isLoading ? buildShimmerEffect() : buildProductContent(theme),
      ),
    );
  }

  Widget buildShimmerEffect() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShimmerService.rectangular(
          width: double.infinity,
          height: 100.h,
        ),
        SizedBox(height: 8.h),
        ShimmerService.rectangular(
          width: 100.w,
          height: 15.h,
        ),
        SizedBox(height: 5.h),
        ShimmerService.rectangular(
          width: 50.w,
          height: 15.h,
        ),
        SizedBox(height: 5.h),
        ShimmerService.rectangular(
          width: 30.w,
          height: 15.h,
        ),
      ],
    );
  }

  Widget buildProductContent(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: LightColorPalette.black, width: 0.4),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: CachedNetworkImage(
                  imageUrl:
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSe99Qmooaqix7uhJmJCZ6teDP6NDvT8VwgWQ&s',
                  fit: BoxFit.cover,
                  height: 100.h,
                  width: double.infinity,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
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
          style:
              theme.textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w700),
        ),
        Text(
          "\$345",
          style:
              theme.textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w700),
        ),
        Text(
          "\$456",
          style: theme.textTheme.bodySmall!.copyWith(
              fontWeight: FontWeight.w800,
              decoration: TextDecoration.lineThrough,
              color: BaseColorPalette.red),
        ),
      ],
    );
  }
}
