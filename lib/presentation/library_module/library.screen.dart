import 'package:curiosify_ui_assignment/consts/app_asset_const.dart';
import 'package:curiosify_ui_assignment/consts/app_color_const.dart';
import 'package:curiosify_ui_assignment/consts/app_string_const.dart';
import 'package:curiosify_ui_assignment/graphics/buttons/custom_filled_button.dart';
import 'package:curiosify_ui_assignment/infrastructure/navigation/navigation.dart';
import 'package:curiosify_ui_assignment/presentation/library_module/controllers/library.controller.dart';
import 'package:flutter/material.dart';
import 'package:reactiv/reactiv.dart';

class LibraryScreen extends ReactiveStateWidget<LibraryScreenController> {
  const LibraryScreen({super.key});

  @override
  BindController<LibraryScreenController>? bindController() {
    return BindController(controller: () => LibraryScreenController(), autoDispose: true);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Library Screen',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 441),
                  child: TextFormField(
                    onChanged: (v) {},
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(color: AppColorConsts.lightGrey),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(color: AppColorConsts.lightGrey),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(color: AppColorConsts.lightGrey),
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                        prefixIcon: const Icon(Icons.search, color: AppColorConsts.lightGrey, size: 25),
                        hintText: AppStringConst.searchFieldHintText,
                        hintStyle:
                            const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: AppColorConsts.grey)),
                  ),
                ),
              ),
              const SizedBox(width: 5.0),
              Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                    border: Border.all(color: AppColorConsts.lightGrey), borderRadius: BorderRadius.circular(8.0)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      AppStringConst.filterByClass,
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14, color: AppColorConsts.grey),
                    ),
                    const SizedBox(width: 8.0),
                    Image.asset(AppAssetConst.filter, height: 16, width: 16)
                  ],
                ),
              )
            ],
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    AppStringConst.noResourceText,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                  const SizedBox(height: 10.0),
                  CustomFilledButton(
                    onPressed: () => Routes.of(context).toLocationManualResource(),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.add, color: AppColorConsts.white),
                        SizedBox(width: 15),
                        Text(
                          AppStringConst.createAResource,
                          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14, color: AppColorConsts.white),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}