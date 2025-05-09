
import 'dart:io';
import 'package:untitled1/profile/user%20model.dart';
import 'package:flutter/material.dart';
class Opetions extends StatelessWidget {
  final String title;
  final IconData icon;
  Colors? color;


  File ? selectedImage;
  VoidCallback onPress;

  Opetions(
      {this.selectedImage, required this.onPress, this.color, required this.title, required this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          color: selectedImage == null ? Colors.grey : Colors.red,
          onPressed: onPress,
          icon: Icon(icon),
        ),
        Text(title),
      ],
    );
  }
}

