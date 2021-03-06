import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:supercharged/supercharged.dart';

class Loader extends StatelessWidget {
  const Loader({
    required this.isShown,
  });

  final bool isShown;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ObxValue<RxBool>(
        (isVisible) => AnimatedOpacity(
          opacity: isShown ? 1 : 0,
          duration: 270.milliseconds,
          curve: Curves.easeIn,
          onEnd: () => isVisible.value = isShown,
          child: Visibility(
            visible: isVisible.value ?? false,
            child: const CircularProgressIndicator(),
          ),
        ),
        (!isShown).obs,
      ),
    );
  }
}
