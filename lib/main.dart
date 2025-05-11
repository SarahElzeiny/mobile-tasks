import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:section/dashboard/dashboard_screen.dart';
import 'package:section/dashboard/nav_bar.dart';
import 'package:section/favorite/favorite_model.dart';
import 'package:section/profile/user%20model.dart';
import 'add_item/add_item_screen.dart';
import 'add_item/item_model.dart';

void main() {
  runApp(
    MultiProvider(
      child: const MyApp(),
      providers: [
        ChangeNotifierProvider(create: (context) => ItemModel()),
        ChangeNotifierProvider(create: (context) => UserModel()),
        ChangeNotifierProvider(create: (context) => FavoriteModel()),
      ],
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      home: NavBar(),
    );
  }
}
