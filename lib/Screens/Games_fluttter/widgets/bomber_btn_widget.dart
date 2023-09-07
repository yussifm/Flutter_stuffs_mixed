import 'package:flutter/material.dart';

class BomberManBtnWidget extends StatelessWidget {
  Color? color;
  Widget? child;
  void Function()? ontap;
  BomberManBtnWidget({
    super.key,
    this.color,
    this.child,
    this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          width: 60,
          height: 60,
          color: color,
          child: child,
        ),
      ),
    );
  }
}
