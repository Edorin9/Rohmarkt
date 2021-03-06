import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VeganIndicator extends StatelessWidget {
  const VeganIndicator({
    required this.isVegan,
  });

  final bool isVegan;

  @override
  Widget build(BuildContext context) {
    final _colorScheme = Theme.of(context).colorScheme;
    return SvgPicture.asset(
      'assets/images/vegetarian.svg',
      width: 24,
      height: 24,
      color: isVegan ? _colorScheme.secondary : Colors.grey.shade400,
    );
  }
}
