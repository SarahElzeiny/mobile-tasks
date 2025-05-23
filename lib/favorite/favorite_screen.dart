import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:section/favorite/favorite_model.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Favorite")),
      body: Consumer<FavoriteModel>(
        builder: (context, fav, child) {

          if (fav.fav.isEmpty) {
            return Center(
              child:
              Text(
                "No favorite",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            );

          } else {
            return GridView.builder(
              padding: EdgeInsets.all(10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.9,
              ),
              itemCount: fav.fav.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Image.file(
                      fav.fav[index].images.first,
                      height: 125,
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            fav.fav[index].title,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            fav.fav[index].favorite = false;
                            fav.remove(fav.fav[index]);
                          },
                          icon: Icon(Icons.favorite, color: Colors.red),
                        ),
                      ],
                    ),
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}
