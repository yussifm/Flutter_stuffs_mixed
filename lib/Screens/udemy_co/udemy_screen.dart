import 'package:flutter/material.dart';

class UdemyScreen extends StatefulWidget {
  const UdemyScreen({super.key});

  @override
  State<UdemyScreen> createState() => _UdemyScreenState();
}

class _UdemyScreenState extends State<UdemyScreen> {
  var me = Person(name: "", age: 0);
  @override
  Widget build(BuildContext context) {
    var anotherPerson = me.CopyWith("Coded", 12);

    return Scaffold(
      appBar: AppBar(),

      // ignore: prefer_const_constructors
      body: Column(
        children: [Text(anotherPerson.name)],
      ),
    );
  }
}

class Person {
  String name;
  int age;
  Person({required this.name, required this.age});

  Person CopyWith(String? name, int? age) => Person(
        name: name ?? "",
        age: age ?? 0,
      );

  @override
  String toString() => "name: $name, age: $age";
}
