import 'package:flutter/material.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../core/res/colors/colors.dart';

class ViewDispute extends StatelessWidget {
  ViewDispute({super.key});

  List<Dispute> disputes = [
    Dispute(
      title: 'Dispute 1',
      date: '23 Dec 2023, 12:20 p.m.',
      details:
          'Dear Support, I am writing to report a concerning ride experience with driver “Majid Bashir”. The trip involved unsafe driving practices and inappropriate behavior, necessitating immediate attention and refund my full amount.',
      status: 'Accepted',
      statusDetails: '',
    ),
    Dispute(
      title: 'Dispute 2',
      date: '23 Dec 2023, 12:20 p.m.',
      details:
          'Dear Support, I am writing to report a concerning ride experience with driver “Majid Bashir”',
      status: 'Rejected',
      statusDetails:
          'The evidence provided was insufficient to support your claim.',
    ),
    // Add more disputes as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Center(
          child: Text(
            "View Dispute",
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.apply(color: Colors.black),
          ),
        ),
        showBackArrow: true, // Add back button to the AppBar
      ),
      body: ListView.builder(
        itemCount: disputes.length,
        itemBuilder: (context, index) {
          final dispute = disputes[index];

          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
            child: Stack(
              clipBehavior: Clip.none, // Allow text to go outside the box
              children: [
                // Border Container for the dispute content
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.03),
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: AppColors.primary, // Border color
                      width: 1,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Details:",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.apply(color: AppColors.primary),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          dispute.details,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Text(
                              "Status:",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.apply(color: AppColors.primary),
                            ),
                            const SizedBox(width: 12),
                            Text(
                              dispute.status,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    color: dispute.status == 'Accepted'
                                        ? Colors.green
                                        : Colors.red, // Status color
                                  ),
                            ),
                          ],
                        ),
                        if (dispute.statusDetails != null &&
                            dispute.statusDetails!.isNotEmpty) ...[
                          const SizedBox(height: 8),
                          Text(
                            dispute.statusDetails!,
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: Colors
                                          .grey, // Customize the color for the status details
                                    ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),

                // Title and Date on top of the border
                Positioned(
                  top: -12,
                  left: 22,
                  right: 22,
                  child: Container(
                    color: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        vertical: 2.0, horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${dispute.title}: ',
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primary,
                                  ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          dispute.date,
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: Colors.black,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class Dispute {
  final String title;
  final String date;
  final String details;
  final String status;
  final String? statusDetails;

  Dispute({
    required this.title,
    required this.date,
    required this.details,
    required this.status,
    this.statusDetails, // statusDetails can be null
  });
}
