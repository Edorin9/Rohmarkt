import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/mvvm/getx_view.dart';
import '../../common/utilities/dimensions.dart';
import '../../widgets/vegan_indicator.dart';
import '_widgets/_widgets.dart';
import 'detail.viewmodel.dart';

class DetailView extends GetxView<DetailViewModel> {
  const DetailView();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          _SliverAppHeader(),
          _SliverContent(),
        ],
      ),
    );
  }
}

class _SliverAppHeader extends GetxView<DetailViewModel> {
  const _SliverAppHeader();

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    final _vM = viewModel;
    return SliverAppBar(
      brightness: Brightness.dark,
      floating: true,
      pinned: true,
      snap: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: gInsets16,
        title: FittedBox(
          child: Row(
            children: [
              VeganIndicator(_vM.marketItem.isVegan ?? false),
              const SizedBox(width: 8),
              Text(
                '${_vM.marketItem.name} ${_vM.marketItem.portionInGram}g',
                style: _textTheme.headline5?.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
        background: Container(
          foregroundDecoration: BoxDecoration(
            color: Colors.black.withOpacity(0.63),
          ),
          child: FadeInImage.assetNetwork(
            image: _vM.marketItem.imageUrl ?? gFallbackImage,
            placeholder: 'assets/images/loader.gif',
            fit: BoxFit.cover,
          ),
        ),
      ),
      expandedHeight: 180,
    );
  }
}

const gFallbackImage =
    'https://img.etimg.com/thumb/msid-75176755,width-640,resizemode-4,imgsize-612672/effect-of-coronavirus-on-food.jpg';

class _SliverContent extends StatelessWidget {
  const _SliverContent();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: gInsets16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            _DetailSection(),
            _NutritionSection(),
            SizedBox(height: 16),
            _BarcodeView(),
          ],
        ),
      ),
    );
  }
}

class _DetailSection extends GetxView<DetailViewModel> {
  const _DetailSection();

  @override
  Widget build(BuildContext context) {
    final _vM = viewModel;
    return Column(
      children: [
        DetailRow(
          label: 'Hersteller',
          detail: _vM.marketItem.manufacturer,
        ),
        DetailRow(
          label: 'Kategorie',
          detail: _vM.marketItem.category,
        ),
        DetailRow(
          label: 'Vegan',
          detail: _vM.marketItem.isVegan == true ? 'Ja' : 'Nein',
        ),
      ],
    );
  }
}

class _NutritionSection extends GetxView<DetailViewModel> {
  const _NutritionSection();

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    final _vM = viewModel;
    return Column(
      children: [
        Center(
          child: Text(
            'Ernährung',
            style: _textTheme.headline6,
          ),
        ),
        const SizedBox(height: 8),
        NutritionRow(
          label: 'Zucker',
          amount: '${_vM.marketItem.sugar}${_vM.marketItem.unit}',
        ),
        const SizedBox(height: 3),
        NutritionRow(
          label: 'Kalorien',
          amount: '${_vM.marketItem.calories}${_vM.marketItem.unit}',
        ),
        const SizedBox(height: 3),
        NutritionRow(
          label: 'Eiweiss',
          amount: '${_vM.marketItem.protein}${_vM.marketItem.unit}',
        ),
        const SizedBox(height: 3),
        NutritionRow(
          label: 'Kohlenhydrate',
          amount: '${_vM.marketItem.carbohydrates}${_vM.marketItem.unit}',
        ),
        const SizedBox(height: 3),
        NutritionRow(
          label: 'Fett',
          amount: '${_vM.marketItem.fat}${_vM.marketItem.unit}',
        ),
        const SizedBox(height: 3),
        NutritionRow(
          label: 'Wasser',
          amount: '${_vM.marketItem.water}${_vM.marketItem.unit}',
        ),
      ],
    );
  }
}

class _BarcodeView extends GetxView<DetailViewModel> {
  const _BarcodeView();

  @override
  Widget build(BuildContext context) {
    final _vM = viewModel;
    return (_vM.marketItem.barcode?.isEmpty == false)
        ? Column(
            children: [
              _Barcode(_vM.marketItem.barcode ?? ''),
              SizedBox(height: Get.height / 2),
            ],
          )
        : SizedBox(height: Get.height / 2);
  }
}

class _Barcode extends StatelessWidget {
  const _Barcode(this.barcode);

  final String barcode;

  @override
  Widget build(BuildContext context) {
    final _colorScheme = Theme.of(context).colorScheme;
    return Center(
      child: SizedBox(
        width: Get.width / 2,
        child: BarcodeWidget(
          data: barcode,
          barcode: Barcode.ean13(),
          color: _colorScheme.onBackground,
        ),
      ),
    );
  }
}
