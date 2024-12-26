import 'package:demo/presentation/screens/account/account.dart';
import 'package:demo/presentation/screens/history/history.dart';
import 'package:demo/presentation/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'core/res/colors/colors.dart';
import 'core/utils/constants/image_strings.dart';
import 'core/utils/device/device_utility.dart';
import 'core/utils/helpers/helper_functions.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = THelperFunctions.isDarkMode(context);
    final iosPlateForm = AppDeviceUtils.isIOS();

    return Scaffold(
      bottomNavigationBar: Obx(
            () => Container(
          height: iosPlateForm ? 92 : 82, // Adjust height for the bottom bar
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),  // Shadow color
                offset: const Offset(0, -1),  // Shadow direction
                blurRadius: 6,  // Shadow blur
              ),
            ],
          ),
          child: BottomNavigationBar(
            currentIndex: controller.selectedIndex.value,
            onTap: (index) => controller.selectedIndex.value = index,
            backgroundColor: darkMode ? AppColors.black : Colors.white,
            selectedItemColor: darkMode ? AppColors.white : AppColors.black,
            unselectedItemColor: darkMode ? Colors.white.withOpacity(0.6) : Colors.black.withOpacity(0.6),
            showUnselectedLabels: true, // Show labels below icons
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: _buildIcon(
                  controller.selectedIndex.value == 0
                      ? AppImages.historySelected
                      : AppImages.history,
                  controller.selectedIndex.value == 0,
                ),
                label: 'History',
              ),
              BottomNavigationBarItem(
                icon: _buildIcon(
                  controller.selectedIndex.value == 1
                      ? AppImages.homeSelected
                      : AppImages.home,
                  controller.selectedIndex.value == 1,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: _buildIcon(
                  controller.selectedIndex.value == 2
                      ? AppImages.accountSelected
                      : AppImages.account,
                  controller.selectedIndex.value == 2,
                ),
                label: 'Account',
              ),
            ],
          ),
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }

  Widget _buildIcon(String svgPath, bool isSelected) {
    return SvgPicture.asset(
      svgPath,
      width: 24,
      height: 24,
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 1.obs;

  final screens = [
    HistoryScreen(),
    HomeScreen(),
    AccountScreen(),
  ];
}
