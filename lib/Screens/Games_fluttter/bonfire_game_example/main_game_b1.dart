import 'package:bonfire/bonfire.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RPGGameMain extends StatefulWidget {
  const RPGGameMain({super.key});

  @override
  State<RPGGameMain> createState() => _RPGGameMainState();
}

class _RPGGameMainState extends State<RPGGameMain> {
  @override
  Widget build(BuildContext context) {
    return BonfireWidget(
      // joystick: Joystick(
      //   directional: JoystickDirectional(),
      // ), // required
      map: WorldMapByTiled(TiledReader.asset('tiled/sample-overworld.json')),
    );
  }
}
