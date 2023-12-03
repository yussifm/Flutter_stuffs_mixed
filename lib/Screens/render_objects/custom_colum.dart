import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class CustomColumnWidget extends MultiChildRenderObjectWidget {
  @override
  List<Widget> children;

  CustomColumnWidget({Key? key, this.children = const []})
      : super(key: key, children: children);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderCustomColumn();
  }
}

class CustomColumnParentData extends ContainerBoxParentData<RenderBox> {
  int? flex;
}

class RenderCustomColumn extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, CustomColumnParentData>,
        RenderBoxContainerDefaultsMixin<RenderBox, CustomColumnParentData> {
@override
  void setupParentData(covariant RenderObject child) {
  if(child.parentData is! CustomColumnParentData){
    child.parentData = CustomColumnParentData();
  }
}
}
