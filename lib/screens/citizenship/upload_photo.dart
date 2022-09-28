import 'dart:io';

import 'package:e_palika/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class PickImage extends StatefulWidget {
  const PickImage({Key? key}) : super(key: key);

  @override
  _PickImageState createState() => _PickImageState();
}

class _PickImageState extends State<PickImage> {
  File? _image;

  Future getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image == null) {
      return AlertDialog(
        title: null,
        content: Text(
          'Image Not Selected.',
          style: GoogleFonts.poppins(fontSize: 20, color: Colors.black),
        ),
        actions: [
          Buttons(
            buttonText: 'Ok',
            buttonColor: const Color(0xFFEA5455),
            onClick: () {
              Navigator.of(context).pop();
            },
          )
        ],
      );
    } //if statement

    final tempImage = File(image.path);

    setState(() {
      _image = tempImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _image != null
        ? Image.file(_image!, height: 250, width: 250, fit: BoxFit.cover)
        : Column(
            children: [
              Buttons(
                buttonText: "Upload Image",
                buttonColor: const Color(0xFFFFD460),
                onClick: getImage,
              ),
            ],
          );
  }
}
