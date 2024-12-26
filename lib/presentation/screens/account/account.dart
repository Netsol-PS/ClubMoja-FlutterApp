import 'package:demo/presentation/screens/account/widgets/account_row.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/res/colors/colors.dart';
import '../../../core/utils/constants/image_strings.dart';
import '../../../core/utils/constants/sizes.dart';
import '../../../core/utils/device/device_utility.dart';

class AccountScreen extends StatelessWidget {
  AccountScreen({super.key});
  final iosPlateForm = AppDeviceUtils.isIOS();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Account", style: Theme.of(context).textTheme.headlineMedium?.apply(color: Colors.black))),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: iosPlateForm ? AppSizes.lg : AppSizes.md),
        children: [
          //profile

          const SizedBox(height: AppSizes.lg),
          const AccountRowHeading(headingName: "Details"),
          const SizedBox(height: AppSizes.sm),
          AccountRow(
            icon: AppImages.profile,
            name: 'Profile', onTap: () {},
            // onTap: () => Get.to(()=> UserListView()),
          ),
          const SizedBox(height: AppSizes.sm),
          const AccountDivider(),
          //Setting

          const SizedBox(height: AppSizes.md),
          const AccountRowHeading(headingName: "Settings"),
          AccountRow(
            icon: AppImages.language,
            name: 'Language Preferences',
            onTap: () {},
          ),
          AccountRow(
            icon: AppImages.permission,
            name: 'Permissions',
            onTap: () {},
          ),
          const SizedBox(height: AppSizes.sm),
          const AccountDivider(),
          //Addresses

          const SizedBox(height: AppSizes.md),
          const AccountRowHeading(headingName: "Addresses"),
          AccountRow(
            icon: AppImages.savedAddresses,
            name: 'Saved Addresses',
            onTap: () {},
          ),
          const SizedBox(height: AppSizes.sm),
          const AccountDivider(),

          //Payment Management
          const SizedBox(height: AppSizes.md),
          const AccountRowHeading(headingName: "Payment Management"),
          AccountRow(
            icon: AppImages.paymentMenthed,
            name: 'Payment Methods',
            onTap: () {},
          ),
          AccountRow(
            icon: AppImages.redeemedPoints,
            name: 'Redeemed Points',
            onTap: () {},
          ),
          const SizedBox(height: AppSizes.sm),
          const AccountDivider(),
          //Legal

          const SizedBox(height: AppSizes.md),
          const AccountRowHeading(headingName: "Legal"),
          AccountRow(
            icon: AppImages.termConditions,
            name: 'Terms and policies',
            onTap: () {},
          ),
          const SizedBox(height: AppSizes.md),
          const AccountDivider(),

          //account logout and delete
          AccountRow(
            icon: AppImages.logout,
            name: 'Logout',
            onTap: () {},
          ),

          AccountRow(
            icon: AppImages.deleteAccount,
            name: 'Delete Account',
            onTap: () => {},
          ),

        ],
      ),
    );
  }
}

class AccountDivider extends StatelessWidget {
  const AccountDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2.0,
      decoration: BoxDecoration(
        color: AppColors.secondary.withOpacity(0.3),
      ),
    );
  }
}

class AccountRowHeading extends StatelessWidget {
  const AccountRowHeading({
    super.key, required this.headingName,
  });

  final String headingName;

  @override
  Widget build(BuildContext context) {
    return Text(
      headingName,
      style: Theme.of(context).textTheme.titleSmall?.apply(color: Colors.black.withOpacity(0.7)),
    );
  }
}