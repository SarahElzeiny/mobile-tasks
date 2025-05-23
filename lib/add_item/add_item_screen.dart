import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // استيراد باكيج الـ provider
import 'package:section/add_item/item_model.dart'; // التأكد من الاستيراد الصحيح
import '../dashboard/dashboard_screen.dart'; // التأكد من المسار
import '../dashboard/dashboard_screen.dart';
import '../main.dart';
import 'dart:io';

import 'item.dart';

class AddItemPage extends StatefulWidget {
  AddItemPage({super.key});

  @override
  State<AddItemPage> createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
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
          final item = Provider.of<ItemModel>(context, listen: false);
          item.addItem(
            Item(
              images: List.from(item.selectedImage!),
              title: title.text,
              body: body.text,
              favorite: false,
            ),
          );
          item.selectedImage!.clear();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => DashboardScreen()),
          );
        },
      ),
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/add.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Consumer<ItemModel>(
          builder:
              (context, itemModel, child) => ListView(
                children: [
                  Row(
                    children: [
                      Container(
                        color: Colors.white38,
                        height: 100,
                        width: 100,
                        child: IconButton(
                          onPressed: () {
                            itemModel.imageSelector();
                          },
                          icon: Icon(Icons.camera_alt),
                        ),
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                  itemModel.selectedImage.isEmpty
                      ? Container(
                        color: Colors.white38,
                        height: 150,
                        width: MediaQuery.sizeOf(context).width - 20,
                        child: IconButton(
                          onPressed: () {
                            itemModel.imageSelector();
                          },
                          icon: Icon(Icons.camera_alt),
                        ),
                      )
                      : SizedBox(
                        height: 100,
                        width: MediaQuery.sizeOf(context).width - 120,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children:
                              itemModel.selectedImage
                                  .map(
                                    (e) => Stack(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0,
                                          ),
                                          child: Image.file(
                                            e,
                                            height: 100,
                                            width: 100,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            itemModel.removeImage(
                                              itemModel.selectedImage.indexOf(
                                                e,
                                              ),
                                            );
                                          },
                                          icon: Icon(Icons.cancel),
                                        ),
                                      ],
                                    ),
                                  )
                                  .toList(),
                        ),
                      ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(

                      controller: title,
                      decoration: InputDecoration(
                        hintText:  "title",
                        hintStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: body,
                      minLines: 3,
                      maxLines: 6,
                      decoration: InputDecoration(
                        hintText: "body",
                        hintStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
        ),
      ),
    );
  }
}
