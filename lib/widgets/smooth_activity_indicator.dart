import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:supercharged/supercharged.dart';

class SmoothActivityIndicator extends StatelessWidget {
  const SmoothActivityIndicator({
    required this.shown,
  });

  final bool shown;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ObxValue<RxBool>(
        (isVisible) => AnimatedOpacity(
          opacity: shown ? 1 : 0,
          duration: 270.milliseconds,
          curve: Curves.easeIn,
          onEnd: () => isVisible.value = shown,
          child: Visibility(
            visible: isVisible.value,
            child: const CircularProgressIndicator(),
          ),
        ),
        (!shown).obs,
      ),
    );
  }
}
