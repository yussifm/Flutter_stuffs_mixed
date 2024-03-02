import 'package:flutter/material.dart';
import 'package:maths_tuto_flutter/cross_platforms_uis/counter_app/counter_app.dart';

class MainCrossPlatformUi extends StatelessWidget {
  const MainCrossPlatformUi({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 100,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EnhancedCounterApp(),
                  ),
                );
              },
              child: const Text(
                "Enhanced counter App",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ]),
    ));
  }
}
