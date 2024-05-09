import 'package:assignment/common_widgets/helper_widgets.dart';
import 'package:assignment/common_widgets/size_config.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BannerCarousel extends StatefulWidget {
  final List<String> images;

  const BannerCarousel(this.images, {super.key});

  @override
  BannerCarouselState createState() => BannerCarouselState();
}

class BannerCarouselState extends State<BannerCarousel> {
  int _currentIndex = 0;

  late final List<String> _images;

  @override
  void initState() {
    _images = widget.images;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            height: 200.h,
            enlargeCenterPage: true,
            autoPlay: true,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          items: widget.images
              .map((element) => ClipRRect(
                  borderRadius: BorderRadius.circular(ScreenUtil().radius(12)),
                  child: loadImage(element)))
              .toList(),
        ),
        boxH8(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _images.map((url) {
            int index = _images.indexOf(url);
            return Container(
              width: 8.0,
              height: 8.0,
              margin: const EdgeInsets.symmetric(horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == index
                    ? Theme.of(context).colorScheme.primaryContainer
                    : const Color(0xFFDEDBDB),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
