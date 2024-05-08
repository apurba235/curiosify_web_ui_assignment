import 'package:curiosify_ui_assignment/presentation/event_module/controllers/event.controller.dart';
import 'package:flutter/material.dart';
import 'package:reactiv/reactiv.dart';


class EventScreen extends ReactiveStateWidget<EventScreenController> {
  const EventScreen({super.key});

  @override
  BindController<EventScreenController>? bindController() {
    return BindController(controller: () => EventScreenController(), autoDispose: true);
  }

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text('Event Screen')
      ],
    );
  }
}

