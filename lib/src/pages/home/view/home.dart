import 'package:flutter/material.dart';
import 'package:nws_w2_huydq/src/pages/capital/view/capital_page.dart';
import 'package:nws_w2_huydq/src/pages/setting/view/setting_page.dart';
import 'package:nws_w2_huydq/src/pages/setting/view_model/setting_view_model.dart';
import 'package:provider/provider.dart';

import '../../clock/view/clock_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  // static const TextStyle optionStyle =
  //     TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "",
            style: TextStyle(),
          ),
        ),
        body: Stack(
          children: [
            Consumer<SettingViewModel>(builder: (context, view, child) {
              if (view.photo == null) {
                return Image.asset(
                  "assets/images/background.jpg",
                  width: size.width,
                  height: size.height * 0.9,
                  fit: BoxFit.fill,
                );
              } else {
                return Image.file(
                  view.photo!,
                  width: size.width,
                  height: size.height * 0.9,
                  fit: BoxFit.cover,
                );
              }
            }),
            Center(
              child: IndexedStack(
                index: _selectedIndex,
                children: const <Widget>[
                  ClockPages(),
                  CapitalPage(),
                  SettingPages(),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.timelapse_outlined),
              label: 'Clock',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.location_on_outlined),
              label: 'Capital',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Setting',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
