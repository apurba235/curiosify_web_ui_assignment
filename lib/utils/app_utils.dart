import 'package:file_picker/file_picker.dart';

class PickFiles {
  PickFiles._();

  static final instance = PickFiles._();

  Future<(List<PlatformFile>?, String)> pickDocument() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      final file = result.files;
      String name = result.files.single.name;
      return (file, name);
    } else {
      return (null, '');
    }
  }
}