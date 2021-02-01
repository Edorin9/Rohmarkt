import 'package:get/get_navigation/get_navigation.dart';

import '../modules/details/details.barrel.dart';
import '../modules/market/market.barrel.dart';

part 'routes.dart';

class Pages {
  static final routes = [
    GetPage(
      name: Routes.market,
      page: () => const MarketView(),
      binding: MarketBinding(),
    ),
    GetPage(
      name: Routes.details,
      page: () => const DetailsView(),
      binding: DetailsBinding(),
    ),
  ];
}
