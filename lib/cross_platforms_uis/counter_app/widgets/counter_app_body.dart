import 'package:flutter/material.dart';
import 'package:maths_tuto_flutter/cross_platforms_uis/counter_app/widgets/app_title.dart';
import 'package:maths_tuto_flutter/cross_platforms_uis/counter_app/widgets/history.dart';

class CounterAppBody extends StatefulWidget {
  const CounterAppBody({super.key});

  @override
  State<CounterAppBody> createState() => _CounterAppBodyState();
}

class _CounterAppBodyState extends State<CounterAppBody> {
  int count = 0;

  List<int> increaseHistory = [];

  void increase() {
    setState(() {
      count++;
      increaseHistory = List<int>.from(increaseHistory)..add(count);
    });
  }

  void decrease() {
    setState(() {
      count--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const AppTitle(),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: decrease,
                  child: const Text("-"),
                ),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: increase,
                  child: const Text("+"),
                ),
              ],
            ),
            HistoryWidget(increaseHistory: increaseHistory),
          ],
        ),
      ),
    );
  }
}
