import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ClokViewModel extends ChangeNotifier {
  ClokViewModel() : super() {
    updateCurrentTime();
  }

  String currentTime = "";
  String currentDate = "";

  void updateCurrentTime() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      var current = DateTime.now();
      currentTime = DateFormat('HH:mm:ss').format(current);
      currentDate = DateFormat('dd/MM/yyyy').format(current);
      

      notifyListeners();
    });
  }
}