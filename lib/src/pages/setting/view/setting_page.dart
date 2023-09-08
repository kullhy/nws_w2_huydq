import 'package:flutter/material.dart';
import 'package:nws_w2_huydq/src/pages/setting/view/components/poly.dart';
import 'package:nws_w2_huydq/src/pages/setting/view_model/setting_view_model.dart';
import 'package:provider/provider.dart';

class SettingPages extends StatelessWidget {
  const SettingPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          const Poly(),
          Container(
            height: 100,
            width: 300,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(213, 33, 149, 243)),
            child: TextButton(
                child: const Text(
                  "Change background image",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () {
                  Provider.of<SettingViewModel>(context, listen: false)
                      .changeBackground();
                }),
          ),
        ],
      ),
    );
  }
}
