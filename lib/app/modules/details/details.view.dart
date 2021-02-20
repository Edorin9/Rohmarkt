import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rohmarkt/app/common/utilities/dimensions.dart';

import '../../widgets/vegan_indicator.dart';
import 'details.controller.dart';
import 'local_widgets/detail_row.dart';
import 'local_widgets/nutrition_row.dart';

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
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      elevation: 4,
      forceElevated: true,
      floating: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Row(
          children: [
            const SizedBox(width: 16),
            VeganIndicator(isVegan: controller.marketItem.isVegan),
            const SizedBox(width: 8),
            Text(
              '${controller.marketItem.name} ${controller.marketItem.portionInGram}g',
              style: _textTheme.headline5.copyWith(
                color: Colors.white,
              ),
            ),
          ],
        ),
        background: Container(
          foregroundDecoration: BoxDecoration(
            color: Colors.black.withOpacity(0.63),
          ),
          child: FadeInImage.assetNetwork(
            image: controller.marketItem.imageUrl,
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
    final marketItem = controller.marketItem;
    return Column(
      children: [
        DetailRow(
          label: 'Hersteller',
          detail: marketItem.manufacturer,
        ),
        const SizedBox(height: 16),
        DetailRow(
          label: 'Kategorie',
          detail: marketItem.category,
        ),
        const SizedBox(height: 16),
        DetailRow(
          label: 'Vegan',
          detail: marketItem.isVegan ? 'Ja' : 'Nein',
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

class _NutritionSection extends GetView<DetailsController> {
  const _NutritionSection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    final _marketItem = controller.marketItem;
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
          amount: '${_marketItem.sugar}${_marketItem.unit}',
        ),
        const SizedBox(height: 3),
        NutritionRow(
          label: 'Kalorien',
          amount: '${_marketItem.calories}${_marketItem.unit}',
        ),
        const SizedBox(height: 3),
        NutritionRow(
          label: 'Eiweiss',
          amount: '${_marketItem.protein}${_marketItem.unit}',
        ),
        const SizedBox(height: 3),
        NutritionRow(
          label: 'Kohlenhydrate',
          amount: '${_marketItem.carbohydrates}${_marketItem.unit}',
        ),
        const SizedBox(height: 3),
        NutritionRow(
          label: 'Fett',
          amount: '${_marketItem.fat}${_marketItem.unit}',
        ),
        const SizedBox(height: 3),
        NutritionRow(
          label: 'Wasser',
          amount: '${_marketItem.water}${_marketItem.unit}',
        ),
      ],
    );
  }
}

class _BarcodeView extends GetView<DetailsController> {
  const _BarcodeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final barcode = controller.marketItem.barcode;
    return (barcode.isNotEmpty) ? _Barcode(barcode) : const SizedBox();
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
