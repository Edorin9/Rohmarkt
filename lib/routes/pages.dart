import 'package:get/get_navigation/get_navigation.dart';

import '../pages/detail/detail.barrel.dart';
import '../pages/market/market.barrel.dart';

part 'routes.dart';

class Pages {
  static final routes = [
    ..._main,
  ];

  // + Main

  static final List<GetPage> _main = [
    GetPage(
      name: Routes.market, // Market
      page: () => const MarketView(),
      binding: MarketBinding(),
    ),
    GetPage(
      name: Routes.detail, // Detail
      page: () => const DetailView(),
      binding: DetailBinding(),
    ),
  ];
}
