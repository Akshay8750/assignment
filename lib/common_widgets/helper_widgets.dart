import 'package:assignment/common_widgets/padding_helper.dart';
import 'package:assignment/common_widgets/size_config.dart';
import 'package:assignment/data/models/home_banner_model.dart';
import 'package:assignment/data/models/product_model.dart';
import 'package:assignment/data/models/sponsor_model.dart';
import 'package:assignment/generated/assets.dart';
import 'package:assignment/generated/l10n.dart';
import 'package:assignment/theme/text_style.dart';
import 'package:assignment/utils/utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget vector(String asset,
    {double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    Color? color,
    double padding = 0,
    void Function()? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Padding(
      padding: padAll(value: padding),
      child: SvgPicture.asset(
        asset,
        width: width,
        height: height,
        fit: fit,
        // ignore: deprecated_member_use
        color: color,
      ),
    ),
  );
}

Widget vectorNetwork(String asset,
    {double? width, double? height, BoxFit fit = BoxFit.contain, Color? color}) {
  return SvgPicture.network(
    asset,
    width: width,
    height: height,
    fit: fit,
    // ignore: deprecated_member_use
    color: color,
  );
}

Widget loadImage(String imageUrl,
    {double? width, double? height, BoxFit fit = BoxFit.cover, String? tag}) {
  return CachedNetworkImage(
    imageUrl: imageUrl,
    width: width,
    height: height,
    fit: fit,
    placeholder: (context, url) => Center(
      child: SizedBox(height: 30.w, width: 30.w, child: const CircularProgressIndicator()),
    ),
    errorWidget: (context, url, error) {
      if (imageUrl.endsWith("svg")) {
        return vectorNetwork(imageUrl);
      } else {
        return Image.asset(Assets.iconsAppLogo,
            height: ScreenUtil().setHeight(30),
            width: ScreenUtil().setWidth(30),
            fit: BoxFit.contain);
      }
    },
  );
}

Widget searchBar(BuildContext context, {required Function(String) onChange}) {
  return Container(
    decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(ScreenUtil().radius(6))),
    child: TextField(
        style: AppTextTheme.bodyStyle,
        decoration: InputDecoration(
            hintText: S.of(context).searchAnyProduct,
            hintStyle: AppTextTheme.bodyStyle
                .copyWith(color: Theme.of(context).colorScheme.surfaceVariant),
            prefixIcon:
                Icon(Icons.search_rounded, color: Theme.of(context).colorScheme.surfaceVariant),
            suffixIcon:
                Icon(Icons.mic_none_rounded, color: Theme.of(context).colorScheme.surfaceVariant),
            border: InputBorder.none),
        onChanged: onChange),
  );
}

Widget squareButton(BuildContext context, {required String title, required IconData icon}) {
  return Container(
    padding: padSym(horizontal: 6.w, vertical: 2.h),
    decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(ScreenUtil().radius(4))),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(title, style: AppTextTheme.captionStyle),
        boxW4(),
        Icon(
          icon,
          color: Theme.of(context).colorScheme.onBackground,
        )
      ],
    ),
  );
}

Widget categoryCard({required String image, required String categoryName}) {
  return SizedBox(
    width: 56.w,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 28.r,
          backgroundImage: CachedNetworkImageProvider(image),
        ),
        boxH4(),
        Text(
          categoryName,
          style: AppTextTheme.captionStyle,
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        )
      ],
    ),
  );
}

Widget sponsoredCard(BuildContext context, SponsorModel value) {
  return Container(
    padding: padOnly(top: 12.h, bottom: 8.h, left: 12.w),
    decoration: BoxDecoration(color: Theme.of(context).colorScheme.surface),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Sponsored", style: AppTextTheme.subHeadingMediumStyle),
        boxH4(),
        loadImage(value.image),
        boxH4(),
        Row(
          children: [
            Text(value.offerDescription, style: AppTextTheme.subtitleBoldStyle),
            const Spacer(),
            Icon(Icons.arrow_forward_ios_rounded, size: 16.w),
            boxW8()
          ],
        )
      ],
    ),
  );
}

Widget bannerCard(BuildContext context, HomeBannerModel value) {
  return Container(
    color: Theme.of(context).colorScheme.surface,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        loadImage(value.image, fit: BoxFit.fitWidth, width: screenWidth()),
        if (value.title != "" && value.description != "") ...[
          Row(
            children: [
              boxW8(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  boxH4(),
                  Text(value.title, style: AppTextTheme.subHeadingMediumStyle),
                  Text(value.description, style: AppTextTheme.subtitleStyle),
                ],
              ),
              const Spacer(),
              Container(
                padding: padSym(horizontal: 12.w, vertical: 4.h),
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(ScreenUtil().radius(4))),
                child: Row(
                  children: [
                    Text(S.of(context).viewAll,
                        style: AppTextTheme.labelW600Style
                            .copyWith(color: Theme.of(context).colorScheme.onSecondary)),
                    boxW4(),
                    Icon(Icons.arrow_forward, color: Theme.of(context).colorScheme.onSecondary)
                  ],
                ),
              ),
              boxW16()
            ],
          ),
        ],
        boxH8()
      ],
    ),
  );
}

