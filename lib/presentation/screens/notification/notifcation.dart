import 'package:flutter/material.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../core/res/colors/colors.dart';
import '../../../core/utils/constants/api_constants.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Center(
          child: Text("Notification",
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.apply(color: Colors.black)),
        ),
        showBackArrow: true,
      ),
      body: Center(child: Text("Coming Soon", style: Theme.of(context).textTheme.headlineSmall?.apply(color: AppColors.black),)),
    );
  }
}
