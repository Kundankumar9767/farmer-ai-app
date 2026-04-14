import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'result.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? image;

  Future pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.camera);

    if (picked != null) {
      image = File(picked.path);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(image: image!),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("🌾 किसान सहायक")),
      body: Center(
        child: ElevatedButton(
          onPressed: pickImage,
          child: Text("📸 फोटो खींचें"),
        ),
      ),
    );
  }
}