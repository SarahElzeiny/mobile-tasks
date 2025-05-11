import 'package:image_picker/image_picker.dart';
import 'dart:io';

class User {
  String name;
  String bio;
  File? image;

  User({required this.name, required this.image, required this.bio});
}
