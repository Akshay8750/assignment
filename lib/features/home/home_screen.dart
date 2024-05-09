import 'package:assignment/common_widgets/banner_carousel.dart';
import 'package:assignment/common_widgets/deal_of_the_card.dart';
import 'package:assignment/common_widgets/helper_widgets.dart';
import 'package:assignment/common_widgets/padding_helper.dart';
import 'package:assignment/common_widgets/product_list_view.dart';
import 'package:assignment/common_widgets/size_config.dart';
import 'package:assignment/data/models/user_model.dart';
import 'package:assignment/features/home/home_controller.dart';
import 'package:assignment/generated/assets.dart';
import 'package:assignment/generated/l10n.dart';
import 'package:assignment/theme/text_style.dart';
import 'package:assignment/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  final HomeController controller;

  const HomeScreen({super.key, required this.controller});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController dealScrollController = ScrollController();
  ScrollController trendingScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homePageAppBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: padAll(),
          child: Column(
            children: [
              searchBar(context, onChange: (p0) => null),
              Row(
                children: [
                  Text(S.of(context).allFeatured, style: AppTextTheme.titleW600Style),
                  const Spacer(),
                  squareButton(context, title: S.of(context).sort, icon: Icons.swap_vert_rounded),
                  boxW8(),
                  squareButton(context,
                      title: S.of(context).filter, icon: Icons.filter_alt_outlined),
                ],
              ),
              Container(
                  padding: padOnly(top: 10.h, right: 8.h, left: 8.h),
                  height: 102.h,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(ScreenUtil().radius(10))),
                  child: Obx(() => widget.controller.categories.isNotEmpty
                      ? ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: widget.controller.categories.length,
                          itemBuilder: (context, index) {
                            return categoryCard(
                                image: widget.controller.categories[index].image,
                                categoryName: widget.controller.categories[index].name);
                          },
                          separatorBuilder: (context, index) {
                            return boxW16();
                          },
                        )
                      : const SizedBox())),
              Obx(() => widget.controller.carouselData.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : BannerCarousel(
                      widget.controller.carouselData.map((element) => element.image).toList())),
              const DealOfTheCard(),
              Obx(() => widget.controller.dealOfTheDayProducts.isNotEmpty
                  ? ProductListView(products: widget.controller.dealOfTheDayProducts)
                  : const SizedBox()),
              Container(
                padding: padAll(),
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(ScreenUtil().radius(6))),
                child: Row(
                  children: [
                    Image.asset(Assets.imagesSpecialOffer,
                        width: 75.w, height: 60.h, fit: BoxFit.cover),
                    boxW16(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(S.of(context).specialOffers,
                                style: AppTextTheme.subtitleMediumStyle),
                            boxW8(),
                            vector(Assets.iconsShockIcon)
                          ],
                        ),
                        SizedBox(
                          width: screenWidth(percentage: 55),
                          child: Text(S.of(context).weMakeSureYouGetTheOfferYouNeedAt,
                              style: AppTextTheme.labelStyle),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Obx(() => widget.controller.midBanner.value != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(ScreenUtil().radius(12)),
                      child: loadImage(widget.controller.midBanner.value!.image,
                          fit: BoxFit.fitWidth, width: screenWidth()))
                  : const SizedBox()),
              moreProductCard(context, S.of(context).trendingProducts, 'Last Date 29/05/24',
                  Theme.of(context).colorScheme.primaryContainer, Icons.calendar_today_outlined),
              Obx(() => widget.controller.trendingProducts.isNotEmpty
                  ? ProductListView(
                      products: widget.controller.trendingProducts, isTrendingView: true)
                  : const SizedBox()),
              Obx(() => widget.controller.bottomBanner.value != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(ScreenUtil().radius(12)),
                      child: bannerCard(context, widget.controller.bottomBanner.value!))
                  : const SizedBox()),
              Obx(() => widget.controller.sponsorData.value == null
                  ? const Center(child: CircularProgressIndicator())
                  : sponsoredCard(context, widget.controller.sponsorData.value!)),
            ].separateVertically(16),
          ),
        ),
      ),
    );
  }

  AppBar homePageAppBar(BuildContext context) {
    return AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            vector(Assets.iconsHamburger),
            vector(Assets.iconsAppLogo),
            CircleAvatar(radius: 20.r, child: loadImage(UserModel().getProfileUrl()))
          ],
        ));
  }
}
