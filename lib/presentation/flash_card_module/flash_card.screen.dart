import 'package:curiosify_ui_assignment/presentation/flash_card_module/controllers/flash_card.controller.dart';
import 'package:flutter/material.dart';
import 'package:reactiv/reactiv.dart';


class FlashCardScreen extends ReactiveStateWidget<FlashCardScreenController> {
  const FlashCardScreen({super.key});

  @override
  BindController<FlashCardScreenController>? bindController() {
    return BindController(controller: () => FlashCardScreenController(), autoDispose: true);
  }

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text('FlashCard Screen')
      ],
    );
  }
}

