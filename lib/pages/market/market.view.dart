import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/mvvm/getx_view.dart';
import '../../common/utilities/dimensions.dart';
import '_widgets/_widgets.dart';
import 'market.viewmodel.dart';

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

class _Body extends GetxView<MarketViewModel> {
  const _Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _ = viewModel;
    return Stack(
      children: [
        const _List(),
        Obx(() => Loader(isShown: _.isLoading)),
      ],
    );
  }
}

class _List extends GetxView<MarketViewModel> {
  const _List({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _ = viewModel;
    return Obx(
      () => AnimatedOpacity(
        opacity: _.isLoading ? 0 : 1,
        duration: 360.milliseconds,
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
