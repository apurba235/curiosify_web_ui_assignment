import 'package:curiosify_ui_assignment/consts/app_asset_const.dart';
import 'package:curiosify_ui_assignment/consts/app_color_const.dart';
import 'package:curiosify_ui_assignment/infrastructure/navigation/navigation.dart';
import 'package:curiosify_ui_assignment/presentation/main_frame/controllers/main_frame.controller.dart';
import 'package:flutter/material.dart';
import 'package:reactiv/reactiv.dart';

class MainFrame extends ReactiveStateWidget<MainFrameScreenController> {
  const MainFrame({required this.child, super.key});

  final Widget child;

  @override
  BindController<MainFrameScreenController>? bindController() {
    return BindController(controller: () => MainFrameScreenController(), autoDispose: true);
  }

  @override
  void initStateWithContext(BuildContext context) {
    super.initStateWithContext(context);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: Row(
          children: [
            Container(
              width: 272,
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.all(20.0),
              decoration: const BoxDecoration(
                border: Border(
                  right: BorderSide(color: AppColorConsts.lightGrey),
                ),
              ),
              child: Column(
                children: [
                  Image.asset(AppAssetConst.logo),
                  const SizedBox(height: 20),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ...List.generate(
                            controller.menuItems.length,
                            (index) => InkWell(
                              onTap: () {
                                controller.currentIndex.value = index;
                                Routes.of(context).toLocationMenuShell(controller.menuItems.values.elementAt(index));
                              },
                              child: Observer(
                                  listenable: controller.currentIndex,
                                  listener: (selectedIndex) {
                                    return Container(
                                      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
                                      color: selectedIndex == index
                                          ? AppColorConsts.hoverColor
                                          : AppColorConsts.transparent,
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            controller.menuItems.keys.elementAt(index),
                                            color:
                                                selectedIndex == index ? AppColorConsts.darkAmber : AppColorConsts.grey,
                                          ),
                                          const SizedBox(width: 16),
                                          Text(
                                            controller.menuItems.values.elementAt(index).name,
                                            style: TextStyle(
                                              color: selectedIndex == index
                                                  ? AppColorConsts.darkAmber
                                                  : AppColorConsts.grey,
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  }),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(15.0),
                          decoration: BoxDecoration(
                            color: AppColorConsts.white,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColorConsts.lightGrey.withOpacity(0.5),
                            ),
                          ),
                          child: Image.asset(AppAssetConst.bell, height: 18, width: 18),
                        ),
                        const SizedBox(width: 16.0),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColorConsts.lightGrey),
                              borderRadius: BorderRadius.circular(32)),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(12.0),
                                decoration:
                                    const BoxDecoration(shape: BoxShape.circle, color: AppColorConsts.lightChocolate),
                                child: const Text(
                                  'JH',
                                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                                ),
                              ),
                              const SizedBox(width: 12),
                              const Text(
                                'Jane H',
                                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                              ),
                              const SizedBox(width: 12.0),
                              Image.asset(AppAssetConst.arrowDown)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(color: AppColorConsts.lightGrey),
                        ),
                      ),
                      child: child,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
