import 'package:demo/data/models/responses/country_data.dart';
import 'package:demo/repository/interfaces/auth_repo.dart';
import 'package:flutterx_live_data/flutterx_live_data.dart';

import '../../core/di/injector.dart';
import '../../core/utils/utils.dart';
import 'base_view_model.dart';

class LoginViewModel extends BaseViewModel {
  final authRepo = getIt<IAuthRepo>();

  // // Initialize with an empty list to avoid null assertions
  // final MutableLiveData<List<CountryData>> _getCountriesLiveData =
  //     MutableLiveData<List<CountryData>>(value: []);
  //
  // // Expose as LiveData
  // LiveData<List<CountryData>> get getCountriesLiveData => _getCountriesLiveData;

  Future<void> getCountries() async {
    await handleRequest<List<CountryData>>(
      () => authRepo.getCountries(),
      (response) {
        if (response.isSuccessful && response.data != null) {
          // Update live data on success
         // _getCountriesLiveData.postValue(response.data!);
         //  notifyListeners();
        } else {
          Utils.snackBar("Error", response.error?.message ?? 'Unknown error');
        }
      },
    );
  }
}
