import 'package:assignment/common_widgets/helper_widgets.dart';
import 'package:assignment/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../generated/assets.dart';
import 'size_config.dart';

class ProductListView extends StatefulWidget {
  final bool isTrendingView;
  final List<ProductModel> products;

  const ProductListView({super.key, required this.products, this.isTrendingView = false});

  @override
  ProductListViewState createState() => ProductListViewState();
}

class ProductListViewState extends State<ProductListView> {
  late List<ProductModel> products;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    products = widget.products;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280.h,
      child: Stack(
        children: [
          ListView.separated(
            controller: scrollController,
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (context, index) {
              return widget.isTrendingView
                  ? trendingProductCard(context, products[index])
                  : productCard(context, products[index]);
            },
            separatorBuilder: (context, index) {
              return boxW16();
            },
          ),
          Positioned(
            top: 0,
            bottom: 0,
            right: 8,
            child: GestureDetector(
              onTap: () {
                double currentOffset = scrollController.offset;

                setState(() {
                  scrollController.animateTo(
                    currentOffset + 205.w,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                });
              },
              child: vector(Assets.iconsForArrow),
            ),
          ),
        ],
      ),
    );
  }
}
