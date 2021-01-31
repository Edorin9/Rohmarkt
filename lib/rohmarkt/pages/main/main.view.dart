import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'main.controller.dart';
import 'widgets/loader.dart';
import 'widgets/market_item_card.dart';

class MainView extends GetView<MainController> {
  const MainView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(
          'Rohmarkt',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Stack(
        children: [
          const _Body(),
          Obx(() => controller.isLoading.value ? Loader() : const SizedBox()),
        ],
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      builder: (_) {
        final marketItems = _.items;
        return GlowingOverscrollIndicator(
          axisDirection: AxisDirection.down,
          color: Colors.tealAccent,
          child: ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: marketItems.length,
            itemBuilder: (context, index) => MarketItemCard(
              item: marketItems[index],
              onTap: () => _.onItemClicked(marketItems[index]),
            ),
            separatorBuilder: (context, index) => const SizedBox(height: 8),
          ),
        );
      },
    );
  }
}
