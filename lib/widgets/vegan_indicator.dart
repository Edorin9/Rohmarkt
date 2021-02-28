import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../common/theme/color_schemes.dart';

class VeganIndicator extends StatelessWidget {
  const VeganIndicator({
    Key key,
    @required this.isVegan,
  }) : super(key: key);

  final bool isVegan;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/vegetarian.svg',
      width: 24,
      height: 24,
      color: isVegan ? gLightGreen : Colors.grey,
    );
  }
}
