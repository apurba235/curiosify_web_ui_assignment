import 'package:curiosify_ui_assignment/consts/app_asset_const.dart';
import 'package:curiosify_ui_assignment/consts/app_color_const.dart';
import 'package:curiosify_ui_assignment/consts/app_string_const.dart';
import 'package:curiosify_ui_assignment/graphics/buttons/custom_filled_button.dart';
import 'package:curiosify_ui_assignment/graphics/buttons/custom_outlined_button.dart';
import 'package:curiosify_ui_assignment/graphics/dropdown/custom_drop_down.dart';
import 'package:curiosify_ui_assignment/presentation/manual_resource/controller/manual_resource.controller.dart';
import 'package:flutter/material.dart';
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
                            onChanged: (v) {},
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
                              onPressed: () {},
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
                        Image.asset(AppAssetConst.refresh),
                        const SizedBox(width: 10),
                        Container(height: 30, width: 1, color: AppColorConsts.lightGrey),
                        const SizedBox(width: 10),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(AppAssetConst.text),
                            const SizedBox(width: 8),
                            SizedBox(
                              width: 60,
                              child: CustomDropDown(
                                onChanged: (v) {},
                                hintText: 'Arial',
                                items: const [
                                  DropdownMenuItem(
                                    value: 0,
                                    child: Text('Arial'),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(width: 10),
                        Container(height: 30, width: 1, color: AppColorConsts.lightGrey),
                        const SizedBox(width: 10),
                        SizedBox(
                          width: 60,
                          child: CustomDropDown(
                            onChanged: (v) {},
                            hintText: '16px',
                            items: const [
                              DropdownMenuItem(
                                value: 0,
                                child: Text('16px'),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(height: 30, width: 1, color: AppColorConsts.lightGrey),
                        const SizedBox(width: 15),
                        InkWell(
                          onTap: () {},
                          child: Image.asset(AppAssetConst.bold),
                        ),
                        const SizedBox(width: 15),
                        InkWell(
                          onTap: () {},
                          child: Image.asset(AppAssetConst.underline),
                        ),
                        const SizedBox(width: 15),
                        InkWell(
                          onTap: () {},
                          child: Image.asset(AppAssetConst.italic),
                        ),
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
                          child: CustomDropDown(
                            onChanged: (v) {},
                            hintText: 'Left Align',
                            items: const [
                              DropdownMenuItem(
                                value: 0,
                                child: Text('Left Align'),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        Container(height: 30, width: 1, color: AppColorConsts.lightGrey),
                        const SizedBox(width: 12),
                        const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.add, color: AppColorConsts.lightGrey, size: 25),
                            SizedBox(width: 8),
                            Text(
                              AppStringConst.insert,
                              style: TextStyle(color: AppColorConsts.grey, fontSize: 20),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const Divider(color: AppColorConsts.mediumGrey),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: TextFormField(
                        onChanged: (v) {},
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: AppStringConst.hint,
                          hintStyle:
                              TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: AppColorConsts.mediumGrey),
                        ),
                      ),
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
