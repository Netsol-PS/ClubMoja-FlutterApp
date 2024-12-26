import 'package:demo/presentation/view_models/login_view_model.dart';
import 'package:demo/repository/interfaces/api_repo.dart';
import 'package:demo/repository/repo_imp/api_repo_imp.dart';
import 'package:demo/repository/repo_imp/auth_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../network/dio_client.dart';
import '../../network/network_api_service.dart';
import '../../repository/interfaces/auth_repo.dart';

final getIt = GetIt.instance;

void setupLocator() {
  // Register Dio
  getIt.registerLazySingleton<Dio>(() => DioClient.getInstance());

  // Register ApiRepo
  getIt.registerLazySingleton<ApiRepo>(() => ApiRepoImpl());
  // Register NetworkApiServices with injected Dio
  getIt.registerLazySingleton<NetworkApiServices>(() => NetworkApiServices());
  getIt.registerLazySingleton<IAuthRepo>(() => AuthRepo());
}
