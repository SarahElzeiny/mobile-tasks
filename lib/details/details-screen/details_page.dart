import 'dart:io';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:section/add_item/item_model.dart';
import '../../profile/profile-page/profile_page.dart';
import '../../profile/user model.dart';
import '../details-widget/favorite.dart';
import '../details-widget/season.dart';

class DetailsPage extends StatelessWidget {
  // final String ? title;
  // final String ? body;
  // final List<File> ? image;

  const DetailsPage({
    //this.image, this.title,  this.body,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final profileImage = Provider.of<UserModel>(context).user?.image;
    final items = Provider.of<ItemModel>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
            icon:
                profileImage == null
                    ? Icon(Icons.account_box)
                    : CircleAvatar(
                      radius: 20,
                      backgroundImage: FileImage(profileImage),
                    ),
          ),
        ],
        centerTitle: true,
        title: Text("The ${items.selectedItem!.title ?? "Tree"}"),
      ),
      body: SafeArea(
        // Optional but recommended
        child: SingleChildScrollView(
          child: Column(
            children: [
              //image == null || image!.isEmpty ? Image.asset("assets/tree.jpg") :
              Image.file(
                items.selectedItem!.images.first,
                height: 300,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
                  FavoriteWidget(
                    index: items.items.indexOf(items.selectedItem!),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  textAlign: TextAlign.justify,
                  items.selectedItem!.body,

                  //?? "Trees contribute to their environment by providing oxygen, improving air quality, climate amelioration, conserving water, preserving soil, and supporting wildlife. During the process of photosynthesis, trees take in carbon dioxide and produce the oxygen we breathe. According to the U.S. Department of Agriculture, “One acre of forest absorbs six tons of carbon dioxide and puts out four tons of oxygen. This is enough to meet the annual needs of 18 people.” Trees, shrubs and turf also filter air by removing dust and absorbing other pollutants like carbon monoxide, sulfur dioxide and nitrogen dioxide. After trees intercept unhealthy particles, rain washes them to the ground.",
                ),
              ),
              // image == null || image!.isEmpty ? Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //
              //     MySeasons(url: "assets/Tree-spring.jpg" , text: "spring"),
              //     MySeasons(url: "assets/Tree-fall.jpg" , text: "fall"),
              //
              //
              //   ],
              // ) :
              SizedBox(
                height: 500,
                child: GridView.builder(
                  itemCount: items.selectedItem!.images.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder:
                      (context, index) => Image.file(
                        items.selectedItem!.images[index],
                        height: 200,
                        width: 200,
                        fit: BoxFit.cover,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.push(context, MaterialPageRoute(builder: (context) => Firstscreen()));
        },
        child: Icon(Icons.next_plan),
      ),
    );
  }
}
