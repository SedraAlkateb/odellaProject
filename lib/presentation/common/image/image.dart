import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

Future<File?> pickImage() async {
  try {
    final image1 = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image1 == null) return null ;
    final imageTemporary = File(image1.path);

     return imageTemporary;
  } on PlatformException catch (e) {
    // ignore: avoid_print
    print("object $e");
  }
  return null;
}