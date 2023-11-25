import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class VideoCompressTuto extends StatefulWidget {
  const VideoCompressTuto({super.key});

  @override
  State<VideoCompressTuto> createState() => _VideoCompressTutoState();
}

class _VideoCompressTutoState extends State<VideoCompressTuto> {
  XFile? _selectedVideo;
  final ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Video Compressing"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 50.h,
          ),
          TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => Container(
                  width: 300.w,
                  height: 200.h,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(children: [
                    GestureDetector(
                      onTap: () async {
                        _selectedVideo =
                            await picker.pickVideo(source: ImageSource.camera);
                        setState(() {});
                      },
                      child: const Row(
                        children: [
                          Icon(
                            Icons.camera_alt_rounded,
                          ),
                          Text("Camera")
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    GestureDetector(
                      onTap: () async {
                        _selectedVideo =
                            await picker.pickVideo(source: ImageSource.gallery);
                        setState(() {});
                      },
                      child: const Row(
                        children: [
                          Icon(
                            Icons.image,
                          ),
                          Text("Gallery")
                        ],
                      ),
                    )
                  ]),
                ),
              );
            },
            child: const Text("Select Video"),
          ),
        ],
      )),
    );
  }
}
