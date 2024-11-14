import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerService extends StatelessWidget {
  const ShimmerService(
      {super.key,
      required this.width,
      required this.height,
      required this.shapeBorder,
      this.circular = 25});
  final double width;
  final double height;
  final double circular;
  final ShapeBorder shapeBorder;

  ShimmerService.rectangular(
      {required this.width,
      required this.height,
      super.key,
      this.circular = 15})
      : shapeBorder = RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(circular));

  const ShimmerService.circular(
      {required this.width,
      required this.height,
      super.key,
      this.circular = 25})
      : shapeBorder = const CircleBorder();

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: shapeBorder,
        ),
      ),
    );
  }
}
