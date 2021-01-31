import 'package:flutter/material.dart';

class DetailRow extends StatelessWidget {
  const DetailRow({
    Key key,
    this.label,
    this.detail,
  }) : super(key: key);

  final String label;
  final String detail;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$label: ',
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        ),
        Text(
          detail,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
