import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePhotoEdit extends StatefulWidget {
  const ProfilePhotoEdit({Key? key}) : super(key: key);

  @override
  _ProfilePhotoEditState createState() => _ProfilePhotoEditState();
}

class _ProfilePhotoEditState extends State<ProfilePhotoEdit> {
  File? _image;

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (_image != null)
          CircleAvatar(
            radius: 100,
            backgroundImage: FileImage(_image!),
          )
        else
          const CircleAvatar(
            radius: 100,
            backgroundImage:
            NetworkImage('https://robohash.org/sample.png'),
          ),
        ElevatedButton(
          onPressed: () {
            //_pickImage,
          },
          child: const Text('Change Profile Photo'),
        ),
        // Add a button here to save or upload the new photo
        // ...
      ],
    );
  }
}
