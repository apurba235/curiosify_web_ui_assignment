import 'package:curiosify_ui_assignment/consts/app_asset_const.dart';
import 'package:curiosify_ui_assignment/consts/app_string_const.dart';
import 'package:curiosify_ui_assignment/presentation/create_content_module/create_content.screen.dart';
import 'package:curiosify_ui_assignment/presentation/event_module/event.screen.dart';
import 'package:curiosify_ui_assignment/presentation/flash_card_module/flash_card.screen.dart';
import 'package:curiosify_ui_assignment/presentation/home_module/home.screen.dart';
import 'package:curiosify_ui_assignment/presentation/initializer/initializer.screen.dart';
import 'package:curiosify_ui_assignment/presentation/library_module/library.screen.dart';
import 'package:curiosify_ui_assignment/presentation/main_frame/main_frame.screen.dart';
import 'package:curiosify_ui_assignment/presentation/manual_resource/manual_resource.screen.dart';
import 'package:curiosify_ui_assignment/presentation/quiz_module/quiz.screen.dart';
import 'package:curiosify_ui_assignment/presentation/route_error/route_error.screen.dart';
import 'package:curiosify_ui_assignment/presentation/scan_ai_module/scan_ai.screen.dart';
import 'package:curiosify_ui_assignment/presentation/student_management_module/student_management.screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'route_param.dart';

part 'routes.dart';

class Nav {
  static final GoRouter goRoutes = GoRouter(
    debugLogDiagnostics: true,
    errorBuilder: (context, state) => RouteErrorScreen(error: state.error),
    routes: [
      TransitionRoute(
        name: RoutePath.initializer,
        path: RoutePath.initializer,
        page: (context, state) => InitializerScreen(state: state),
        routes: [
          ShellRoute(
            builder: (context, state, shellChild) => MainFrame(child: shellChild),
            routes: [
              TransitionRoute(
                name: RoutePath.home,
                path: RoutePath.home,
                page: (context, state) => const HomeScreen(),
              ),
              TransitionRoute(
                name: RoutePath.quiz,
                path: RoutePath.quiz,
                page: (context, state) => const QuizScreen(),
              ),
              TransitionRoute(
                name: RoutePath.library,
                path: RoutePath.library,
                page: (context, state) => const LibraryScreen(),
                routes: [
                  TransitionRoute(
                    name: RoutePath.manualResource,
                    path: RoutePath.manualResource,
                    page: (context, state) => ManualResourceScreen()
                  )
                ]
              ),
              TransitionRoute(
                name: RoutePath.flashCards,
                path: RoutePath.flashCards,
                page: (context, state) => const FlashCardScreen(),
              ),
              TransitionRoute(
                name: RoutePath.events,
                path: RoutePath.events,
                page: (context, state) => const EventScreen(),
              ),
              TransitionRoute(
                name: RoutePath.createContent,
                path: RoutePath.createContent,
                page: (context, state) => const CreateContentScreen(),
              ),
              TransitionRoute(
                name: RoutePath.scanAi,
                path: RoutePath.scanAi,
                page: (context, state) => const ScanAiScreen(),
              ),
              TransitionRoute(
                name: RoutePath.studentManagement,
                path: RoutePath.studentManagement,
                page: (context, state) => const StudentManagementScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

// ignore: non_constant_identifier_names
GoRoute TransitionRoute({
  required String name,
  required Widget Function(BuildContext, GoRouterState)? page,
  String? path,
  bool isShellRouting = false,
  List<RouteBase> routes = const <RouteBase>[],
}) {
  return GoRoute(
    path: name,
    name: path,
    pageBuilder: !isShellRouting
        ? null
        : (context, state) {
            return CustomTransitionPage(
              key: state.pageKey,
              child: page!.call(context, state),
              transitionDuration: const Duration(milliseconds: 50),
              transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c),
            );
          },
    builder: isShellRouting
        ? null
        : (context, state) {
            return page!.call(context, state);
          },
    routes: routes,
  );
}
