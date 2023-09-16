import 'package:flutter/material.dart';
import 'package:maths_tuto_flutter/Screens/render_objects/custom_colum.dart';

class MainRenderObject extends StatefulWidget {
  const MainRenderObject({super.key});

  @override
  State<MainRenderObject> createState() => _MainRenderObjectState();
}

class _MainRenderObjectState extends State<MainRenderObject> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomColumnWidget(
        children: const [
          Spacer(),
          Padding(padding: EdgeInsets.all(5), child: Text("Just Test"),),
        ],
      ),
    );
  }
}
