import 'package:get/get_navigation/get_navigation.dart';

import '../pages/details/details.binding.dart';
import '../pages/details/details.view.dart';
import '../pages/main/main.binding.dart';
import '../pages/main/main.view.dart';

part 'routes.dart';

// ignore: avoid_classes_with_only_static_members
class Pages {
  static final routes = [
    GetPage(
      name: Routes.main,
      page: () => const MainView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: Routes.details,
      page: () => const DetailsView(),
      binding: DetailsBinding(),
    ),
  ];
}
