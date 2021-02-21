import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rohmarkt/app/common/utilities/dimensions.dart';

import 'local_widgets/loader.dart';
import 'local_widgets/market_item_card.dart';
import 'market.controller.dart';

class MarketView extends GetView<MarketController> {
  const MarketView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _ = controller;
    return Scaffold(
      appBar: _AppBar(),
      body: Stack(
        children: [
          const _Body(),
          Obx(() => _.isLoading ? const Loader() : const SizedBox()),
        ],
      ),
    );
  }
}

class _AppBar extends AppBar {
  _AppBar()
      : super(
          centerTitle: true,
          title: const Text('Rohmarkt'),
        );
}

class _Body extends GetView<MarketController> {
  const _Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _ = controller;
    return Obx(
      () => AnimatedOpacity(
        opacity: _.isLoading ? 0 : 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
        child: ListView.separated(
          padding: gInsets16,
          itemCount: _.items.length,
          itemBuilder: (context, index) => MarketItemCard(
            item: _.items[index],
            onTap: () => _.onItemClicked(_.items[index]),
          ),
          separatorBuilder: (context, index) => const SizedBox(height: 8),
        ),
      ),
    );
  }
}
