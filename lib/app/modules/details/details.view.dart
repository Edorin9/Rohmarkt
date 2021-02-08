import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
  const _SliverAppHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.transparent,
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
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        background: Container(
          foregroundDecoration: BoxDecoration(
            color: Colors.black.withOpacity(0.63),
          ),
          child: Image.network(
            controller.marketItem.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
      expandedHeight: 180,
    );
  }
}

class _SliverContent extends StatelessWidget {
  const _SliverContent({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(16),
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
  const _DetailSection({
    Key key,
  }) : super(key: key);

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
  const _NutritionSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final marketItem = controller.marketItem;
    return Column(
      children: [
        const Center(
          child: Text(
            'Ernährung',
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        const SizedBox(height: 8),
        NutritionRow(
          label: 'Zucker',
          amount: '${marketItem.sugar}${marketItem.unit}',
        ),
        const SizedBox(height: 3),
        NutritionRow(
          label: 'Kalorien',
          amount: '${marketItem.calories}${marketItem.unit}',
        ),
        const SizedBox(height: 3),
        NutritionRow(
          label: 'Eiweiss',
          amount: '${marketItem.protein}${marketItem.unit}',
        ),
        const SizedBox(height: 3),
        NutritionRow(
          label: 'Kohlenhydrate',
          amount: '${marketItem.carbohydrates}${marketItem.unit}',
        ),
        const SizedBox(height: 3),
        NutritionRow(
          label: 'Fett',
          amount: '${marketItem.fat}${marketItem.unit}',
        ),
        const SizedBox(height: 3),
        NutritionRow(
          label: 'Wasser',
          amount: '${marketItem.water}${marketItem.unit}',
        ),
      ],
    );
  }
}

class _BarcodeView extends GetView<DetailsController> {
  const _BarcodeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      (controller.marketItem.barcode.isNotEmpty)
          ? _Barcode(barcode: controller.marketItem.barcode)
          : const SizedBox();
}

class _Barcode extends StatelessWidget {
  const _Barcode({
    Key key,
    @required this.barcode,
  }) : super(key: key);

  final String barcode;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 2,
        child: BarcodeWidget(
          data: barcode,
          barcode: Barcode.ean13(),
        ),
      ),
    );
  }
}
