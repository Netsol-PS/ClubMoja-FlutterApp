import 'package:demo/core/res/routes/routes_name.dart';
import 'package:demo/presentation/screens/login_screen.dart';
import 'package:get/get.dart';
import '../../../presentation/screens/account/account.dart';
import '../../../presentation/screens/history/history.dart';
import '../../../presentation/screens/home/home.dart';
import '../../../presentation/screens/splash_screen.dart';

class AppRoutes {

  static appRoutes() => [
    GetPage(name: '/home', page: () => HomeScreen()),
    GetPage(name: '/history', page: () => HistoryScreen()),
    GetPage(name: '/account', page: () => AccountScreen()),
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