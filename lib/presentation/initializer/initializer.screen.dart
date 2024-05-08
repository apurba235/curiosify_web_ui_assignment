import 'package:curiosify_ui_assignment/infrastructure/navigation/navigation.dart';
import 'package:curiosify_ui_assignment/presentation/initializer/controllers/initializer.controller.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reactiv/reactiv.dart';

class InitializerScreen extends ReactiveStateWidget<InitializerController> {
  const InitializerScreen({super.key, required this.state});

  @override
  BindController<InitializerController>? bindController() {
    return BindController(controller: () => InitializerController(), autoDispose: true);
  }

  final GoRouterState state;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ///Do any initial screen operation like check user is already logged in or not etc
      ///then decide where to go and go there
      Future.delayed(const Duration(milliseconds: 2000)).then((value) {
        if (state.location == '/') {
          Routes.of(context).toLocationMenuShell(MenuShellEnum.home);
        }
      });
    });

    return const Scaffold(
      body: SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [],
    );
  }
}
