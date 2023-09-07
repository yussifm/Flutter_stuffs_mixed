import 'dart:async';

import 'package:flutter/material.dart';
import 'package:maths_tuto_flutter/Screens/Games_fluttter/widgets/bird_widget.dart';

class FloppyBird extends StatefulWidget {
  const FloppyBird({super.key});

  @override
  State<FloppyBird> createState() => _FloppyBirdState();
}

class _FloppyBirdState extends State<FloppyBird> {
  // Bird vars
  static double birdY = 0;
  double initialPos = birdY;
  double height = 0;
  double time = 0;
  double gravity = -2.9;
  double velocity = 3.5;
  bool gameStarted = false;

  @override
  void initState() {
    super.initState();
  }

  void jump() {
    Timer.periodic(const Duration(milliseconds: 50), (timer) {
      // A real physical jump using upside down parabola
      height = gravity * time * time + velocity * time;

      setState(() {
        //Subtracting makes the bird go higher
        birdY = initialPos - height;
      });
      if (birdY < -1 || birdY > 1) {
        timer.cancel();
      }

      time += 0.1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        jump();
      },
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.blue.shade300,
                child: Center(
                  child: Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          jump();
                        },
                        child: BirdWidget(
                          birdY: birdY,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.brown,
              ),
            )
          ],
        ),
      ),
    );
  }
}
