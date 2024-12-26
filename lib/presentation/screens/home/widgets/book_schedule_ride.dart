import 'package:flutter/material.dart';
import '../../../../core/res/colors/colors.dart';
import '../../../../core/utils/device/device_utility.dart';

// Separate widget for displaying the horizontal list
class RideOptionList extends StatelessWidget {
  final List<RideOption> rideOptions;
  final iosPlateForm = AppDeviceUtils.isIOS();

  RideOptionList({required this.rideOptions});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: iosPlateForm ? 115 : 105, // Height of each item in the list
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: rideOptions.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              right: index == rideOptions.length - 1 ? 0 : 12,
            ),
            child: Container(
              width: iosPlateForm ? 178 : 158, // Width of the rectangle
              decoration: BoxDecoration(
                color: AppColors.smokeColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    rideOptions[index].iconPath,
                    height: 45, // Icon size
                    width: 60,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    rideOptions[index].name,
                    style: Theme.of(context).textTheme.titleLarge?.apply(color: AppColors.black),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}


class RideOption {
  final String name;
  final String iconPath;

  RideOption({required this.name, required this.iconPath});
}
