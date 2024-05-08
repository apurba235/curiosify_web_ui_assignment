import 'package:curiosify_ui_assignment/presentation/create_content_module/controllers/create_content.controller.dart';
import 'package:curiosify_ui_assignment/presentation/scan_ai_module/controllers/scan_ai.controller.dart';
import 'package:flutter/material.dart';
import 'package:reactiv/reactiv.dart';


class ScanAiScreen extends ReactiveStateWidget<ScanAiScreenController> {
  const ScanAiScreen({super.key});

  @override
  BindController<ScanAiScreenController>? bindController() {
    return BindController(controller: () => ScanAiScreenController(), autoDispose: true);
  }

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text('Scan AI Screen')
      ],
    );
  }
}

