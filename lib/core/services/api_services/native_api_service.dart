import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class NativeApiService {
  static Future<File> getImgDirPath(File croppedImage) async {
    final Directory dir = await getApplicationDocumentsDirectory();
    final String appDir = dir.path;

    final File imgFile = File('$appDir/${DateTime.now()}_profile_picture.jpg');
    if (await imgFile.exists()) {
      imgFile.delete();
    }

    imageCache.clearLiveImages();
    imageCache.clear();

    final File copiedImage = await croppedImage
        .copy('$appDir/${DateTime.now()}_profile_picture.jpg');
    File myImg = File(copiedImage.path);

    return myImg;
  }
}
