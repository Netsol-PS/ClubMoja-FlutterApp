import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import '../../data/models/responses/api_response.dart';

enum RequestState { Start, Loading, Success, Error }

class BaseViewModel extends ChangeNotifier {
  RequestState _requestState = RequestState.Start;
  String? _errorMessage;
  bool _isInProcess = false;

  RequestState get requestState => _requestState;
  String? get errorMessage => _errorMessage;
  bool get isInProcess => _isInProcess;

  void requestStarted() {
    if (!_isInProcess) {
      _isInProcess = true;
      _requestState = RequestState.Loading;
      notifyListeners();
    }
  }

  void requestFinished() {
    _isInProcess = false;
    _requestState = RequestState.Success;
    notifyListeners();
  }

  void requestFinishedWithError(String error) {
    _isInProcess = false;
    _requestState = RequestState.Error;
    _errorMessage = error;
    notifyListeners();
  }

  Future<void> handleRequest<T>(
      Future<IResponse<T>> Function() call, Function(IResponse<T>) result,
      {bool defaultErrorHandling = true}) async {
    requestStarted();
    try {
      final res = await call();
      if (res.isSuccessful) {
        requestFinished();
      } else {
        requestFinishedWithError(res.error?.message ?? "Unknown error");
      }
      result(res);
    } catch (e) {
      requestFinishedWithError(e.toString());
    }
  }
}
