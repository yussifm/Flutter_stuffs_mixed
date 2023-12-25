// import 'package:flutter/material.dart';
// import 'dart:ffi' as FFI;
// import 'package:path_provider/path_provider.dart';

// // Signature of the function in C
// typedef print_demo_c = FFI.Void Function();

// // Signature of the function in Dart
// typedef PrintDemo = void Function();

// class FFIDemo extends StatefulWidget {
//   const FFIDemo({Key? key}) : super(key: key);

//   @override
//   State<FFIDemo> createState() => _FFIDemoState();
// }

// class _FFIDemoState extends State<FFIDemo> {
//   final path = "c_exam_lib.dll";

//   late var lib;
//   late PrintDemo demo;

//   @override
//   void initState() {
//     loadLibrary();
//     super.initState();
//   }

//   Future<void> loadLibrary() async {
//     final appDocDir = await getApplicationDocumentsDirectory();
//     final path = "${appDocDir.path}/c_exam_lib.dll";

//     try {
//       lib = FFI.DynamicLibrary.open(path);
//       demo = lib.lookupFunction<print_demo_c, PrintDemo>("print_demo");
//     } catch (e) {
//       print("Failed to load library: $e");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     demo(); // Call the C function
//     return Scaffold(
//       appBar: AppBar(),
//     );
//   }
// }
