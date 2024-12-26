import 'dart:async';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../core/res/colors/colors.dart';
import '../../../../core/utils/constants/image_strings.dart';
import '../../../../core/utils/constants/sizes.dart';
import '../../../../core/utils/device/device_utility.dart';


class PromotionalBanner extends StatefulWidget {
  const PromotionalBanner({super.key});

  @override
  _PromotionalBannerState createState() => _PromotionalBannerState();
}

class _PromotionalBannerState extends State<PromotionalBanner> {
  final PageController _pageController = PageController();
  final iosPlateForm = AppDeviceUtils.isIOS();
  int _currentPage = 0;
  late Timer _timer;

  final List<String> _promoImages = [
    AppImages.promotionalBanner,
    AppImages.promotionalBanner,
    // TImages.promotionalBanner
  ];

  @override
  void initState() {
    super.initState();

    // Set up timer to automatically change page every 10 seconds
    _timer = Timer.periodic(const Duration(seconds: 7), (timer) {
      if (_currentPage < _promoImages.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // PageView for banner images
        SizedBox(
          height: iosPlateForm ? 165 : 145, // Height of the banner
          child: PageView.builder(
            controller: _pageController,
            itemCount: _promoImages.length,
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  _promoImages[index],
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              );
            },
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
          ),
        ),

        // Positioned SmoothPageIndicator at the bottom of the banner
        Positioned(
          bottom: AppSizes.spaceBtwItems, // Distance from the bottom of the banner
          child: SmoothPageIndicator(
            controller: _pageController,
            count: _promoImages.length,
            effect: WormEffect(
              dotWidth: 10,
              dotHeight: 10,
              dotColor: AppColors.grey.withOpacity(0.5),
              activeDotColor: AppColors.white, // Active dot color
            ),
          ),
        ),
      ],
    );
  }
}
