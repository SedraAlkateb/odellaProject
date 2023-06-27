import 'dart:ui';
import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart' ;
import 'package:untitled/app/constants.dart';

class ImageDownloader {
  static const String image="${Constants.baseUrl}storage/";
  static Future<File> downloadImage(String url) async {
    try {
      Response response = await Dio().get(
        "$image$url",
        options: Options(
          responseType: ResponseType.bytes,
        ),
      );
      Uint8List bytes= await  response.data;
      final directory = await
      getApplicationDocumentsDirectory();
      final file = File('${directory.path}/image.jpg') ;
      await file.writeAsBytes(bytes);
      return file;
    } catch (e) {
      throw Exception('Failed to download image: $e');
    }
  }
 static String getUrl(String url ){
    return  "$image$url";
  }
}



/*class ImageUtils {
  static Future<File> downloadImage(String url) async {
    final response = await http.get(Uri.parse(url));
    final tempDir = await getTemporaryDirectory();
    final file = File('${tempDir.path}/image.jpg');
    await file.writeAsBytes(response.bodyBytes);
    final image = img.decodeImage(File(file.path).readAsBytesSync());
    final pngBytes = img.encodeJpg(image);
    await file.writeAsBytes(pngBytes);
    return file;
  }
}*/

Future<File> uint8ListToFile(Uint8List data, String fileName) async {
  final buffer = data.buffer;
  final tempDir = await getTemporaryDirectory();
  final file = File('${tempDir.path}/$fileName');
  await file.writeAsBytes(buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
  return file;
}