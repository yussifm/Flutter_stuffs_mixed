

import 'package:flutter/material.dart';
import 'package:maths_tuto_flutter/Screens/Games_fluttter/bomber_man.dart';
import 'package:maths_tuto_flutter/Screens/Games_fluttter/floppy_bird.dart';

class MainGame extends StatelessWidget {
  const MainGame({super.key});

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Games',
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FloppyBird(),
                  ),
                );
              },
              child: const Text(
                "FloppyBird",
                style: TextStyle(fontSize: 18),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BomberMan(),
                  ),
                );
              },
              child: const Text(
                "BomberMan",
                style: TextStyle(fontSize: 18),
              ),
            ),
          
          
          ],
        ),
      ),
    );
  }
}