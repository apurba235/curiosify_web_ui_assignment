import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reactiv/reactiv.dart';

class ManualResourceScreenController extends ReactiveController {

  String title = '';
  String resourceData = '';

  ReactiveBool changeSomething = ReactiveBool(false);
  ReactiveInt selectedFont = ReactiveInt(0);
  ReactiveInt align = ReactiveInt(0);
  ReactiveInt selectedFontSize = ReactiveInt(10);
  ReactiveString fileName = ReactiveString('');
  TextEditingController contentController = TextEditingController();
  List<int> fontSizes = [...List.generate(18, (index) => index + 5)];
  Map<String, TextStyle> availableFontsData = {
    'robotto': GoogleFonts.roboto(),
    'poppins': GoogleFonts.poppins(),
    'aladin': GoogleFonts.aladin(),
  };

  Reactive<TextStyle> selectedStyle = Reactive(GoogleFonts.roboto(fontSize: 15));
  ReactiveDouble fontSize = ReactiveDouble(10);
  ReactiveBool isBold = ReactiveBool(false);
  ReactiveBool isUnderline = ReactiveBool(false);
  ReactiveBool isItalic = ReactiveBool(false);

  void getTextStyle() {
    selectedStyle.value = selectedFont.value == 0
        ? GoogleFonts.roboto(
            fontSize: fontSize.value,
            fontWeight: isBold.value ? FontWeight.bold : FontWeight.normal,
            decoration: isUnderline.value ? TextDecoration.underline : TextDecoration.none,
            fontStyle: isItalic.value ? FontStyle.italic : FontStyle.normal,
          )
        : selectedFont.value == 1
            ? GoogleFonts.poppins(
                fontSize: fontSize.value,
                fontWeight: isBold.value ? FontWeight.bold : FontWeight.normal,
                decoration: isUnderline.value ? TextDecoration.underline : TextDecoration.none,
                fontStyle: isItalic.value ? FontStyle.italic : FontStyle.normal,
              )
            : GoogleFonts.aladin(
                fontSize: fontSize.value,
                fontWeight: isBold.value ? FontWeight.bold : FontWeight.normal,
                decoration: isUnderline.value ? TextDecoration.underline : TextDecoration.none,
                fontStyle: isItalic.value ? FontStyle.italic : FontStyle.normal,
              );
  }
}
