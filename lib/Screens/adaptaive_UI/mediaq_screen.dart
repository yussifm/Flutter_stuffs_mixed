import 'package:flutter/material.dart';

class MediaQScreen extends StatefulWidget {
  const MediaQScreen({super.key});

  @override
  State<MediaQScreen> createState() => _MediaQScreenState();
}

class _MediaQScreenState extends State<MediaQScreen> {
  @override
  Widget build(BuildContext context) {
    final devicePixelRatio = MediaQuery.devicePixelRatioOf(context);

    // Alternative to safearea
    final padding = MediaQuery.paddingOf(context);

    /// Another issue can raise with the software keyboard.
    ///  In the same way, use the viewInsets property to add the needed margins.
    ///  The Scaffold automatically manages this for you,
    ///  but it may be useful to deal with it directly sometimes.
    final viewInsets = MediaQuery.viewInsetsOf(context);

    return Scaffold(
      appBar: AppBar(),
      body: Visibility(
          visible: devicePixelRatio >= 2,
          child: Container(
            child: const Text("High resolution"),
          )),
    );
  }
}
