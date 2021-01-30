import 'package:flutter/material.dart';

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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16),
        ),
        Text(
          amount,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
