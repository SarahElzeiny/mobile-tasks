import 'dart:io';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled1/profile/user%20model.dart';


import '../profile-widget/Opetions.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: Column(
        children: [
          Center(
            child: Consumer <UserModel>(
              builder: ( context, userModel ,child)
              {
              return Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 100,
                    child:
                    userModel.user?.image == null ? Icon(Icons.person, size: 200, color: Colors.white38)
                        : ClipOval(
                      child: Image.file(
                        userModel.user!.image!,
                        height: 200,
                        width: 200,
                        fit: BoxFit.cover,
                      ),
                    ),

                  ),
                  CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 25,
                    child: IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder:
                              (context) => SizedBox(
                            height: 150,
                            child: Column(
                              children: [
                                Text("Profile", style: TextStyle(fontSize: 25),),
                                Divider(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Opetions(onPress: (){
                                      userModel.imageSelector(ImageSource.camera);
                                      Navigator.pop(context);
                                    }, title: "Camera", icon: Icons.camera_alt,),
                                    Opetions(onPress: (){
                                     userModel. imageSelector(ImageSource.gallery);
                                      Navigator.pop(context);
                                    }, title: "Gallery", icon: Icons.image,),
                                    if(userModel.user?.image != null) Opetions(
                                        selectedImage: userModel.user?.image,
                                        onPress: (){
                                          userModel.removeImage();
                                          Navigator.pop(context);
                                        }, title: "Delete", icon: Icons.delete)
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.camera_alt,
                        size: 40,
                        color: Colors.white38,
                      ),
                    ),
                  ),
                ],
              );
              }

            ),
          ),
        ],
      ),
    );
  }
}

