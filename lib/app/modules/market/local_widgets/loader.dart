import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromRGBO(0, 0, 0, 0.5),
      ),
      child: const Center(child: CircularProgressIndicator()),
    );
  }
}
