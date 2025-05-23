import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:section/profile/user.dart';

class UserModel extends ChangeNotifier {
  //File ? selectedImage;

  User? _user;
  User? get user => _user;

  ImagePicker imagePicker = ImagePicker();

  void createDefaultUser(String email) {
    _user = User(
      name: "Sarah Elzeiny",
      image: null,
      bio: "I love flutter",
    );
    notifyListeners();
  }


  // Create a user with all details
  void createUser(String name, String bio, String email) {
    _user = User(
      name: name.isNotEmpty ? name : "User",
      image: null,
      bio: bio.isNotEmpty ? bio : "No bio added yet.",
    );
    notifyListeners();
  }

  Future<void> imageSelector(ImageSource source) async {
    XFile? image = await imagePicker.pickImage(source: source);
    if (image != null) {
      if (_user == null) {
        _user = User(
          name: "Sarah Elzeiny",
          image: File(image.path),
          bio: "I love flutter",
        );
      } else {
        _user!.image = File(image.path);
      }
      notifyListeners();
    }
  }

  void removeImage() {
    _user?.image = null;
    notifyListeners();
  }

  // Update user profile
  void updateProfile(String name, String bio) {
    if (_user != null) {
      _user!.name = name;
      _user!.bio = bio;
      notifyListeners();
    }
  }

  // Logout user
  void logout() {
    _user = null;
    notifyListeners();
  }
}