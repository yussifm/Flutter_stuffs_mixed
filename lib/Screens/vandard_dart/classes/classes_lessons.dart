import 'package:flutter/material.dart';

class DartClasses extends StatefulWidget {
  const DartClasses({super.key});

  @override
  State<DartClasses> createState() => _DartClassesState();
}

class _DartClassesState extends State<DartClasses> {
  var me = Person(name: "person1", age: 1);

  @override
  Widget build(BuildContext context) {
    var anotherperson = me.copyWith("coded", 25);

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(anotherperson.name),
          Text(anotherperson.age.toString()),
          Text(me.name),
          Text(me.age.toString()),
        ],
      ),
    );
  }
}

class Person {
  String name;
  int age;

  Person({required this.name, required this.age});

  Person copyWith(String? name, int? age) {
    return Person(name: name ?? "", age: age ?? 0);
  }

  @override
  String toString() => "Name: $name, age: $age";
}
