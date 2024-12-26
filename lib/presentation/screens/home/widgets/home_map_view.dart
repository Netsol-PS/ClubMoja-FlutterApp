
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../core/res/colors/colors.dart';
import '../../../../core/utils/constants/image_strings.dart';
import '../../../../core/utils/constants/sizes.dart';
import '../../../../core/utils/device/device_utility.dart';

class ViewMap extends StatelessWidget {
  ViewMap({super.key});
  final iosPlateForm = AppDeviceUtils.isIOS();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title Text
        Text(
          "Where are you off to today?",
          style: Theme.of(context).textTheme.titleMedium?.apply(
            color: AppColors.black.withOpacity(0.6),
          ),
        ),

        const SizedBox(height: AppSizes.spaceBtwItems),

        // Stack widget to overlay button and image
        Stack(
          alignment: Alignment.center,
          children: [
            // Image (Background)
            ClipRRect(
              borderRadius: BorderRadius.circular(4.0),
              child: Image.asset(
                AppImages.viewMap,
                width: double.infinity,
                height: iosPlateForm ? 125 : 115,
                fit: BoxFit.cover,
              ),
            ),
            // Positioned Button (Above the Image)
            Positioned(
              child: ElevatedButton(
                onPressed: () {
                  // Handle the button press logic (e.g., open map or perform some action)
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                ),
                child: const Text("View Map"),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
