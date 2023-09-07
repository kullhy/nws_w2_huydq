import 'package:flutter/material.dart';
import 'package:nws_w2_huydq/src/pages/capital/view/components/capital_item.dart';
import 'package:nws_w2_huydq/src/pages/capital/view_model/capital_view_model.dart';
import 'package:provider/provider.dart';

class CapitalPage extends StatefulWidget {
  const CapitalPage({super.key});

  @override
  State<CapitalPage> createState() => _CapitalPageState();
}

class _CapitalPageState extends State<CapitalPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CapitalViewModel>(builder: (context, view, child) {
      return ListView.builder(
        itemCount: view.capital.length,
        itemBuilder: (BuildContext context, int index) {
          String value = view.capital.keys.elementAt(index);
          // log(view.capital[value].toString());
          return CapitalItem(
              capitalName: value, capitalTime: view.capital[value] ?? "");
        },
      );
    });
  }
}
