import 'package:flutter/material.dart';
import '../../../core/res/colors/colors.dart';
import '../../../core/utils/device/device_utility.dart';
import '../../../core/utils/helpers/helper_functions.dart';


class CustomTabBar extends StatelessWidget implements PreferredSizeWidget {
  /// If we want to add the background color to tabs we have to wrap them in Material Widget
  /// To do that we need [PreferredSized] widget & that's why created custom class. [PreferredSizeWidget]
  const CustomTabBar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Material(
      color: dark ? AppColors.black : AppColors.white,
      child: TabBar(
        tabs: tabs,
        isScrollable: true,
        indicatorColor: AppColors.primary,
        labelColor: dark ? AppColors.white : AppColors.primary,
        unselectedLabelColor: AppColors.darkGrey,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppDeviceUtils.getAppBarHeight());
}
