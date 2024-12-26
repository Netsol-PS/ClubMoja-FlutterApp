import 'package:demo/core/res/routes/routes_name.dart';
import 'package:demo/presentation/screens/login_screen.dart';
import 'package:get/get.dart';
import '../../../presentation/screens/splash_screen.dart';

class AppRoutes {

  static appRoutes() => [
    GetPage(
      name: RouteName.splashScreen,
      page: () => const SplashScreen() ,
      transitionDuration: const Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade ,
    ) ,
    GetPage(
      name: RouteName.loginView,
      page: () => const LoginScreen() ,
      transitionDuration: const Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade ,
    ) ,
    // GetPage(
    //   name: RouteName.homeView,
    //   page: () => HomeView() ,
    //   transitionDuration: Duration(milliseconds: 250),
    //   transition: Transition.leftToRightWithFade ,
    // ) ,
  ];

}