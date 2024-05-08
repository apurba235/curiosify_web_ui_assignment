import 'package:curiosify_ui_assignment/presentation/create_content_module/controllers/create_content.controller.dart';
import 'package:flutter/material.dart';
import 'package:reactiv/reactiv.dart';


class CreateContentScreen extends ReactiveStateWidget<CreateContentScreenController> {
  const CreateContentScreen({super.key});

  @override
  BindController<CreateContentScreenController>? bindController() {
    return BindController(controller: () => CreateContentScreenController(), autoDispose: true);
  }

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text('Create Content With Curio AI Screen')
      ],
    );
  }
}

