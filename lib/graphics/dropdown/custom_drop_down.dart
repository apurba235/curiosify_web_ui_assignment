import 'package:curiosify_ui_assignment/consts/app_asset_const.dart';
import 'package:flutter/material.dart';

class CustomDropDown<T> extends StatelessWidget {
  const CustomDropDown({
    super.key,
    this.hintWidget,
    this.hintText,
    this.items,
    this.onChanged,
    this.value,
  });

  final Widget? hintWidget;
  final String? hintText;
  final List<DropdownMenuItem<T>>? items;
  final void Function(T?)? onChanged;
  final T? value;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: const InputDecoration(border: InputBorder.none),
      value: value,
      icon: Image.asset(AppAssetConst.arrowDown),
      hint: hintWidget ?? Text(hintText ?? '', maxLines: 1, overflow: TextOverflow.ellipsis),
      items: items,
      onChanged: onChanged,
      isExpanded: true,
      isDense: true,
    );
  }
}
