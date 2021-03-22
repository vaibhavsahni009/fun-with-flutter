import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      home: Codiv(),
    ),
  );
}

class Codiv extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//        backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Center(child: Text("I am Rich")),
//          backgroundColor: Colors.blueGrey[900],
      ),
      body: Center(
        child: Image(image: AssetImage("images/diamond.png")),
      ),
    );
  }
}
