import 'package:demo/data/models/responses/country_data.dart';
import 'package:demo/repository/interfaces/auth_repo.dart';
import 'package:get/get.dart';
import '../../core/di/injector.dart';
import '../../core/utils/popups/loaders.dart';
import '../../navigation_menu.dart';
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
          AppLoaders.successSnackBar(title: "response", message: response.data!.toString());
          Get.off(() => const NavigationMenu());
         // _getCountriesLiveData.postValue(response.data!);
         //  notifyListeners();
        } else {
          AppLoaders.errorSnackBar(title: "Error", message: response.error?.message ?? 'Unknown error');
          // Utils.snackBar("Error", response.error?.message ?? 'Unknown error');
        }
      },
    );
  }
}
