import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/utilities/dimensions.dart';
import '../../widgets/vegan_indicator.dart';
import '_widgets/_widgets.dart';
import 'details.controller.dart';

class DetailsView extends GetView<DetailsController> {
  const DetailsView({Key key}) : super(key: key);

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

class _SliverAppHeader extends GetView<DetailsController> {
  const _SliverAppHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    final _ = controller;
    return SliverAppBar(
      brightness: Brightness.dark,
      backgroundColor: Colors.transparent,
      floating: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Row(
          children: [
            const SizedBox(width: 16),
            VeganIndicator(isVegan: _.marketItem.isVegan),
            const SizedBox(width: 8),
            Text(
              '${_.marketItem.name} ${_.marketItem.portionInGram}g',
              style: _textTheme.headline5.copyWith(color: Colors.white),
            ),
          ],
        ),
        background: Container(
          foregroundDecoration: BoxDecoration(
            color: Colors.black.withOpacity(0.63),
          ),
          child: FadeInImage.assetNetwork(
            image: _.marketItem.imageUrl,
            placeholder: 'assets/images/loader.gif',
            fit: BoxFit.cover,
          ),
        ),
      ),
      expandedHeight: 180,
    );
  }
}

class _SliverContent extends StatelessWidget {
  const _SliverContent({Key key}) : super(key: key);

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
            _BarcodeView()
          ],
        ),
      ),
    );
  }
}

class _DetailSection extends GetView<DetailsController> {
  const _DetailSection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _ = controller;
    return Column(
      children: [
        DetailRow(
          label: 'Hersteller',
          detail: _.marketItem.manufacturer,
        ),
        DetailRow(
          label: 'Kategorie',
          detail: _.marketItem.category,
        ),
        DetailRow(
          label: 'Vegan',
          detail: _.marketItem.isVegan ? 'Ja' : 'Nein',
        ),
      ],
    );
  }
}

class _NutritionSection extends GetView<DetailsController> {
  const _NutritionSection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    final _ = controller;
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
          amount: '${_.marketItem.sugar}${_.marketItem.unit}',
        ),
        const SizedBox(height: 3),
        NutritionRow(
          label: 'Kalorien',
          amount: '${_.marketItem.calories}${_.marketItem.unit}',
        ),
        const SizedBox(height: 3),
        NutritionRow(
          label: 'Eiweiss',
          amount: '${_.marketItem.protein}${_.marketItem.unit}',
        ),
        const SizedBox(height: 3),
        NutritionRow(
          label: 'Kohlenhydrate',
          amount: '${_.marketItem.carbohydrates}${_.marketItem.unit}',
        ),
        const SizedBox(height: 3),
        NutritionRow(
          label: 'Fett',
          amount: '${_.marketItem.fat}${_.marketItem.unit}',
        ),
        const SizedBox(height: 3),
        NutritionRow(
          label: 'Wasser',
          amount: '${_.marketItem.water}${_.marketItem.unit}',
        ),
      ],
    );
  }
}

class _BarcodeView extends GetView<DetailsController> {
  const _BarcodeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _ = controller;
    return (_.marketItem.barcode.isNotEmpty)
        ? _Barcode(_.marketItem.barcode)
        : const SizedBox();
  }
}

class _Barcode extends StatelessWidget {
  const _Barcode([this.barcode, Key key]) : super(key: key);

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
