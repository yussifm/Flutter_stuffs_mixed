import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.remove,
          color: Colors.redAccent,
        ),
        Text("Enhanced Counter app!"),
        Icon(
          Icons.add,
          color: Colors.lightGreen,
        ),
      ],
    );
  }
}
