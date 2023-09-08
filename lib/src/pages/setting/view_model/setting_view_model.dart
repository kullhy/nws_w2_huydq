import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class SettingViewModel extends ChangeNotifier {
  File? photo;

  Future<void> changeBackground() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      photo = File(result.files.single.path!);
      notifyListeners();
    } else {
      log("ncncnc");
    }
  }
}
