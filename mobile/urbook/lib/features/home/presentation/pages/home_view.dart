import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:urbook/core/constants/icon_paths.dart';
import 'package:urbook/core/constants/image_paths.dart';
import 'package:urbook/core/themes/color_palette.dart';
import 'package:urbook/features/home/presentation/widgets/categories_options_view.dart';
import '../widgets/exclusive_sales_cards_view.dart';
import '../widgets/latest_products_row.dart';
import '../widgets/latest_products_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            pinned: true,
            title: Image.asset(
              ImagePaths.logo,
              scale: 2,
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const ImageIcon(
                  AssetImage(IconPaths.search),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 10),
                child: CircleAvatar(
                  backgroundImage: AssetImage(ImagePaths.me),
                ),
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              const ExclusiveSalesCardsView(),
              const CategoriesOptionsView(),
              const LatestProductsRow(),
              const LatestProductsView()
            ]),
          ),
        ],
      ),
    );
  }
}
