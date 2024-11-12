import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:urbook/core/constants/icon_paths.dart';
import 'package:urbook/features/categories/data/models/sub_category_model.dart';
import 'package:urbook/features/categories/presentation/widgets/product_listing_grid_view.dart';

import '../widgets/filter_bottom_sheet.dart';

class ProductListingView extends StatefulWidget {
  const ProductListingView({super.key, required this.subCategoryModel});
  final SubCategoryModel subCategoryModel;

  @override
  State<ProductListingView> createState() => _ProductListingViewState();
}

class _ProductListingViewState extends State<ProductListingView> {
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: _isSearching
            ? SizedBox(
                height: 45.h,
                width: double.infinity,
                child: TextField(
                  controller: _searchController,
                  decoration: const InputDecoration(
                    hintText: 'Search...',
                    border: InputBorder.none,
                  ),
                  style: theme.textTheme.bodyLarge,
                  onChanged: (query) {
                    _performSearch(query);
                  },
                ),
              )
            : Text(
                widget.subCategoryModel.subCategoryName,
                style: theme.textTheme.bodyLarge,
              ).tr(),
        actions: [
          IconButton(
            iconSize: 30,
            onPressed: _toggleSearch,
            icon: Icon(_isSearching ? Icons.close : Icons.search),
          ),
          IconButton(
            onPressed: () {
              _showFilterBottomSheet(context);
            },
            icon: const ImageIcon(
              AssetImage(IconPaths.setting),
            ),
          ),
        ],
      ),
      body: const ProductListingGridView(),
    );
  }

  void _toggleSearch() {
    setState(() {
      _isSearching = !_isSearching;
      if (!_isSearching) {
        _searchController.clear();
        _performSearch('');
      }
    });
  }

  void _performSearch(String query) {
    // Implement the actual search logic here, for example, by filtering
    // a list of products in the ProductListingGridView.
    // You may need to pass this query to ProductListingGridView or another function.
  }

  void _showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return const FilterBottomSheet();
      },
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
