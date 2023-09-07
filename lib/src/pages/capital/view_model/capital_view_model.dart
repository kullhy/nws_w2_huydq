import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CapitalViewModel extends ChangeNotifier {
  CapitalViewModel() : super() {
    updateCurrentTime();
  }

  Map<String, String> capital = {
    "HaNoi": "",
    "NewYork": "",
    "HongKong": "",
    "LonDon": "",
    "Berlin": "",
    "Tokyo": "",
    "Moscow": ""
  };

  void updateCurrentTime() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      var current = DateTime.now();
      String currentTime = DateFormat('HH:mm:ss').format(current);
      // currentDate = DateFormat('dd/MM/yyyy').format(current);
      capital["HaNoi"] = currentTime;
      capital["NewYork"] = DateFormat('HH:mm:ss')
          .format(current.subtract(const Duration(hours: 11)));
      capital["HongKong"] =
          DateFormat('HH:mm:ss').format(current.add(const Duration(hours: 1)));
      capital["LonDon"] = DateFormat('HH:mm:ss')
          .format(current.subtract(const Duration(hours: 6)));
      capital["Berlin"] =
          DateFormat('HH:mm:ss').format(current.add(const Duration(hours: 2)));
      capital["Tokyo"] = DateFormat('HH:mm:ss')
          .format(current.subtract(const Duration(hours: 11)));
      capital["Moscow"] = DateFormat('HH:mm:ss')
          .format(current.subtract(const Duration(hours: 4)));
      notifyListeners();
    });
  }
}
