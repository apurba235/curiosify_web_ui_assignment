import 'package:curiosify_ui_assignment/presentation/quiz_module/controllers/quiz.controller.dart';
import 'package:flutter/material.dart';
import 'package:reactiv/reactiv.dart';


class QuizScreen extends ReactiveStateWidget<QuizScreenController> {
  const QuizScreen({super.key});

  @override
  BindController<QuizScreenController>? bindController() {
    return BindController(controller: () => QuizScreenController(), autoDispose: true);
  }

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text('Quiz Screen')
      ],
    );
  }
}

