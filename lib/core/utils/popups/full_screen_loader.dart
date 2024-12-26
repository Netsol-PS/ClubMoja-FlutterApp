import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';

class AppFullScreenLoader {
  /// Open a full-screen dialog with a loader and transparent background.
  /// This method doesn't return anything.
  static void openLoadingDialog() {
    showDialog(
      context: Get.overlayContext!, // Use Get.overlayContext for overlay delays
      barrierDismissible: false, // The dialog can't be dismissed by tapping outside it
      builder: (_) => PopScope(
        canPop: false, // Disable popping with the back button
        child: Container(
          color: Colors.transparent, // Transparent background
          width: double.infinity,
          height: double.infinity,
          child: const Center(
            child: CupertinoActivityIndicator(radius: 20.0), // iOS loader
          ),
        ),
      ),
    );
  }

  /// Stop the currently open loading dialog.
  /// This method doesn't return anything.
  static void stopLoading() {
    Navigator.of(Get.overlayContext!).pop(); // Close the dialog using the Navigator
  }
}