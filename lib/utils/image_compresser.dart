import 'dart:io';
import 'package:flutter_image_compress/flutter_image_compress.dart';

class Compresser {
  static Future<File> testCompressAndGetFile(
      File file, String targetPath) async {
    var result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      targetPath,
      quality: 30,
    );

    print(file.lengthSync());
    print(result.lengthSync());

    return result;
  }
}
