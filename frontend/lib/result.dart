import 'package:flutter/material.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ResultScreen extends StatefulWidget {
  final File image;

  ResultScreen({required this.image});

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  String result = "लोड हो रहा है...";

  @override
  void initState() {
    super.initState();
    sendImage();
  }

  Future sendImage() async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('http://YOUR_API_URL/detect'),
    );

    request.files.add(
      await http.MultipartFile.fromPath('file', widget.image.path),
    );

    var response = await request.send();
    var res = await response.stream.bytesToString();

    var data = json.decode(res);

    setState(() {
      result = data["message"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("परिणाम")),
      body: Column(
        children: [
          Image.file(widget.image),
          SizedBox(height: 20),
          Text(result),
        ],
      ),
    );
  }
}