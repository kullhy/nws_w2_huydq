import 'package:flutter/material.dart';

class CapitalItem extends StatelessWidget {
  const CapitalItem(
      {super.key, required this.capitalName, required this.capitalTime});
  final String capitalName;
  final String capitalTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 50,
      // width: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 101, 99, 99),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Text(
          capitalName,
          style: const TextStyle(color: Colors.white),
        ),
        Text(
          capitalTime,
          style: const TextStyle(color: Colors.white),
        ),
      ]),
    );
  }
}
