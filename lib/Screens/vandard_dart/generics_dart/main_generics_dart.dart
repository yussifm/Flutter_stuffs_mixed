import 'package:flutter/material.dart';

class GenericsInDart extends StatefulWidget {
  const GenericsInDart({super.key});

  @override
  State<GenericsInDart> createState() => _GenericsInDartState();
}

class _GenericsInDartState extends State<GenericsInDart> {
  final cache = CatchDataLocal<int>(10);
  @override
  Widget build(BuildContext context) {
    var value = cache.valueObj;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("$value")],
        ),
      ),
    );
  }
}

// Generics
class CatchDataLocal<T> {
  final T _value;
  T get valueObj => _value;

  CatchDataLocal(T value) : _value = value;
}
