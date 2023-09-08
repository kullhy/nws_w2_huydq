import 'package:flutter/material.dart';
import 'package:nws_w2_huydq/src/pages/clock/view_model/clock_view_model.dart';
import 'package:provider/provider.dart';
import 'components/clock_widget.dart';

class ClockPages extends StatefulWidget {
  const ClockPages({super.key});

  @override
  State<ClockPages> createState() => _ClockPagesState();
}

class _ClockPagesState extends State<ClockPages> {

  @override
  void dispose() {
    
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        height: 450,
        width: size.width * 0.9,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(96, 33, 149, 243),),
        child: Column(
          children: [
            const Text(
              "HaNoi",
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
            Consumer<ClokViewModel>(builder: (context, view, child) {
              return Column(
                children: [
                  ClockView(time: view.currentDataTime),
                  Text(
                    view.currentTime,
                    style: const TextStyle(
                        fontFamily: "E1234", fontSize: 50, color: Colors.white),
                  ),
                  Text(
                    view.currentDate,
                    style: const TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
