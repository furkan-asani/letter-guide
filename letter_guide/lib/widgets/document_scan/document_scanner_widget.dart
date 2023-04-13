import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:image_cropper/image_cropper.dart';


class DocumentScannerWidget extends StatefulWidget {
  const DocumentScannerWidget({super.key});

  @override
  _DocumentScannerWidgetState createState() => _DocumentScannerWidgetState();
}

class _DocumentScannerWidgetState extends State<DocumentScannerWidget> {
  List<CameraDescription>? cameras;
  CameraController? _controller;
  String? _imagePath;

  Future<void> _initializeCamera() async {
    cameras = await availableCameras();

    if (cameras == null || cameras!.isEmpty) {
      return;
    }

    _controller = CameraController(cameras![0], ResolutionPreset.medium);
    await _controller?.initialize();
  }

  Future<String?> _takePicture() async {
    if (!_controller!.value.isInitialized) {
      return null;
    }

    if (_controller!.value.isTakingPicture) {
      return null;
    }

    XFile? file;
    try {
      file = await _controller!.takePicture();
    } on CameraException catch (e) {
      if (kDebugMode) {
        print('Error: ${e.code}\nError Message: ${e.description}');
      }
      return null;
    }

    return file.path;
  }


  Future<String?> _cropImage(String imagePath) async {
    File? croppedFile = await ImageCropper().cropImage(
      sourcePath: imagePath,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      androidUiSettings: const AndroidUiSettings(
        toolbarTitle: 'Crop Document',
        toolbarColor: Colors.blue,
        toolbarWidgetColor: Colors.white,
        initAspectRatio: CropAspectRatioPreset.original,
        lockAspectRatio: false,
      ),
      iosUiSettings: const IOSUiSettings(
        title: 'Crop Document',
      ),
    );
    return croppedFile!.path;
  }

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text('Document Scanner'),
    ),
    body: Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
    if (_controller != null && _controller!.value.isInitialized)
    Expanded(
      child: CameraPreview(_controller!),
    ),
      if (_imagePath != null)
        Expanded(
          child: Image.file(File(_imagePath!)),
        ),
    ],
    ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          String? imagePath = await _takePicture();
          if (imagePath != null) {
            String? croppedImagePath = await _cropImage(imagePath);
            if (croppedImagePath != null) {
              setState(() {
                _imagePath = croppedImagePath;
              });
            }
          }
        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}
