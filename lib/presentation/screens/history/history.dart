import 'package:demo/presentation/screens/history/widgets/ride_history_row.dart';
import 'package:flutter/material.dart';
import '../../../common/widgets/texts/heading_with_menu.dart';
import '../../../core/utils/constants/image_strings.dart';

class HistoryScreen extends StatelessWidget {
  HistoryScreen({super.key});

  final List<RideHistory> rides = [
    RideHistory(
      picture: AppImages.person,
      name: 'Bilal iqbal',
      carImage: AppImages.carImage,
      rating: 4.5,
      totalFare: 410.99,
      date: DateTime.now(),
      completed: false,
      pickUpAddress: '1234 Elm Street',
      dropOffAddress: 'Netsol technologies private limited',
      carModel: 'BMW Model 1',
      carColor: 'Black',
      colorCategory: 'Luxury',
      carNumberPlate: 'XYZ 1234',
      totalRateGiven: 4,
      totalRideTime: const Duration(hours: 2, minutes: 30),
      distanceTravelled: 150.0,
      outstandingCancellationFee: 30.0,
      waitingCharges: 5.0,
      paymentMethod: 'Credit Card',
    ),
    RideHistory(
      picture: AppImages.person,
      name: 'Muhammad Kashif',
      carImage: AppImages.carImage,
      rating: 4.5,
      totalFare: 452.99,
      date: DateTime.now(),
      completed: true,
      pickUpAddress: '1234 Elm Street',
      dropOffAddress: '5678 Oak Avenue',
      carModel: 'Tesla Model 3',
      carColor: 'Black',
      colorCategory: 'Luxury',
      carNumberPlate: 'XYZ 1234',
      totalRateGiven: 5,
      totalRideTime: const Duration(hours: 2, minutes: 30),
      distanceTravelled: 150.0,
      outstandingCancellationFee: 30.0,
      waitingCharges: 5.0,
      paymentMethod: 'Credit Card',
    ),

    RideHistory(
      picture: AppImages.person,
      name: 'Muhammad Hassan',
      carImage: AppImages.carImage,
      rating: 3.4,
      totalFare: 452.99,
      date: DateTime.now(),
      completed: true,
      pickUpAddress: 'Netsol technologies private limited',
      dropOffAddress: 'Lahore Pakistan Airport',
      carModel: 'Tesla Model 3',
      carColor: 'Black',
      colorCategory: 'Luxury',
      carNumberPlate: 'XYZ1234',
      totalRateGiven: 2,
      totalRideTime: const Duration(hours: 2, minutes: 30),
      distanceTravelled: 102.0,
      outstandingCancellationFee: 30.0,
      waitingCharges: 5.0,
      paymentMethod: 'cash',
    ),
    // Add more RideHistory objects here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("History", style: Theme.of(context).textTheme.headlineMedium?.apply(color: Colors.black)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            HeadingWithMenu(
              title: 'Ride History',
              menuItems: const ['Today','weekly', 'Monthly', 'Yearly'],
              onPressed: () {
                // Handle the press action if needed
              },
            ),
            const SizedBox(height: 10),
            RideHistoryRow(rides: rides),
          ],
        ),
      ),
    );
  }
}


class RideHistory {
  final String picture;
  final String name;
  final String carImage;
  final double rating;
  final double totalFare;
  final DateTime date;
  final bool completed;
  final String pickUpAddress;
  final String dropOffAddress;
  final String carModel;
  final String carColor;
  final String colorCategory;
  final String carNumberPlate;
  final int totalRateGiven;
  final Duration totalRideTime;
  final double distanceTravelled;
  final double outstandingCancellationFee;
  final double waitingCharges;
  final String paymentMethod;

  RideHistory({
    required this.picture,
    required this.name,
    required this.carImage,
    required this.rating,
    required this.totalFare,
    required this.date,
    required this.completed,
    required this.pickUpAddress,
    required this.dropOffAddress,
    required this.carModel,
    required this.carColor,
    required this.colorCategory,
    required this.carNumberPlate,
    required this.totalRateGiven,
    required this.totalRideTime,
    required this.distanceTravelled,
    required this.outstandingCancellationFee,
    required this.waitingCharges,
    required this.paymentMethod,
  });
}
