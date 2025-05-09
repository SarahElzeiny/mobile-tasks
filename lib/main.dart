import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/profile/user%20model.dart';
import 'first_screen.dart';

void main() {
  runApp(

      ChangeNotifierProvider(create: (context) => UserModel(),
      child: const MyApp() ,

      )
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
      home: Firstscreen(),
    );
  }
}



