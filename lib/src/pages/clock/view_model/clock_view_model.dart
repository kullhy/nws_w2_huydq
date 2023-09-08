import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nws_w2_huydq/src/models/date_time.dart';

class ClokViewModel extends ChangeNotifier {
  ClokViewModel() : super() {
    updateCurrentTime();
  }

  String currentTime = "";
  String currentDate = "";
  CurrentDataTime currentDataTime = CurrentDataTime(0, 0, 0);

  void updateCurrentTime() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      var current = DateTime.now();
      currentTime = DateFormat('HH:mm:ss').format(current);
      currentDate = DateFormat('dd/MM/yyyy').format(current);
      currentDataTime = CurrentDataTime(
          current.hour, current.minute, current.second);
      notifyListeners();
    });
  }
}
