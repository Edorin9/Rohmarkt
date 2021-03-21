import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/mvvm/getx_view.dart';
import '../../common/utilities/dimensions.dart';
import '_widgets/_widgets.dart';
import 'market.viewmodel.dart';

class MarketView extends StatelessWidget {
  const MarketView();

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
          brightness: Brightness.dark,
          centerTitle: true,
          title: const Text('Rohmarkt'),
        );
}

class _Body extends GetxView<MarketViewModel> {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final _vM = viewModel;
    return Stack(
      children: [
        const _List(),
        Obx(() => Loader(isShown: _vM.isLoading)),
      ],
    );
  }
}

class _List extends GetxView<MarketViewModel> {
  const _List();

  @override
  Widget build(BuildContext context) {
    final _vM = viewModel;
    return Obx(
      () => AnimatedOpacity(
        opacity: _vM.isLoading ? 0 : 1,
        duration: 360.milliseconds,
        curve: Curves.easeIn,
        child: ListView.separated(
          padding: gInsets16,
          itemCount: _vM.items.length,
          itemBuilder: (context, index) => MarketItemCard(
            item: _vM.items[index],
            onTap: () => _vM.onItemClicked(_vM.items[index]),
          ),
          separatorBuilder: (context, index) => const SizedBox(height: 8),
        ),
      ),
    );
  }
}
