import 'package:demo/data/models/responses/country_data.dart';

import '../../data/models/responses/api_response.dart';

abstract class IAuthRepo {
  Future<IResponse<List<CountryData>>> getCountries();
  //
  // Future<IResponse<bool>> verifyUserExisting(String recipient);
}
