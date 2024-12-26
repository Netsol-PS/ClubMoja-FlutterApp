import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../popups/loaders.dart';

class NetworkManager extends GetxController {
  static NetworkManager get instance => Get.find();

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  final Rx<ConnectivityResult> _connectionStatus = ConnectivityResult.none.obs;

  ///initialize the network manager and set up a stream to continually check the connection status
  @override
  void onInit() {
    super.onInit();
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  ///update connection status based on changes in connectivity and show a relevant popup for no internet Connection
  Future<void> _updateConnectionStatus(List<ConnectivityResult> result) async {
    // Assuming you want to check the first result in the list.
    _connectionStatus.value = result.isNotEmpty ? result.first : ConnectivityResult.none;

    if (_connectionStatus.value == ConnectivityResult.none) {
      AppLoaders.customToast(message: 'No internet connection');
    }
  }

  ///check the internet connection status
  Future<bool> isConnected() async {
    try {
      final result = await _connectivity.checkConnectivity();
      if (result.contains(ConnectivityResult.none)) {
        print("No internet connection.");
        AppLoaders.errorSnackBar(title: "No Internet", message: "Please check your internet connection.");
        return false;
      }else{
        return true;
      }
    } on PlatformException catch (_) {
      return false;
    }
  }




  ///dispose or close the active connectivity stream
  @override
  void onClose() {
    super.onClose();
    _connectivitySubscription.cancel();
  }
}

