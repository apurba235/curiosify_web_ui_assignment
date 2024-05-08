import 'package:curiosify_ui_assignment/presentation/home_module/controllers/home.controller.dart';
import 'package:flutter/material.dart';
import 'package:reactiv/reactiv.dart';


class HomeScreen extends ReactiveStateWidget<HomeScreenController> {
  const HomeScreen({super.key});

  @override
  BindController<HomeScreenController>? bindController() {
    return BindController(controller: () => HomeScreenController(), autoDispose: true);
  }

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text('Home Screen')
      ],
    );
  }
}

