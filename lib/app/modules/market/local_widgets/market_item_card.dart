import 'package:flutter/material.dart';

import '../../../data/models/market_item.dart';
import '../../../widgets/vegan_indicator.dart';

class MarketItemCard extends StatelessWidget {
  const MarketItemCard({
    Key key,
    this.item,
    this.onTap,
  }) : super(key: key);

  final MarketItem item;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Stack(
          children: [
            SizedBox(
              height: 90,
              width: double.infinity,
              child: FadeInImage.assetNetwork(
                image: item.imageUrl,
                placeholder: 'assets/images/loader.gif',
                fit: BoxFit.cover,
              ),
            ),
            _ItemContent(item: item),
          ],
        ),
      ),
    );
  }
}

class _ItemContent extends StatelessWidget {
  const _ItemContent({
    Key key,
    @required this.item,
  }) : super(key: key);

  final MarketItem item;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      top: 0,
      right: 0,
      bottom: 0,
      child: Container(
        padding: const EdgeInsets.all(16),
        color: Colors.black.withOpacity(0.63),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _MainTexts(item: item),
            VeganIndicator(isVegan: item.isVegan),
          ],
        ),
      ),
    );
  }
}

class _MainTexts extends StatelessWidget {
  const _MainTexts({
    Key key,
    @required this.item,
  }) : super(key: key);

  final MarketItem item;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${item.name} ${item.portionInGram}g',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          item.category,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    );
  }
}
