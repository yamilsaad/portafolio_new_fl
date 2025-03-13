import 'package:get/get.dart';

import 'package:portafolio_new_fl/src/presentation/pages/home_page.dart';

class AppRoute {
  static List<GetPage> get routes =>
      [GetPage(name: '/', page: () => const HomePage())];
}
