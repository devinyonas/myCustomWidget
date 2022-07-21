import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_custom_widget/widget/utils_widget.dart';
import 'package:permission_handler/permission_handler.dart';

final _picker = ImagePicker();
final _cropper = ImageCropper();

Future<File> openCamOrDirDialog() async {
  final File img = await Get.dialog<File>(AlertDialog(
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextButton(
            onPressed: () async {
              showLoadingOverlay();
              final _getImg = await getImageCamera();
              closeOverlay();
              Get.back(
                  result: await _cropper.cropImage(sourcePath: _getImg.path));
            },
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Take Photo', textAlign: TextAlign.left))),
        TextButton(
            onPressed: () async {
              final _getImg = await getImageStorage();
              Get.back(
                  result: await _cropper.cropImage(sourcePath: _getImg.path));
            },
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Choose Image', textAlign: TextAlign.left))),
      ],
    ),
  ));

  return img;
}

Future<File> getImageCamera() async {
  var camera = await Permission.camera.status;
  if (!camera.isGranted) {
    await Permission.camera.request();
  }
  final pickedFile =
      await _picker.pickImage(source: ImageSource.camera, imageQuality: 50);
  if (pickedFile != null) {
    final rawFile = File(pickedFile.path);
    // final rawFileSize = rawFile.readAsBytesSync();
    // print('RAW FILE SIZE ${rawFileSize.length}');
    // if (rawFileSize.length > 1024 * 1024) {
    //   Directory tempDir = await getTemporaryDirectory();
    //   final targetPath = '${tempDir.path}/temp.jpg';
    //   final targetFile = File(targetPath);
    //   targetFile.deleteSync();
    //
    //   final compressed = await FlutterImageCompress.compressAndGetFile(
    //     rawFile.path,
    //     targetPath,
    //     quality: 50,
    //   );
    //
    //   print('COMPRESSED FILE SIZE ${compressed.readAsBytesSync().length}');
    //   print(compressed.path);
    //
    //   return compressed;
    // }

    return rawFile;
  }
  print('No image taken.');
  return null;
}

Future<File> getImageStorage() async {
  var storage = await Permission.storage.status;
  if (!storage.isGranted) {
    await Permission.storage.request();
  }
  final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
  if (pickedFile != null) return File(pickedFile.path);
  print('No image selected.');
  return null;
}
