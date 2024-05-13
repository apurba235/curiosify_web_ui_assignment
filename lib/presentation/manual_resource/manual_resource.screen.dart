import 'package:curiosify_ui_assignment/consts/app_asset_const.dart';
import 'package:curiosify_ui_assignment/consts/app_color_const.dart';
import 'package:curiosify_ui_assignment/consts/app_string_const.dart';
import 'package:curiosify_ui_assignment/data/resource_model.dart';
import 'package:curiosify_ui_assignment/graphics/buttons/custom_filled_button.dart';
import 'package:curiosify_ui_assignment/graphics/buttons/custom_outlined_button.dart';
import 'package:curiosify_ui_assignment/graphics/dropdown/custom_drop_down.dart';
import 'package:curiosify_ui_assignment/presentation/manual_resource/controller/manual_resource.controller.dart';
import 'package:curiosify_ui_assignment/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reactiv/reactiv.dart';

class ManualResourceScreen extends ReactiveStateWidget<ManualResourceScreenController> {
  const ManualResourceScreen({super.key});

  @override
  BindController<ManualResourceScreenController>? bindController() {
    return BindController(controller: () => ManualResourceScreenController(), autoDispose: true);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                AppStringConst.manualResource,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomFilledButton(
                    onPressed: () {},
                    child: const Text(
                      AppStringConst.askAi,
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14, color: AppColorConsts.white),
                    ),
                  ),
                  const SizedBox(width: 16),
                  CustomFilledButton(
                    onPressed: () {},
                    child: const Text(
                      AppStringConst.upload,
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14, color: AppColorConsts.white),
                    ),
                  )
                ],
              )
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0), color: AppColorConsts.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16, left: 24, right: 55),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            onChanged: (v) {
                              controller.title = v;
                            },
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: AppStringConst.enterNoteTitle,
                                hintStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomOutlinedButton(
                              onPressed: () {},
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text(
                                    AppStringConst.share,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500, fontSize: 14, color: AppColorConsts.black),
                                  ),
                                  const SizedBox(width: 8),
                                  Image.asset(AppAssetConst.share),
                                ],
                              ),
                            ),
                            const SizedBox(width: 15),
                            CustomFilledButton(
                              onPressed: () async {
                                if (controller.title.isEmpty) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(content: Text('Please Write title first')));
                                  await Future.delayed(const Duration(seconds: 2),
                                      () => ScaffoldMessenger.of(context).removeCurrentSnackBar());
                                } else if (controller.resourceData.isEmpty) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(content: Text('Please Write some data')));
                                  await Future.delayed(const Duration(seconds: 2),
                                      () => ScaffoldMessenger.of(context).removeCurrentSnackBar());
                                } else if (controller.title.isNotEmpty && controller.resourceData.isNotEmpty) {
                                  ResourceData.data
                                      .add(ResourceModel(title: controller.title, details: controller.resourceData));
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(content: Text('Data Added Successfully')));
                                  await Future.delayed(const Duration(seconds: 2),
                                          () => ScaffoldMessenger.of(context).removeCurrentSnackBar());
                                  context.pop();
                                }
                              },
                              child: const Text(
                                AppStringConst.save,
                                style:
                                    TextStyle(fontWeight: FontWeight.w500, fontSize: 14, color: AppColorConsts.white),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const Divider(color: AppColorConsts.mediumGrey),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            controller.contentController.clear();
                          },
                          child: Image.asset(AppAssetConst.refresh),
                        ),
                        const SizedBox(width: 10),
                        Container(height: 30, width: 1, color: AppColorConsts.lightGrey),
                        const SizedBox(width: 10),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(AppAssetConst.text),
                            const SizedBox(width: 8),
                            Observer(
                                listenable: controller.selectedFont,
                                listener: (selectedFont) {
                                  return SizedBox(
                                    width: 80,
                                    child: CustomDropDown(
                                      onChanged: (v) {
                                        controller.selectedFont.value = v ?? 0;
                                        controller.getTextStyle();
                                      },
                                      hintText: 'Arial',
                                      value: selectedFont,
                                      items: [
                                        ...List.generate(
                                          controller.availableFontsData.length,
                                          (index) => DropdownMenuItem(
                                            value: index,
                                            child: Text(controller.availableFontsData.keys.elementAt(index)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                })
                          ],
                        ),
                        const SizedBox(width: 10),
                        Container(height: 30, width: 1, color: AppColorConsts.lightGrey),
                        const SizedBox(width: 10),
                        SizedBox(
                          width: 60,
                          child: Observer(
                              listenable: controller.selectedFontSize,
                              listener: (fontSize) {
                                return CustomDropDown(
                                  onChanged: (v) {
                                    controller.selectedFontSize.value = v ?? 10;
                                    controller.fontSize.value = (v ?? 10).toDouble();
                                    controller.getTextStyle();
                                  },
                                  value: fontSize,
                                  hintText: '10px',
                                  items: [
                                    ...List.generate(
                                      controller.fontSizes.length,
                                      (index) => DropdownMenuItem(
                                        value: controller.fontSizes[index],
                                        child: Text('${controller.fontSizes[index]}px'),
                                      ),
                                    ),
                                  ],
                                );
                              }),
                        ),
                        const SizedBox(width: 10),
                        Container(height: 30, width: 1, color: AppColorConsts.lightGrey),
                        const SizedBox(width: 15),
                        Observer(
                            listenable: controller.isBold,
                            listener: (bold) {
                              return Container(
                                color: bold ? AppColorConsts.hoverColor : AppColorConsts.transparent,
                                child: InkWell(
                                  onTap: () {
                                    controller.isBold.value = !controller.isBold.value;
                                    controller.getTextStyle();
                                  },
                                  child: Image.asset(AppAssetConst.bold),
                                ),
                              );
                            }),
                        const SizedBox(width: 15),
                        Observer(
                            listenable: controller.isUnderline,
                            listener: (underline) {
                              return Container(
                                color: underline ? AppColorConsts.hoverColor : AppColorConsts.transparent,
                                child: InkWell(
                                  onTap: () {
                                    controller.isUnderline.value = !controller.isUnderline.value;
                                    controller.getTextStyle();
                                  },
                                  child: Image.asset(AppAssetConst.underline),
                                ),
                              );
                            }),
                        const SizedBox(width: 15),
                        Observer(
                            listenable: controller.isItalic,
                            listener: (italic) {
                              return Container(
                                color: italic ? AppColorConsts.hoverColor : AppColorConsts.transparent,
                                child: InkWell(
                                  onTap: () {
                                    controller.isItalic.value = !controller.isItalic.value;
                                    controller.getTextStyle();
                                  },
                                  child: Image.asset(AppAssetConst.italic),
                                ),
                              );
                            }),
                        const SizedBox(width: 15),
                        Container(height: 30, width: 1, color: AppColorConsts.lightGrey),
                        const SizedBox(width: 12),
                        InkWell(
                          onTap: () {},
                          child: Image.asset(AppAssetConst.bullets),
                        ),
                        const SizedBox(width: 12),
                        InkWell(
                          onTap: () {},
                          child: Image.asset(AppAssetConst.align),
                        ),
                        const SizedBox(width: 12),
                        SizedBox(
                          width: 90,
                          child: Observer(
                              listenable: controller.align,
                              listener: (align) {
                                return CustomDropDown(
                                  onChanged: (v) {
                                    controller.align.value = v ?? 0;
                                  },
                                  hintText: 'Left Align',
                                  value: align,
                                  items: const [
                                    DropdownMenuItem(
                                      value: 0,
                                      child: Text('Left Align'),
                                    ),
                                    DropdownMenuItem(
                                      value: 1,
                                      child: Text('Center'),
                                    ),
                                    DropdownMenuItem(
                                      value: 2,
                                      child: Text('Right Align'),
                                    )
                                  ],
                                );
                              }),
                        ),
                        const SizedBox(width: 12),
                        Container(height: 30, width: 1, color: AppColorConsts.lightGrey),
                        const SizedBox(width: 12),
                        InkWell(
                          onTap: () async {
                            final (file, name) = await PickFiles.instance.pickDocument();
                            controller.fileName.value = name;
                          },
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.add, color: AppColorConsts.grey, size: 25),
                              SizedBox(width: 8),
                              Text(
                                AppStringConst.insert,
                                style: TextStyle(color: AppColorConsts.grey, fontSize: 20),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const Divider(color: AppColorConsts.mediumGrey),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Observer3(
                          listenable: controller.selectedStyle,
                          listenable2: controller.align,
                          listenable3: controller.fileName,
                          listener: (selectedStyle, align, fileName) {
                            return Column(
                              children: [
                                if (fileName.isNotEmpty) Text(fileName),
                                Expanded(
                                  child: TextFormField(
                                    onChanged: (v) {
                                      controller.resourceData = v;
                                    },
                                    controller: controller.contentController,
                                    minLines: 1,
                                    maxLines: 5,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: AppStringConst.hint,
                                      hintStyle: TextStyle(
                                          fontSize: 16, fontWeight: FontWeight.w400, color: AppColorConsts.mediumGrey),
                                    ),
                                    style: selectedStyle,
                                    textAlign: align == 0
                                        ? TextAlign.left
                                        : align == 1
                                            ? TextAlign.center
                                            : align == 2
                                                ? TextAlign.right
                                                : TextAlign.justify,
                                  ),
                                ),
                              ],
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
    );
  }
}
