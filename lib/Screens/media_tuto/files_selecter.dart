import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilePickWithSelector extends StatefulWidget {
  const FilePickWithSelector({super.key});

  @override
  State<FilePickWithSelector> createState() => _FilePickWithSelectorState();
}

class _FilePickWithSelectorState extends State<FilePickWithSelector> {
  List<String> filePathsStrings = [];
  final typeGroup = const XTypeGroup(
    label: 'custom',
    extensions: [
      'pdf',
      'txt',
      'doc',
      'docx',
      'xlsx',
      'csv',
      'png',
      'jpg',
      'mp3',
      'mp4'
    ],
  );

  openFilesFunc() async {
    final List<XFile> file =
        await openFiles(acceptedTypeGroups: <XTypeGroup>[typeGroup]);

    String filePath = file.single.path;
    file.map((e) => filePathsStrings.add(e.path));

    // If the file path is null, try to resolve it using the content URI
    if (file.isNotEmpty) {
      filePath = file.single.path;
    }

    print('Selected file path: $filePath');

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("File Picker"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 50.h,
          ),
          ElevatedButton(
            onPressed: () {
              openFilesFunc();
            },
            child: const Text("Select file"),
          ),
          SizedBox(
            height: 50.h,
          ),
          ...List.generate(
            filePathsStrings.length,
            (index) => Padding(
              padding: const EdgeInsets.all(10),
              child: Text(filePathsStrings[index]),
            ),
          ),
        ],
      ),
    );
  }
}
