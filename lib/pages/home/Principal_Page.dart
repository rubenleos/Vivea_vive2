import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';
import 'package:vivea_dos/providers/recetas_provider.dart';

class PrincipalPage extends StatefulWidget {
  PrincipalPage({Key key}) : super(key: key);

  @override
  _PrincipalPageState createState() => _PrincipalPageState();
}

class _PrincipalPageState extends State<PrincipalPage> {
  File _image, _selectedPicture;
  String imageLink, imageLink1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 64,
          ), //just for spacing

          imageLink != null
              ? CircleAvatar(
                  child: ClipOval(
                    child: Image.network(imageLink),
                  ),
                  radius: 100,
                )
              : CircleAvatar(
                  child: ClipOval(
                    child: Icon(
                      Icons.person,
                      size: 100,
                    ),
                  ),
                  radius: 100,
                ),
          SizedBox(
            height: 16,
          ), //ju

          ///

          ///
          SizedBox(
            height: 16,
          ), //just for spacing

          FlatButton(
            child: Text("Change Image"),
            onPressed: () async {
              uploadStatusImage();
            },
            color: Colors.green,
            textColor: Colors.white,
          ),
        ],
      ),
    ));
  }

  void uploadStatusImage() async {
    var timeKey = DateTime.now();
    _image = await ImagePicker.pickImage(source: ImageSource.gallery);

    FirebaseStorage fs = FirebaseStorage.instance;

    Reference rootReference = fs.ref();

    Reference pictureFolderRef = rootReference.child("pictures");

    pictureFolderRef
        .child(timeKey.toString() + 'jpg')
        .putFile(_image)
        .then((storageTask) async {
      String link = await storageTask.ref.getDownloadURL();
      print("uploaded");
      setState(() {
        imageLink = link;
        _selectedPicture = _image;
      });
    });
  }

  void savetoDatabase(String url) {
    var dbTimeKey = DateTime.now();
    var formatDate = DateFormat('MM d,yyyy');
    var formatTime = DateFormat('EEE,hh:mm aaa');

    String date = formatDate.format(dbTimeKey);
    String time = formatDate.format(dbTimeKey);
    DatabaseReference ref = FirebaseDatabase.instance.reference();
    var data = {
      "image": url,
      "date": date,
      "time": time,
    };
    ref.child("posts").push().set(data);
  }
}
