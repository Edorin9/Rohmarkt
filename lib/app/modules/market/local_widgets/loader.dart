import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.black45),
      child: const Center(child: CircularProgressIndicator()),
    );
  }
}
