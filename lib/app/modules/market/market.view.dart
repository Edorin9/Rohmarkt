import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/utilities/dimensions.dart';
import '_widgets/_widgets.dart';
import 'market.controller.dart';

class MarketView extends StatelessWidget {
  const MarketView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _AppBar(),
      body: const _Body(),
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
  const _Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _ = controller;
    return Stack(
      children: [
        const _List(),
        Obx(() => _.isLoading ? const Loader() : const SizedBox()),
      ],
    );
  }
}

class _List extends GetView<MarketController> {
  const _List({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _ = controller;
    return Obx(
      () => AnimatedOpacity(
        opacity: _.isLoading ? 0 : 1,
        duration: const Duration(milliseconds: 450),
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
