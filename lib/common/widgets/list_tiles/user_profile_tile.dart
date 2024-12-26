import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../core/res/colors/colors.dart';
import '../../../core/utils/constants/image_strings.dart';
import '../images/t_circular_image.dart';

class AppUserProfileTile extends StatelessWidget {
  const AppUserProfileTile({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const AppCircularImage(
        image: AppImages.user,
        width: 50,
        height: 50,
        padding: 0,
      ),
      title: Text(
        'John Smith',
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .apply(color: AppColors.white),
      ),
      subtitle: Text(
        'johnsmith@gmail.com',
        style:
            Theme.of(context).textTheme.bodyMedium!.apply(color: AppColors.white),
      ),
      trailing: IconButton(
        onPressed: onPressed,
        icon: const Icon(
          Iconsax.edit,
          color: AppColors.white,
        ),
      ),
    );
  }
}
