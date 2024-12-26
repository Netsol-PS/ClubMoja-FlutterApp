import 'package:demo/presentation/screens/home/widgets/book_schedule_ride.dart';
import 'package:demo/presentation/screens/home/widgets/home_map_view.dart';
import 'package:demo/presentation/screens/home/widgets/promotional_banner.dart';
import 'package:demo/presentation/screens/home/widgets/saved_addresses.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/texts/section_heading.dart';

import '../../../common/widgets/appbar/appbar.dart';
import '../../../core/res/colors/colors.dart';
import '../../../core/utils/constants/image_strings.dart';
import '../../../core/utils/constants/sizes.dart';
import '../../../core/utils/constants/text_strings.dart';
import '../../../core/utils/device/device_utility.dart';
import '../notification/notifcation.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final iosPlateForm = AppDeviceUtils.isIOS();

  @override
  Widget build(BuildContext context) {
    String userName = "Muhammad Kashif";  // Replace with actual user name data
    // Dummy data
    final List<RideOption> rideOptions = [
      RideOption(name: "Book a Ride", iconPath: AppImages.bookARide),
      RideOption(name: "Schedule Ride", iconPath: AppImages.scheduleRide),
    ];

    final List<AddressOption> savedAddresses = [
      AddressOption(
        name: "Home",
        address: "1234 Elm Street",
        iconPath: AppImages.homeAddress,
      ),
      AddressOption(
        name: "Work",
        address: "5678 Oak Avenue",
        iconPath: AppImages.workAddress,
      ),
      AddressOption(
        name: "Other",
        address: "9101 Pine Road",
        iconPath: AppImages.otherAddress,
      ),
    ];

    return Scaffold(
      appBar: CustomAppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppTexts.homeAppbarTitle, // Replace with dynamic title
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .apply(color: Colors.black),
            ),
            Text(
              userName, // Use the userName here
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .apply(color: AppColors.primary),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () => Get.to(() => const NotificationScreen()),
            icon: SvgPicture.asset(AppImages.notificationBellIcon),
            color: Colors.white,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: iosPlateForm ? AppSizes.lg : AppSizes.md),
          child: Column(
            children: [

              const SizedBox(height: AppSizes.md/2,),

              ViewMap(),

              const SizedBox(height: AppSizes.spaceBtwItems,),

              const PromotionalBanner(),

              const SizedBox(height: AppSizes.spaceBtwItems,),

              RideOptionList(rideOptions: rideOptions,),

              const SizedBox(height: AppSizes.spaceBtwItems/2,),

              AppSectionHeading(title: 'Saved Addresses',
                onPressed: (){},
              ),

              const SizedBox(height: AppSizes.spaceBtwItems/2,),

              SavedAddresses(addressOption: savedAddresses,)


            ],
          ),
        ),
      ),
    );
  }
}
