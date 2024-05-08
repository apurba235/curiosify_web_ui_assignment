import 'package:curiosify_ui_assignment/presentation/student_management_module/controllers/student_management.controller.dart';
import 'package:flutter/material.dart';
import 'package:reactiv/reactiv.dart';


class StudentManagementScreen extends ReactiveStateWidget<StudentManagementScreenController> {
  const StudentManagementScreen({super.key});

  @override
  BindController<StudentManagementScreenController>? bindController() {
    return BindController(controller: () => StudentManagementScreenController(), autoDispose: true);
  }

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text('Student Management Screen')
      ],
    );
  }
}

