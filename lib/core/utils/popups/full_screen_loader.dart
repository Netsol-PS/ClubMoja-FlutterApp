import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/widgets/loaders/animation_loader.dart';

class AppFullScreenLoader {
  /// Open a full-screen dialog with a given text & animation.
  /// This method doesn't return anything.
  ///
  /// Parameters:
  ///   - text: the text to be displayed in the loading dialog
  ///   - animation: the lottie animation to be shown
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!, // Use Get.overlayContext for overlay delays
      barrierDismissible: false, // The dialog can't be dismissed by tapping outside it
      builder: (_) => PopScope(
        canPop: false, // Disable popping with the back button
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 50), // Adjust the spacing as needed
              AppAnimationLoaderWidget(text: text, animation: animation),
            ],
          ),
        ),
      ),
    );
  }

  /// Stop the currently open loading dialog.
  /// This method doesn't return anything.
  static stopLoading() {
      Navigator.of(Get.overlayContext!).pop(); // Close the dialog using the Navigator
  }
}
