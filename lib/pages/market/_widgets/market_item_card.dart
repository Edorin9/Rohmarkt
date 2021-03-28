import 'package:flutter/material.dart';

import '../../../common/utilities/dimensions.dart';
import '../../../data/models/market_item.dart';
import '../../../widgets/vegan_indicator.dart';

class MarketItemCard extends StatelessWidget {
  const MarketItemCard({
    required this.item,
    required this.onTap,
  });

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
    required this.item,
    required this.onTap,
  });

  final MarketItem item;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      width: double.infinity,
      child: Stack(
        children: [
          _BackgroundImage(imageUrl: item.imageUrl ?? gFallbackImage),
          const _BackgroundDim(),
          _ForegroundContent(item: item, onTap: onTap),
        ],
      ),
    );
  }
}

const gFallbackImage =
    'https://img.etimg.com/thumb/msid-75176755,width-640,resizemode-4,imgsize-612672/effect-of-coronavirus-on-food.jpg';

class _BackgroundImage extends StatelessWidget {
  const _BackgroundImage({
    required this.imageUrl,
  });

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
  const _BackgroundDim();

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Container(color: Colors.black.withOpacity(0.63)),
    );
  }
}

class _ForegroundContent extends StatelessWidget {
  const _ForegroundContent({
    required this.item,
    required this.onTap,
  });

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
                VeganIndicator(item.isVegan ?? false),
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
    required this.item,
  });

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
          style: _textTheme.headline5?.copyWith(color: Colors.white),
        ),
        const SizedBox(height: 4),
        Text(
          item.category ?? 'N/A',
          style: _textTheme.caption?.copyWith(color: Colors.white),
        ),
      ],
    );
  }
}
