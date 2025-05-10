import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

import 'item.dart';

class ItemModel extends ChangeNotifier {


  final List<Item> _items = [];

  List <Item> get items => _items;

  void addItem(Item item){

    _items.add(item);

    notifyListeners();
  }


  ImagePicker imagePicker = ImagePicker();
  List<File> selectedImage = [];
  Future<void> imageSelector() async {

    List<XFile>? images = await imagePicker.pickMultiImage();
    if (images != null) {
      selectedImage!.addAll(
          images.map((e) => File(e.path)));
    }
    notifyListeners();

  }

void removeImage ( index){

    selectedImage!.removeAt(
      selectedImage.indexOf(index),
    );

    notifyListeners();
}

Item ?_selectedItem;
  Item? get selectedItem => _selectedItem;

void selectItem(Item item){
  _selectedItem = item;
notifyListeners();
}
}
