import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class CapitalViewModel extends ChangeNotifier {
  CapitalViewModel() : super() {
    updateCurrentTime();
    getTime();
  }

  Map<String, int> cities = {
    "Europe/Moscow": 0,
    "America/New_York": 0,
    "Asia/Hong_Kong": 0,
    "Europe/London": 0,
    "Europe/Berlin": 0,
    "Asia/Tokyo": 0,
  };

  Future<void> getTime() async {
    for (final city in cities.keys) {
      final url = "http://worldtimeapi.org/api/timezone/$city";
      try {
        final response = await http.get(Uri.parse(url));
        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);
          String formattedTime = data['utc_offset'];
          log(formattedTime);
          // Chuyển đổi thời gian
          int offset =
              int.parse(formattedTime.replaceAll(RegExp(r'[^\d-]'), ''));
          double x = offset / 100;
          cities[city] = x.toInt();

          notifyListeners();
        } else {
          log('Failed to fetch time for $city');
        }
      } catch (e) {
        log('Error: $e');
      }
    }
    log(jsonEncode(cities));
    notifyListeners();
  }

  String editText(String inputString) {
    final parts = inputString.split('T');

    if (parts.length >= 2) {
      final timePart = parts[1].split('.')[0];
      return timePart;
    } else {
      return "";
    }
  }

  Map<String, String> capital = {
    "Europe/Moscow": "",
    "America/New_York": "",
    "Asia/Hong_Kong": "",
    "Europe/London": "",
    "Europe/Berlin": "",
    "Asia/Tokyo": "",
  };

  void updateCurrentTime() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      var current = DateTime.now();
      // String currentTime = DateFormat('HH:mm:ss').format(current);
      // currentDate = DateFormat('dd/MM/yyyy').format(current);
      for (var capitals in capital.keys) {
        capital[capitals] = DateFormat('HH:mm:ss')
            .format(current.add(Duration(hours: cities[capitals]! - 7)));
      }
      notifyListeners();
    });
  }
}
