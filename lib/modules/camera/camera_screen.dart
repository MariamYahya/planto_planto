import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:planto_planto/modules/camera/widgets/result_details.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  bool isImageSelected = false;
  File? imageFile;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/backgroundtest.png"),
          fit: BoxFit.cover,
          colorFilter:
              ColorFilter.mode(Colors.grey.withOpacity(0.8), BlendMode.dstATop),
        ),
      ),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: EdgeInsets.symmetric(vertical: 80, horizontal: 40),
              child: Column(
                children: [
                  isImageSelected
                      ? Container(
                          width: 224,
                          height: 224,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: FileImage(imageFile!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      : Container(
                          width: 256,
                          height: 256,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/test.jpg"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                  SizedBox(
                    height: 50,
                  ),
                  ResultDetails(),
                  SizedBox(
                    height: 100,
                  ),
                  GestureDetector(
                    onTap: () => _pickImageFromCamera(),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 25,
                      child: Icon(
                        Icons.photo_camera,
                        color: Color(0xFF093923),
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _pickImageFromCamera() async {
    try {
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.camera);
      if (pickedImage != null) {
        setState(() {
          imageFile = File(pickedImage.path);
          isImageSelected = true;
        });
      } else {
        print('User didnt pick any image.');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
