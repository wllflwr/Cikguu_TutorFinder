import 'dart:io';
import 'package:cikguu_app/controller/profiledata.dart';
import 'package:cikguu_app/model/profile.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
//import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
//import 'package:firebase_storage/firebase_storage.dart';

class ImageTutee extends StatefulWidget {
  @override
  _ImageTuteeState createState() => _ImageTuteeState();
}

class _ImageTuteeState extends State<ImageTutee> {
  File _image;

  // Image Picker
  Future getImage(ImageSource source) async {
    ImagePicker picker = ImagePicker();
    //PickedFile pickedFile;
    //File cropped;

    // Let user select photo from gallery
    var pickedFile = await picker.getImage(source: source);

    setState(() {
      _image = File(pickedFile.path);
      print('_image');
      print(_image);
    });
/*
    if (pickedFile != null) {
      cropped = await ImageCropper.cropImage(
          sourcePath: pickedFile.path, ratioX: 1.0, ratioY: 1.0);
    } else {
      print('No image selected.');
    }

    setState(() {
      _image = cropped ?? _image;
    });*/
  }

  String returnURL;

  Future uploadImage(BuildContext context) async {
    StorageReference firebaseStorage =
        FirebaseStorage.instance.ref().child(_image.path);
    StorageUploadTask uploadStorage = firebaseStorage.putFile(_image);

    //StorageTaskSnapshot taskSnapshot =
    await uploadStorage.onComplete;
    setState(() {
      print('Image Uploaded!');
      //Scaffold.of(context).showSnackBar(SnackBar(content: Text('Image Uploaded')));
    });

    await firebaseStorage.getDownloadURL().then((fileURL) {
      returnURL = fileURL;
      print('returnURL');
      print(returnURL);
    });
  }

  String getURL() {
    return returnURL;
  }

  @override
  Widget build(BuildContext context) {
    final profile = Provider.of<Profile>(context);

    return Scaffold(
      body: Center(
        child: Container(
          child: ListView(children: <Widget>[
            ClipOval(
              child: SizedBox(
                height: 300.0,
                width: 50.0,
                child: (_image != null)
                    ? Image.file(_image)
                    : Image.network(
                        profile.image,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            RawMaterialButton(
              fillColor: Theme.of(context).accentColor,
              child: Icon(
                Icons.add_a_photo,
                color: Colors.white,
              ),
              elevation: 8,
              onPressed: () {
                getImage(ImageSource.gallery);
              },
              padding: EdgeInsets.all(15),
              shape: CircleBorder(),
            ),
            RaisedButton(
              onPressed: () async {
                uploadImage(context);
                await ProfileDataService(uid: profile.uid)
                    .updateProfileImageData(getURL());
              },
              child: Text('Upload'),
            ),
            RaisedButton(
              onPressed: () async {
                Navigator.pop(context);
              },
              child: Text('Back'),
            )
          ]),
        ),
      ),
    );
  }
}
