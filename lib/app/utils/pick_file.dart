import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

Future<String?> pickPdf() async {
  try {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);
    if (result != null && result.files.single.path != null) {
      return result.files.single.path!;
    }
  } catch (e) {
    debugPrint(e.toString());
  }
  return null;
}
