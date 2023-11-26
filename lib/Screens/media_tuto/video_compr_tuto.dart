import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_compress_plus/video_compress_plus.dart';
import 'package:video_player/video_player.dart';

class VideoCompressTuto extends StatefulWidget {
  const VideoCompressTuto({super.key});

  @override
  State<VideoCompressTuto> createState() => _VideoCompressTutoState();
}

class _VideoCompressTutoState extends State<VideoCompressTuto> {
  XFile? _selectedVideo;
  File? _videoThumbnail;
  MediaInfo? _compressedVideo;
  final ImagePicker picker = ImagePicker();
  bool isCompressing = false;
  late VideoPlayerController _controller;
  late VideoPlayerController _controllerTwo;
  int uncompressedVideoSize = 0;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(File(_selectedVideo?.path ?? ""));

    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.initialize().then((_) => setState(() {}));
    _controller.play();

    //Two
    _controllerTwo =
        VideoPlayerController.file(File(_compressedVideo?.path ?? ""));

    _controllerTwo.addListener(() {
      setState(() {});
    });
    _controllerTwo.setLooping(true);
    _controllerTwo.initialize().then((_) => setState(() {}));
    _controllerTwo.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<MediaInfo?> compressVideoFun({required String path}) async {
    setState(() {
      isCompressing = true;
    });
    MediaInfo? mediaInfo = await VideoCompress.compressVideo(
      path,
      quality: VideoQuality.DefaultQuality,
      deleteOrigin: false, // It's false by default
    );

    setState(() {
      isCompressing = false;
    });

    return mediaInfo;
  }

  Future<File?> getVideoThumbnail({required String videopath}) async {
    File? thumbnailFile = await VideoCompress.getFileThumbnail(videopath,
        quality: 50, // default(100)
        position: -1 // default(-1)
        );
    print("======= Uint8List: $thumbnailFile =====");
    return thumbnailFile;
  }

  Future<MediaInfo?> getVideoInfo({required String videopath}) async {
    MediaInfo? info = await VideoCompress.getMediaInfo(videopath);
    print("======= Uint8List: $info =====");
    return info;
  }

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
              height: 30.h,
            ),
            Center(
              child: TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        width: 300.w,
                        height: 200.h,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(children: [
                          GestureDetector(
                            onTap: () async {
                              _selectedVideo = await picker.pickVideo(
                                  source: ImageSource.camera);
                              _controller = VideoPlayerController.file(
                                  File(_selectedVideo?.path ?? ""));
                              _controller.play();

                              uncompressedVideoSize =
                                  await _selectedVideo?.length() ?? 0;

                              var thumb = await getVideoThumbnail(
                                  videopath: _selectedVideo?.path ?? "");
                              setState(() {
                                _videoThumbnail = thumb;
                              });

                              setState(() {});
                              print(
                                  "=========Name: ${_selectedVideo?.name}===== Path: ${_selectedVideo?.path}======");
                              Navigator.pop(context);
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
                              _selectedVideo = await picker.pickVideo(
                                  source: ImageSource.gallery);
                              _controller = VideoPlayerController.file(
                                  File(_selectedVideo?.path ?? ""));
                              _controller.play();
                              uncompressedVideoSize =
                                  await _selectedVideo?.length() ?? 0;
                              var thumb = await getVideoThumbnail(
                                  videopath: _selectedVideo?.path ?? "");
                              setState(() {
                                _videoThumbnail = thumb;
                              });
                              setState(() {});
                              print(
                                  "=========Name: ${_selectedVideo?.name}===== Path: ${_selectedVideo?.path}======");
                              Navigator.pop(context);
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
                    ),
                  );
                },
                child: const Text("Select Video"),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),

            // Get Thumbnails
            Visibility(
              visible: _selectedVideo != null && _selectedVideo?.path != null,
              child: TextButton(
                onPressed: () async {
                  var thumb = await getVideoThumbnail(
                      videopath: _selectedVideo?.path ?? "");
                  setState(() {
                    _videoThumbnail = thumb;
                  });
                },
                child: const Text("get Thumbnail"),
              ),
            ),
            //ThumbNail
            Visibility(
              visible: _videoThumbnail != null && _videoThumbnail?.path != null,
              child: Column(
                children: [
                  Container(
                    width: 100.w,
                    height: 80.h,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.blue,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.file(
                        _videoThumbnail ?? File(""),
                        width: 100.h,
                        height: 100.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  const Text("Thumbnail")
                ],
              ),
            ),

            SizedBox(
              height: 10.h,
            ),
            // Display UnCompressed Video
            Visibility(
              visible: _selectedVideo != null && _selectedVideo?.path != null,
              child: Column(
                children: [
                  Container(
                    width: 150.w,
                    height: 100.h,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.blue,
                      ),
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: <Widget>[
                              VideoPlayer(_controller),
                              VideoProgressIndicator(_controller,
                                  allowScrubbing: true),
                            ],
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  const Text("UnCompressed Video"),
                  Text("UnCompressed Video Sized: $uncompressedVideoSize")
                ],
              ),
            ),
            SizedBox(
              height: 30.h,
            ),

            // Compress Btn
            Visibility(
              visible: _selectedVideo != null && _selectedVideo?.path != null,
              child: Visibility(
                visible: !isCompressing,
                replacement: const Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
                child: TextButton(
                  onPressed: () async {
                    var video = await compressVideoFun(
                        path: _selectedVideo?.path ?? "");
                    _controllerTwo = VideoPlayerController.file(
                      File(video?.path ?? ""),
                    );
                    setState(() {
                      _compressedVideo = video;
                    });
                  },
                  child: const Text("Compress Selected Video"),
                ),
              ),
            ),

            SizedBox(
              height: 20.h,
            ),

            // Compress Video
            Visibility(
              visible:
                  _compressedVideo != null && _compressedVideo?.path != null,
              child: Column(
                children: [
                  Container(
                    width: 200.w,
                    height: 150.h,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.blue,
                      ),
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: AspectRatio(
                          aspectRatio: _controllerTwo.value.aspectRatio,
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: <Widget>[
                              VideoPlayer(_controllerTwo),
                              VideoProgressIndicator(
                                _controllerTwo,
                                allowScrubbing: true,
                              ),
                            ],
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  const Text("Compressed Video"),
                  Text("Compressed Video Sized: ${_compressedVideo?.filesize}")
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
