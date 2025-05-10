import 'package:flutter/material.dart';

class MySeasons extends StatelessWidget {

  final String url;
  final String text;
  const MySeasons({required this.url , required this.text , super.key});

  @override
  Widget build(BuildContext context) {
    return
      Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset(
            url,
            // Make sure this matches exactly (case-sensitive)
            height: 100,
            width: 100,
            fit: BoxFit.cover,
          ),
          Text(
            text,
            style: TextStyle(color: Colors.white70, fontSize: 20),
          ),
        ],
      );
  }
}