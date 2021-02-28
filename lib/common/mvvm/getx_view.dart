import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

abstract class GetxView<T> extends GetView<T> {
  const GetxView({Key key}) : super(key: key);

  T get viewModel => controller;
}
