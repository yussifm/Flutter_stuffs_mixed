import 'package:flutter/material.dart';

class BomberManPixelWidget extends StatelessWidget {
  Color? color;
  Color? outColor;

  Widget? child;
  BomberManPixelWidget({super.key, this.color, this.child, this.outColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          alignment: Alignment.center,
          color: outColor,
          padding: const EdgeInsets.all(5),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                alignment: Alignment.center,
                color: color,
                child: child,
              )),
        ),
      ),
    );
  }
}
