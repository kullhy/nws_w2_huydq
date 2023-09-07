import 'package:flutter/material.dart';
import 'package:nws_w2_huydq/src/app.dart';
import 'package:nws_w2_huydq/src/pages/capital/view_model/capital_view_model.dart';
import 'package:nws_w2_huydq/src/pages/clock/view_model/clock_view_model.dart';
import 'package:nws_w2_huydq/src/pages/setting/view_model/setting_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => ClokViewModel(),
    ),
    ChangeNotifierProvider(
      create: (_) => CapitalViewModel(),
    ),
    ChangeNotifierProvider(
      create: (_) => SettingViewModel(),
    ),
  ], child: const MyApp()));
}
