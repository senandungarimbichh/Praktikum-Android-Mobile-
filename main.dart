import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 9, 71, 94),
        appBar: AppBar(
         title: Text("Hello Aku Dudung"),
         backgroundColor: Color.fromARGB(255, 148, 226, 255),
        ),
        body: Center(
          child: Image(
            image: AssetImage('images/Foto 1.jpeg'),
          )
          ),
      ),
    ),
  );
}