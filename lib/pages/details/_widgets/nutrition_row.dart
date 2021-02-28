import 'package:flutter/material.dart';

import '../../../common/utilities/dimensions.dart';

class NutritionRow extends StatelessWidget {
  const NutritionRow({
    Key key,
    this.label,
    this.amount,
  }) : super(key: key);

  final String label;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: gBottomInset2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(amount),
        ],
      ),
    );
  }
}
