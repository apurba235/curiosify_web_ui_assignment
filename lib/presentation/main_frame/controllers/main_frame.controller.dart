import 'package:curiosify_ui_assignment/consts/app_asset_const.dart';
import 'package:curiosify_ui_assignment/infrastructure/navigation/navigation.dart';
import 'package:reactiv/controllers/reactive_controller.dart';
import 'package:reactiv/state_management/reactive_types.dart';

class MainFrameScreenController extends ReactiveController {
  ReactiveInt currentIndex = ReactiveInt(0);
  Map<String, MenuShellEnum> menuItems = {
    AppAssetConst.home: MenuShellEnum.home,
    AppAssetConst.quiz: MenuShellEnum.quiz,
    AppAssetConst.library: MenuShellEnum.library,
    AppAssetConst.flashCard: MenuShellEnum.flashCards,
    AppAssetConst.events: MenuShellEnum.events,
    AppAssetConst.content: MenuShellEnum.createContent,
    AppAssetConst.scan: MenuShellEnum.scanAi,
    AppAssetConst.studentManagement: MenuShellEnum.studentManagement,
  };
}
