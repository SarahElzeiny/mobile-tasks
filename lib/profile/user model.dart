
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled1/profile/user.dart';

class UserModel extends ChangeNotifier{

//File ? selectedImage;

  User ? _user;
  User ? get user => _user;

  ImagePicker imagePicker =ImagePicker();

  Future<void> imageSelector(ImageSource source) async {
    XFile? image = await imagePicker.pickImage(source: source);
    if (image != null) {
      if (_user == null) {
        _user = User(name: "SarahElzeiny", image: File(image.path), bio: "i love coding.");
      } else {
        _user!.image = File(image.path);
      }
      notifyListeners();
    }
  }



  void removeImage(){

    _user?.image = null;
  notifyListeners();


}

}