import 'dart:io';
import 'package:cikguu_app/controller/profiledata.dart';
import 'package:cikguu_app/model/profile.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
//import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ImageTutor extends StatefulWidget {
  @override
  _ImageTutorState createState() => _ImageTutorState();
}

class _ImageTutorState extends State<ImageTutor> {
  File _image;

  // Image Picker
  Future getImage(ImageSource source) async {
    ImagePicker picker = ImagePicker();

    // Let user select photo from gallery
    var pickedFile = await picker.getImage(source: source);

    setState(() {
      _image = File(pickedFile.path);
    });
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
      /*var showSnackBar = Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text('Image Uploaded'))); */
    });

    await firebaseStorage.getDownloadURL().then((fileURL) {
      returnURL = fileURL;
    });
  }

  String getURL() {
    return returnURL;
  }

  @override
  Widget build(BuildContext context) {
    final profile = Provider.of<Profile>(context);
    print('url');
    print(returnURL);

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
              onPressed: () async {
                getImage(ImageSource.gallery);
                String url = getURL();
                await ProfileDataService(uid: profile.uid)
                    .updateProfileImageData(url);
                //LinearProgressIndicator(value: ,)
              },
              padding: EdgeInsets.all(15),
              shape: CircleBorder(),
            ),
            RaisedButton(
              onPressed: () {
                uploadImage(context);
              },
              child: Text('Upload'),
            ),
            RaisedButton(
              onPressed: () {
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
