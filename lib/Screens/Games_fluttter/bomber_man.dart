import 'dart:async';

import 'package:flutter/material.dart';
import 'package:maths_tuto_flutter/Screens/Games_fluttter/widgets/bomber_btn_widget.dart';
import 'package:maths_tuto_flutter/Screens/Games_fluttter/widgets/my_pixels_widget.dart';

class BomberMan extends StatefulWidget {
  const BomberMan({super.key});

  @override
  State<BomberMan> createState() => _BomberManState();
}

class _BomberManState extends State<BomberMan> {
  int numberOfSquares = 130;
  int playerPosition = 0;
  int bombPosition = -1;
  List<int> fire = [-1];

  List<int> barriers = [
    11,
    13,
    15,
    17,
    18,
    31,
    33,
    35,
    37,
    38,
    51,
    53,
    55,
    57,
    58,
    71,
    73,
    75,
    77,
    78,
    91,
    93,
    95,
    97,
    98,
    111,
    113,
    115,
    117,
    118
  ];

  List<int> boxes = [
    12,
    14,
    16,
    28,
    21,
    41,
    61,
    81,
    101,
    112,
    114,
    116,
    119,
    127,
    123,
    103,
    83,
    63,
    63,
    65,
    67,
    47,
    39,
    19,
    1,
    30,
    50,
    70,
    121,
    100,
    96,
    79,
    99,
    107,
    7,
    3
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Column(
        children: [
          Expanded(
              flex: 2,
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 10,
                  ),
                  itemCount: numberOfSquares,
                  itemBuilder: (context, index) {
                     if (fire.contains(index)) {
                      return BomberManPixelWidget(
                       outColor : Colors.red.shade400,
                        color: Colors.red[800],
                      );
                    }
                    if (bombPosition == index) {
                      return BomberManPixelWidget(
                        color: Colors.red.shade100,
                        outColor: Colors.red.shade300,
                        child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Image.asset(
                          "assets/images/bomb_circle.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                      );
                    }
                    if (playerPosition == index) {
                      return BomberManPixelWidget(
                        color: Colors.grey.shade900,
                        child: Image.asset(
                          "assets/images/bomberman.png",
                          fit: BoxFit.contain,
                        ),
                      );
                    }
                    if (barriers.contains(index)) {
                      return BomberManPixelWidget(
                        color: Colors.grey.shade900,
                        outColor: Colors.grey.shade600,
                      );
                    }
                    if (boxes.contains(index)) {
                      return BomberManPixelWidget(
                        color: Colors.brown,
                        outColor: Colors.brown.shade200,
                      );
                    }

                    return BomberManPixelWidget(
                      color: Colors.green,
                      outColor: Colors.green.shade200,
                    );
                  })),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BomberManBtnWidget(),
                  BomberManBtnWidget(
                    color: Colors.grey,
                    ontap: () {
                      moveUp();
                    },
                    child: const Icon(
                      Icons.arrow_drop_up_rounded,
                      size: 60,
                    ),
                  ),
                  BomberManBtnWidget(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BomberManBtnWidget(
                    color: Colors.grey,
                    ontap: () {
                      moveLeft();
                    },
                    child: const Icon(
                      Icons.arrow_left_rounded,
                      size: 60,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: BomberManBtnWidget(
                      color: Colors.white,
                      ontap: () {
                        placeBomb();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset(
                          "assets/images/bomb_circle.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  BomberManBtnWidget(
                    color: Colors.grey,
                    ontap: () {
                      moveRight();
                    },
                    child: const Icon(
                      Icons.arrow_right_rounded,
                      size: 60,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BomberManBtnWidget(),
                  BomberManBtnWidget(
                    color: Colors.grey,
                    ontap: () {
                      moveDown();
                    },
                    child: const Icon(
                      Icons.arrow_drop_down_rounded,
                      size: 60,
                    ),
                  ),
                  BomberManBtnWidget(),
                ],
              )
            ],
          ))
        ],
      ),
    );
  }

  void placeBomb() {
    setState(() {
      bombPosition = playerPosition;
      fire.clear();
      Timer(const Duration(milliseconds: 1000), () {
        setState(() {
          fire.add(bombPosition);
          fire.add(bombPosition - 1);
          fire.add(bombPosition + 1);
          fire.add(bombPosition - 10);
          fire.add(bombPosition + 10);
        });
        clearFire();
      });
    });
  }

  void clearFire() {
    setState(() {
      Timer(const Duration(milliseconds: 1000), () {
        setState(() {
          for (int i = 0; i < fire.length; i++) {
            if (boxes.contains(fire[i])) {
              boxes.remove(fire[i]);
            }
          }
          fire.clear();
          bombPosition = -1;
        });
      });
    });
  }

  void moveUp() {
    setState(() {
      if (playerPosition - 10 >= 0 &&
          !barriers.contains(playerPosition - 10) &&
          !boxes.contains(playerPosition - 10)) {
        playerPosition -= 10;
      }
    });

    print(playerPosition);
  }

  void moveLeft() {
    setState(() {
      if ((playerPosition > 0) &&
          !barriers.contains(playerPosition - 1) &&
          !boxes.contains(playerPosition - 1)) {
        playerPosition -= 1;
      }
    });

    print(playerPosition);
  }

  void moveRight() {
    setState(() {
      if ((playerPosition < numberOfSquares - 1 &&
          !barriers.contains(playerPosition + 1) &&
          !boxes.contains(playerPosition + 1))) {
        playerPosition += 1;
      }
    });

    print(playerPosition);
  }

  void moveDown() {
    setState(() {
      if (playerPosition + 10 < numberOfSquares &&
          !barriers.contains(playerPosition + 10) &&
          !boxes.contains(playerPosition + 10)) {
        playerPosition += 10;
      }
    });

    print(playerPosition);
  }
}
