import 'package:radin/modules/home/home.dart';
import 'package:radin/modules/modules.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
        name: Routes.HOME,
        page: () => HomeScreen(),
        binding: HomeBinding(),
      children: [
        // GetPage(name: '/Profile', page:()=> const ProfileTab(),binding: ProfileBinding())
      ]
       ),
  ];
}
