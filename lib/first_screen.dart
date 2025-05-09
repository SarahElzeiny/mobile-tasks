

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'Home/home-screen/home_page.dart';

import 'main.dart';

class Firstscreen extends StatefulWidget {
  Firstscreen({super.key});

  @override
  State<Firstscreen> createState() => _FirstscreenState();
}

class _FirstscreenState extends State<Firstscreen> {
  List<File> selectedImage = [];

  ImagePicker imagePicker = ImagePicker();

  Future<void> imageSelector() async {
    List<XFile>? images = await imagePicker.pickMultiImage();
    if (images != null && mounted) {
      setState(() {
        selectedImage.addAll(images.map((e) => File(e.path)));
      });
    }
  }

  TextEditingController title = TextEditingController();
  TextEditingController body = TextEditingController();

  @override
  void dispose() {
    title.dispose();
    body.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => MyHomePage(
                    title: title.text,
                    body: body.text,
                    image: selectedImage,
                  )));
        },
      ),
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/Tree-Back.jpeg"),
                fit: BoxFit.cover)),
        child: ListView(
          children: [
            Row(
              children: [

                Container(
                  color: Colors.white38,
                  height: 100,
                  width: 100,
                  child: IconButton(
                      onPressed: () {
                        imageSelector();
                      },
                      icon: Icon(Icons.camera_alt)),
                )

                ,SizedBox(height: 30),
              ],
            ),
            selectedImage.isEmpty
                ? Container(
              color: Colors.white38,
              height: 150,
              width: MediaQuery.sizeOf(context).width - 20,
              child: IconButton(
                  onPressed: () {
                    imageSelector();
                  },
                  icon: Icon(Icons.camera_alt)),
            )
                : SizedBox(
              height: 100,
              width: MediaQuery.sizeOf(context).width-120 ,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: selectedImage
                    .map((e) => Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Image.file(
                        e,
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    IconButton(onPressed: (){

                      setState(() {
                        selectedImage.removeAt(selectedImage.indexOf(e));                      });

                    }, icon: Icon(Icons.cancel))
                  ],
                ))
                    .toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: title,
                decoration: InputDecoration(
                    hintText: "title", border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: body,
                minLines: 3,
                maxLines: 6,
                decoration: InputDecoration(
                    hintText: "body", border: OutlineInputBorder()),
              ),
            )
          ],
        ),
      ),
    );
  }
}

