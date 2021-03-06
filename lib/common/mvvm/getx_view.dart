import 'package:get/get_state_manager/src/simple/get_view.dart';

abstract class GetxView<T> extends GetView<T> {
  const GetxView();

  T get viewModel => controller;
}