Widget moreProductCard(
    BuildContext context, String title, String subtitle, Color color, IconData iconData) {
  return Container(
    padding: padSym(horizontal: 12.w, vertical: 6.h),
    decoration:
        BoxDecoration(borderRadius: BorderRadius.circular(ScreenUtil().radius(8)), color: color),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(title,
                  style: AppTextTheme.titleW600Style
                      .copyWith(color: Theme.of(context).colorScheme.onSecondary)),
              boxH8(),
              Row(
                children: [
                  Icon(
                    iconData,
                    color: Theme.of(context).colorScheme.onSecondary,
                    size: 16.sp,
                  ),
                  boxW4(),
                  Text(
                    subtitle,
                    style: AppTextTheme.bodyStyle
                        .copyWith(color: Theme.of(context).colorScheme.onSecondary),
                  ),
                ],
              )
            ]),
        Container(
          padding: padSym(horizontal: 12.w, vertical: 4.h),
          decoration: BoxDecoration(
              border: Border.all(width: 1.5, color: Theme.of(context).colorScheme.onSecondary),
              borderRadius: BorderRadius.circular(ScreenUtil().radius(4))),
          child: Row(
            children: [
              Text(S.of(context).viewAll,
                  style: AppTextTheme.labelW600Style
                      .copyWith(color: Theme.of(context).colorScheme.onSecondary)),
              boxW4(),
              Icon(Icons.arrow_forward, color: Theme.of(context).colorScheme.onSecondary)
            ],
          ),
        )
      ],
    ),
  );
}

Widget productCard(BuildContext context, ProductModel product) {
  return Container(
    width: 190.w,
    decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(ScreenUtil().radius(6))),
    child: Column(mainAxisSize: MainAxisSize.min, children: [
      ClipRRect(
          borderRadius: BorderRadius.circular(ScreenUtil().radius(4)),
          child: loadImage(
            product.images[0],
            height: 150.h,
            width: 190.w,
          )),
      Padding(
        padding: padSym(horizontal: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            boxH8(),
            Text(product.title,
                style: AppTextTheme.bodyMediumStyle, maxLines: 1, overflow: TextOverflow.ellipsis),
            boxH4(),
            Text(
              product.description,
              style: AppTextTheme.captionStyle,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            boxH4(),
            Text("₹ ${convertDollarToRupee(product.priceD).toStringAsFixed(0)}",
                style: AppTextTheme.bodyMediumStyle),
            Row(
              children: [
                Text(
                    "₹ ${calculateOriginalValue(product.priceD, product.discountPercentage).toStringAsFixed(2)}",
                    style: AppTextTheme.labelMediumStyle.copyWith(
                        color: Theme.of(context).colorScheme.surfaceVariant,
                        decoration: TextDecoration.lineThrough)),
                Text("   ${product.discountPercentage.toStringAsFixed(0)}%",
                    style: AppTextTheme.labelMediumStyle
                        .copyWith(color: Theme.of(context).colorScheme.primaryContainer)),
              ],
            ),
            boxH4(),
            Row(
              children: [
                RatingBar.builder(
                  initialRating: product.rating.toDouble(),
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemSize: 15.w,
                  ignoreGestures: true,
                  itemCount: 5,
                  itemBuilder: (context, _) => const Icon(Icons.star_rounded, color: Colors.amber),
                  onRatingUpdate: (rating) {},
                ),
                Text(" ${product.stock}",
                    style: AppTextTheme.labelStyle
                        .copyWith(color: Theme.of(context).colorScheme.surfaceVariant))
              ],
            ),
          ],
        ),
      )
    ]),
  );
}

Widget trendingProductCard(BuildContext context, ProductModel product) {
  return Container(
    width: 190.w,
    decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(ScreenUtil().radius(6))),
    child: Column(mainAxisSize: MainAxisSize.min, children: [
      ClipRRect(
          borderRadius: BorderRadius.circular(ScreenUtil().radius(4)),
          child: loadImage(
            product.images[0],
            height: 150.h,
            width: 190.w,
          )),
      Padding(
        padding: padSym(horizontal: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            boxH8(),
            Text(
              product.description,
              style: AppTextTheme.captionStyle,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            boxH4(),
            Text("₹ ${convertDollarToRupee(product.priceD).toStringAsFixed(0)}",
                style: AppTextTheme.bodyMediumStyle),
            Row(
              children: [
                Text(
                    "₹ ${calculateOriginalValue(product.priceD, product.discountPercentage).toStringAsFixed(2)}",
                    style: AppTextTheme.labelMediumStyle.copyWith(
                        color: Theme.of(context).colorScheme.surfaceVariant,
                        decoration: TextDecoration.lineThrough)),
                Text("   ${product.discountPercentage.toStringAsFixed(0)}%",
                    style: AppTextTheme.labelMediumStyle
                        .copyWith(color: Theme.of(context).colorScheme.primaryContainer)),
              ],
            ),
          ],
        ),
      )
    ]),
  );
}
