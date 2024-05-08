part of 'navigation.dart';

class Routes {
  Routes._(this.context);

  factory Routes.of(BuildContext context) => Routes._(context);
  final BuildContext context;

  Map<String, String> get params => GoRouterState.of(context).params;

  void toInitializer() => context.go('/');

  void toLocationMenuShell(MenuShellEnum shellEnum) => context.go('/${shellEnum.name}');

  void toLocationManualResource() => context.go('/${RoutePath.library}/${RoutePath.manualResource}');
}

class RoutePath {
  static const initializer = '/';
  static final home = MenuShellEnum.home.name;
  static final quiz = MenuShellEnum.quiz.name;
  static final library = MenuShellEnum.library.name;
  static final flashCards = MenuShellEnum.flashCards.name;
  static final events = MenuShellEnum.events.name;
  static final createContent = MenuShellEnum.createContent.name;
  static final scanAi = MenuShellEnum.scanAi.name;
  static final studentManagement = MenuShellEnum.studentManagement.name;
  static const manualResource = 'manualResource';
}

enum MenuShellEnum {
  home(AppStringConst.home, AppAssetConst.home),
  quiz(AppStringConst.quiz, AppAssetConst.quiz),
  library(AppStringConst.library, AppAssetConst.library),
  flashCards(AppStringConst.flashCards, AppAssetConst.flashCard),
  events(AppStringConst.events, AppAssetConst.events),
  createContent(AppStringConst.createContent, AppAssetConst.content),
  scanAi(AppStringConst.scanAI, AppAssetConst.scan),
  studentManagement(AppStringConst.studentManagement, AppAssetConst.studentManagement);

  const MenuShellEnum(this.label, this.icon);

  final String label;
  final String icon;
}
