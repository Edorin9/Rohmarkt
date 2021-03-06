import 'package:get/get_navigation/get_navigation.dart';

import '../pages/details/details.barrel.dart';
import '../pages/market/market.barrel.dart';

part 'routes.dart';

class Pages {
  static final routes = [
    // + Market
    GetPage(
      name: Routes.market,
      page: () => const MarketView(),
      binding: MarketBinding(),
    ),
    // + Details
    GetPage(
      name: Routes.details,
      page: () => const DetailsView(),
      binding: DetailsBinding(),
    ),
  ];
}
