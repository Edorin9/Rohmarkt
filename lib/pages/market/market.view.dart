import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/mvvm/getx_view.dart';
import '../../common/utilities/dimensions.dart';
import '../../widgets/smooth_activity_indicator.dart';
import '_widgets/_widgets.dart';
import 'market.viewmodel.dart';

class MarketView extends StatelessWidget {
  const MarketView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _AppBar(),
      body: const _Body(),
    );
  }
}

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      brightness: Brightness.dark,
      centerTitle: true,
      title: const Text('Rohmarkt'),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _Body extends GetxView<MarketViewModel> {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final _vM = viewModel;
    return Stack(
      children: [
        const _List(),
        Obx(() => SmoothActivityIndicator(shown: _vM.isLoading)),
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
            onTap: () => _vM.marketItemClicked(_vM.items[index]),
            item: _vM.items[index],
          ),
          separatorBuilder: (context, index) => const SizedBox(height: 8),
        ),
      ),
    );
  }
}
