import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'local_widgets/loader.dart';
import 'local_widgets/market_item_card.dart';
import 'market.controller.dart';

class MarketView extends GetView<MarketController> {
  const MarketView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _AppBar(),
      body: Stack(
        children: [
          const _Body(),
          Obx(() => controller.isLoading() ? Loader() : const SizedBox()),
        ],
      ),
    );
  }
}

class _AppBar extends StatelessWidget with PreferredSizeWidget {
  const _AppBar({Key key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.teal,
      title: const Text(
        'Rohmarkt',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}

class _Body extends GetView<MarketController> {
  const _Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlowingOverscrollIndicator(
      axisDirection: AxisDirection.down,
      color: Colors.tealAccent,
      child: Obx(
        () => ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: controller.items.length,
          itemBuilder: (context, index) => MarketItemCard(
            item: controller.items[index],
            onTap: () => controller.onItemClicked(controller.items[index]),
          ),
          separatorBuilder: (context, index) => const SizedBox(height: 8),
        ),
      ),
    );
  }
}
