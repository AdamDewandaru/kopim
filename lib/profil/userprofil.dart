import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';

class userprofil extends StatefulWidget {
  userprofil({Key? key}) : super(key: key);

  @override
  State<userprofil> createState() => _userprofil();
}

class _userprofil extends State<userprofil> {
  File? image;
  @override
  Widget build(BuildContext context) {
    Future openCamera() async {
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.camera);
      setState(() {
        image = File(pickedImage!.path);
      });
    }

    Future openGallery() async {
      final imageGallery =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      setState(() {
        image = File(imageGallery!.path);
      });
    }

    return Center(
      child: Stack(
        children: [
          Container(
            child: Column(children: [
              image != null
                  ? ClipOval(
                      child: Image.file(
                      image!,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ))
                  : SizedBox(
                      width: 100,
                      height: 100,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage(
                          'assets/icon_profil.png',
                        ),
                      ),
                    ),
            ]),
          ),
          Positioned(
            bottom: 0,
            left: 60,
            right: 0,
            child: CircleAvatar(
              radius: 17,
              backgroundColor: Colors.green,
              child: Center(
                  child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: ((builder) => Container(
                                height: 100,
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                                child: Column(
                                  children: [
                                    Text(
                                      'Choose Profile Photo',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        // ignore: deprecated_member_use
                                        FlatButton.icon(
                                          icon: Icon(Icons.camera),
                                          onPressed: () {
                                            openCamera();
                                            Navigator.pop(context);
                                          },
                                          label: Text('Camera'),
                                        ),
                                        // ignore: deprecated_member_use
                                        FlatButton.icon(
                                          icon: Icon(Icons.image),
                                          onPressed: () {
                                            openGallery();
                                            Navigator.pop(context);
                                          },
                                          label: Text('Gallery'),
                                        )
                                      ],
                                    )
                                  ],
                                ))));
                      },
                      child: Icon(Icons.camera_alt_rounded,
                          color: Colors.white, size: 18))),
            ), // Container(
          )
        ],
      ),
    );
  }
}
