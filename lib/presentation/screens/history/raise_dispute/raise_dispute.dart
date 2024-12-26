import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../core/res/colors/colors.dart';
import '../../../../core/utils/constants/sizes.dart';

class RaiseDispute extends StatelessWidget {
  const RaiseDispute(
      {super.key, required this.driverName, required this.profileImage});

  final String driverName;
  final String profileImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Center(
          child: Text("Raise Dispute",
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.apply(color: Colors.black)),
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.lg),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: AppSizes.xl,
            ),
            Row(
              children: [
                Text(
                  "Against:",
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.apply(color: Colors.grey),
                ),
                const SizedBox(
                  width: AppSizes.md,
                ),
                Image.asset(
                  profileImage,
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  width: AppSizes.md,
                ),
                Text(
                  driverName,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.apply(color: Colors.black),
                ),
              ],
            ),
            const SizedBox(
              height: AppSizes.md,
            ),
            Divider(
              color: AppColors.secondary.withOpacity(0.1),
              thickness: 1,
              height: 1,
            ),
            const SizedBox(
              height: AppSizes.md,
            ),
            Text(
              "Reason*",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.apply(color: Colors.black),
            ),
            Container(
              width: double.infinity,
              // Full screen width
              height: 200,
              // Fixed height
              padding: const EdgeInsets.symmetric(vertical: AppSizes.sm),
              // Optional padding for inner spacing
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Write reason of complaint',
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                maxLines: null,
                expands: true,
                textAlignVertical: TextAlignVertical.top,
              ),
            ),
            const SizedBox(
              height: AppSizes.xl,
            ),
            Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                        onPressed: () => Get.back(), child: const Text("Raise"))),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
