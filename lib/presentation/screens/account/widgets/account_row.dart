
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/res/colors/colors.dart';
import '../../../../core/utils/constants/sizes.dart';
import '../../../../core/utils/device/device_utility.dart';

class AccountRow extends StatelessWidget {
  final iosPlateForm = AppDeviceUtils.isIOS();
  final String icon;
  final String name;
  final void Function() onTap;

   AccountRow({super.key,
    required this.icon,
    required this.name,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent, // Disable splash effect
      highlightColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: iosPlateForm ? AppSizes.lg/2 : AppSizes.sm),
        child: Row(
          children: [
            SvgPicture.asset(
              icon
            ),
            const SizedBox(width: 16),
            Text(
              name,
              style: Theme.of(context).textTheme.titleMedium?.apply(color: AppColors.black),
            ),
            // Spacer(),
            // Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black),
          ],
        ),
      ),
    );
  }
}