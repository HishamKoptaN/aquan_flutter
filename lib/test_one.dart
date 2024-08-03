import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';

class MyAppOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Base64 Image Example'),
        ),
        body: Center(
          child: Base64Image(
              base64String:
                  'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxMTEhUTExMWFRUXFxcYGRgXFhoXFxoXGBcXFxgXGBgYHSggGB0lHRUVITEhJSkrLi4uFx8zODMtNygtLisBCgoKDg...'),
        ),
      ),
    );
  }
}

class Base64Image extends StatelessWidget {
  final String base64String;

  Base64Image({required this.base64String});

  @override
  Widget build(BuildContext context) {
    // Decode the Base64 string into bytes
    Uint8List bytes = base64Decode(base64String);

    return Image.memory(bytes);
  }
}
