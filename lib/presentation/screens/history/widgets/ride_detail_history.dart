import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/res/colors/colors.dart';
import '../../../../core/utils/constants/image_strings.dart';
import '../../../../core/utils/constants/sizes.dart';
import '../history.dart';
import '../raise_dispute/raise_dispute.dart';
import '../view_dispute/view_dispute.dart';

class RideDetailPage extends StatelessWidget {
  final RideHistory ride;

  RideDetailPage({required this.ride});

  List<TitleValueModel> get titleValue {
    return [
      TitleValueModel(
          title: 'Date', value: DateFormat('yyyy-MM-dd').format(ride.date)),
      TitleValueModel(
        title: 'Total Ride Time',
        value:
            '${ride.totalRideTime.inHours} hours ${ride.totalRideTime.inMinutes % 60} minutes',
      ),
      TitleValueModel(
          title: 'Distance Travelled', value: '${ride.distanceTravelled} km'),
      TitleValueModel(title: 'Ride Fare', value: '${ride.totalFare} QAR'),
      TitleValueModel(
          title: 'Outstanding Cancellation Fee',
          value: '${ride.outstandingCancellationFee.toStringAsFixed(2)} QAR'),
      TitleValueModel(
          title: 'Waiting Charges',
          value: '${ride.waitingCharges.toStringAsFixed(2)} QAR'),
      TitleValueModel(
          title: 'Total Fare',
          value:
              '${ride.totalFare + ride.outstandingCancellationFee + ride.waitingCharges} QAR'),
      TitleValueModel(title: 'Payment Method', value: ride.paymentMethod),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Center(
          child: Text(
            "Ride Details",
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.apply(color: Colors.black),
          ),
        ),
        showBackArrow: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
        child: ListView(
          children: [
            // First Row: Stack with car image and person image
            Center(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Image.asset(
                    ride.carImage, // Car image
                    width: 160,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    bottom: -10,
                    right: 10,
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(ride.picture), // Person image
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),

            // Second Row: Name, Dot, Rating Star SVG, and Average Rating
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center, // Center the row
                children: [
                  Text(ride.name,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.apply(color: Colors.black)),
                  const SizedBox(width: 8),
                  const Icon(Icons.circle, size: 4, color: Colors.black), // Dot
                  const SizedBox(width: 8),
                  SvgPicture.asset(
                    AppImages.averageRating, // SVG star icon
                  ),
                  const SizedBox(width: 4),
                  Text('${ride.rating}',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.apply(color: Colors.grey)),
                ],
              ),
            ),
            const SizedBox(height: 8),
            // Third Row: Car Number Plate and Car Category
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(ride.carNumberPlate,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.apply(color: Colors.black)),
                  const SizedBox(width: 8),
                  Text(ride.colorCategory,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.apply(color: AppColors.secondary)),
                ],
              ),
            ),
            SizedBox(height: 8),
            // Fourth Row: Car Name and Car Color
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(ride.carModel,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.apply(color: Colors.black)),
                  const SizedBox(width: 8),
                  const Icon(Icons.circle, size: 4, color: Colors.black), // Dot
                  const SizedBox(width: 8),
                  Text(ride.carColor,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.apply(color: Colors.black)),
                ],
              ),
            ),
            SizedBox(height: 8),

            // Fifth Row: Buttons - View Dispute and Raise Dispute
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    onPressed: () => Get.to(() => RaiseDispute(driverName: ride.name, profileImage: ride.picture,)),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    ),
                    child: Text('Raise Dispute'),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () => Get.to(() => ViewDispute()),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    ),
                    child: Text('View Dispute'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),

            // Sixth Row: Divider with shadow and secondary color with alpha
            Container(
              height: 2.5,
              decoration: BoxDecoration(
                color: AppColors.secondary.withOpacity(0.2),
                // Applying alpha (transparency) to secondary color
                boxShadow: [
                  BoxShadow(
                    color: AppColors.secondary.withOpacity(0.1),
                    // Shadow color and transparency
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 4), // Shadow position
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),

            Row(
              children: [
                Text("Rate:",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.apply(
                        color: Colors.black.withOpacity(0.5))),

                const SizedBox(
                  width: 10,
                ),

                RatingWidget(
                  rating: ride.totalRateGiven,
                  selectedStarPath: AppImages.rideDetailRating, // Path to your selected (filled) star SVG
                  unselectedStarPath: AppImages.unselectedRideDetailRating, // Path to your unselected (outlined) star SVG
                ),
              ],
            ),

            // List of TitleValueModel
            ListView.builder(
              shrinkWrap: true,
              // Important to prevent ListView from occupying all space
              physics: const NeverScrollableScrollPhysics(),
              // Prevent nested scrolling
              itemCount: titleValue.length,
              itemBuilder: (context, index) {
                final item = titleValue[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 2),
                      Divider(
                        color: AppColors.secondary.withOpacity(0.1),
                        thickness: 1,
                        height: 1,
                      ),
                      const SizedBox(height: 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('${item.title}:',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.apply(
                                      color: Colors.black.withOpacity(0.5))),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(item.value,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.apply(color: Colors.black)),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Route",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .apply(color: AppColors.black),
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      AppImages.picknDrop,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(ride.pickUpAddress,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.apply(color: Colors.grey)),
                          Text(ride.dropOffAddress,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.apply(color: Colors.grey)),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TitleValueModel {
  final String title;
  final String value;

  TitleValueModel({required this.title, required this.value});
}

class RatingWidget extends StatelessWidget {
  final int rating; // The current rating (number of filled stars)
  final int totalStars; // Total number of stars to display
  final String selectedStarPath; // Path to the selected star SVG
  final String unselectedStarPath; // Path to the unselected star SVG

  RatingWidget({
    required this.rating,
    this.totalStars = 5, // Default to 5 stars
    required this.selectedStarPath,
    required this.unselectedStarPath,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(totalStars, (index) {
        // If the current index is less than the rating, show the selected (filled) star
        if (index < rating) {
          return Padding(
            padding: const EdgeInsets.only(right: 4.0),
            child: SvgPicture.asset(
              selectedStarPath,
              width: 24,
              height: 24,
            ),
          );
        } else {
          // If the current index is greater or equal to the rating, show the unselected (outlined) star
          return Padding(
            padding: const EdgeInsets.only(right: 4.0),
            child: SvgPicture.asset(
              unselectedStarPath,
              width: 24,
              height: 24,
            ),
          );
        }
      }),
    );
  }
}
