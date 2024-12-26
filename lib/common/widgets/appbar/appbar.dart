import 'package:flutter/material.dart';
import 'package:flutter/src/services/system_chrome.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../core/res/colors/colors.dart';
import '../../../core/utils/constants/sizes.dart';
import '../../../core/utils/device/device_utility.dart';
import '../../../core/utils/helpers/helper_functions.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.showBackArrow = false,
    this.leadingIcon,
    this.actions,
    this.leadingOnPressed,
  });

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final iosPlateForm = AppDeviceUtils.isIOS();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: iosPlateForm ? AppSizes.sm : 0),
      child: AppBar(
        automaticallyImplyLeading: false,
        leading: showBackArrow
            ? IconButton(
                onPressed: () => Get.back(),
                icon: Icon(Iconsax.arrow_left, color: dark ? AppColors.white : AppColors.dark))
            : leadingIcon != null
                ? IconButton(
                    onPressed: leadingOnPressed, icon: Icon(leadingIcon))
                : null,
        title: title,
        actions: actions,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(AppDeviceUtils.getAppBarHeight());
}
