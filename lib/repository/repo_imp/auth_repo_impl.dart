import '../../core/di/injector.dart';
import '../../data/models/responses/api_response.dart';
import '../../data/models/responses/country_data.dart';
import '../../network/network_api_service.dart';
import '../interfaces/auth_repo.dart';
import 'api_repo_imp.dart';

class AuthRepo extends ApiRepoImpl implements IAuthRepo {
  final apiServices = getIt<NetworkApiServices>();

  @override
  Future<IResponse<List<CountryData>>> getCountries() async {
    return await handleRequest<List<CountryData>>(
            () => apiServices.getCountries('region/countries'),
            (data) => (data as List).map((e) => CountryData.fromJson(e)).toList());
  }
}
