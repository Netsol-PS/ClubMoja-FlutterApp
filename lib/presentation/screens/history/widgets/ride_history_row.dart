import 'package:demo/presentation/screens/history/widgets/ride_detail_history.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../core/res/colors/colors.dart';
import '../../../../core/utils/constants/image_strings.dart';
import '../../../../core/utils/constants/sizes.dart';
import '../history.dart';

class RideHistoryRow extends StatelessWidget {
  const RideHistoryRow({
    super.key,
    required this.rides,
  });

  final List<RideHistory> rides;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: rides.length,
        itemBuilder: (context, index) {
          final ride = rides[index];

          return InkWell(
            onTap: () => Get.to(() => RideDetailPage(ride: ride)),
            splashColor: Colors.transparent, // Disable splash effect
            highlightColor: Colors.transparent,
            child: Padding(
              padding: EdgeInsets.zero,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: AppSizes.md/2),
                  // First Row: Image, Name, and Total Fare (QAR)
                  Row(
                    children: [
                      Image.asset(
                        ride.picture,
                        width: 30,
                        height: 30,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 12),
                      Text(ride.name, style: Theme.of(context).textTheme.bodyLarge?.apply(color: Colors.black)),
                      const Spacer(),
                      Text('${ride.totalFare.toStringAsFixed(2)} QAR', style: Theme.of(context).textTheme.titleLarge?.apply(color: AppColors.secondary)),
                    ],
                  ),
                  const SizedBox(height: AppSizes.lg/2),

                  // Second Row: Date and Rating (Using SVG)
                  Row(
                    children: [
                      Text('${ride.date.toLocal()}'.split(' ')[0], style: Theme.of(context).textTheme.titleLarge?.apply(color: Colors.black)),
                      const Spacer(),
                      SvgPicture.asset(
                        AppImages.ratingStar,
                        width: 16,
                        height: 16,
                      ),

                      Text(' ${ride.rating}', style: Theme.of(context).textTheme.titleLarge?.apply(color: Colors.black)),
                    ],
                  ),
                  const SizedBox(height: AppSizes.lg/2),

                  // Third Row: Ride Completed or Not Completed (Using SVG)
                  Row(
                    children: [
                      SvgPicture.asset(
                        ride.completed
                            ? AppImages.rideCompleted // Completed icon
                            : AppImages.rideCancelled, // Not completed icon
                        width: 20,
                        height: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(ride.completed ? 'Completed' : 'Cancelled', style: Theme.of(context).textTheme.bodyMedium?.apply(color: Colors.black)),

                    ],
                  ),

                  const SizedBox(height: AppSizes.lg/2),
                  // Fourth Row: Image and Pick-Up/Drop-Off Address
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

                            Text(ride.pickUpAddress, style: Theme.of(context).textTheme.bodyLarge?.apply(color: Colors.grey)),

                            Text(ride.dropOffAddress, style: Theme.of(context).textTheme.bodyLarge?.apply(color: Colors.grey)),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: AppSizes.lg/2),
                  const Divider()
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}