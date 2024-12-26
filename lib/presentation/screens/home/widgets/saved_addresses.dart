import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/res/colors/colors.dart';
import '../../../../core/utils/device/device_utility.dart';


class SavedAddresses extends StatelessWidget {
  final List<AddressOption> addressOption;
  final iosPlateForm = AppDeviceUtils.isIOS();

  SavedAddresses({required this.addressOption});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: iosPlateForm ? 125 : 115, // Height of each item in the list
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: addressOption.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              right: index == addressOption.length - 1 ? 0 : 12, // Skip padding for the first item
            ),
            child: Container(
              width: iosPlateForm ? 114 : 100, // Width of the rectangle
              decoration: BoxDecoration(
                color: AppColors.smokeColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Icon at the top
                    SvgPicture.asset(addressOption[index].iconPath),

                    const SizedBox(height: 8),

                    // Name of the ride option
                    Text(
                      addressOption[index].name,
                      style: Theme.of(context).textTheme.titleLarge?.apply(color: Colors.black),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),

                    // Address of the ride option
                    Text(
                      addressOption[index].address,
                      style: Theme.of(context).textTheme.bodyMedium?.apply(color: Colors.black54),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}


class AddressOption {
  final String name;
  final String address;
  final String iconPath;

  AddressOption({required this.name, required this.address, required this.iconPath});
}