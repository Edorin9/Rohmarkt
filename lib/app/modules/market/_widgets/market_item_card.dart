import 'package:flutter/material.dart';

import '../../../common/utilities/dimensions.dart';
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
      child: _ItemContent(item: item, onTap: onTap),
    );
  }
}

class _ItemContent extends StatelessWidget {
  const _ItemContent({
    Key key,
    @required this.item,
    @required this.onTap,
  }) : super(key: key);

  final MarketItem item;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      width: double.infinity,
      child: Stack(
        children: [
          _BackgroundImage(imageUrl: item.imageUrl),
          const _BackgroundDim(),
          _ForegroundContent(item: item, onTap: onTap),
        ],
      ),
    );
  }
}

class _BackgroundImage extends StatelessWidget {
  const _BackgroundImage({
    Key key,
    @required this.imageUrl,
  }) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: FadeInImage.assetNetwork(
        image: imageUrl,
        placeholder: 'assets/images/loader.gif',
        fit: BoxFit.cover,
      ),
    );
  }
}

class _BackgroundDim extends StatelessWidget {
  const _BackgroundDim({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Container(color: Colors.black.withOpacity(0.63)),
    );
  }
}

class _ForegroundContent extends StatelessWidget {
  const _ForegroundContent({
    Key key,
    @required this.item,
    @required this.onTap,
  }) : super(key: key);

  final MarketItem item;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: gInsets16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _MainTexts(item: item),
                VeganIndicator(isVegan: item.isVegan),
              ],
            ),
          ),
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
    final _textTheme = Theme.of(context).textTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${item.name} ${item.portionInGram}g',
          style: _textTheme.headline5.copyWith(color: Colors.white),
        ),
        const SizedBox(height: 4),
        Text(
          item.category,
          style: _textTheme.caption.copyWith(color: Colors.white),
        ),
      ],
    );
  }
}
