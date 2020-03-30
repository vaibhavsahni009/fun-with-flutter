import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void voice(int x) {
      final player = AudioCache();
      player.play('note$x.wav');
    }

    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: <Widget>[
              FlatButton(
                onPressed: () {
                  voice(1);
                },
                color: Colors.red,
              ),
              FlatButton(
                onPressed: () {
                  voice(2);
                },
                color: Colors.orange,
              ),
              FlatButton(
                onPressed: () {
                  voice(3);
                },
                color: Colors.yellow,
              ),
              FlatButton(
                onPressed: () {
                  voice(4);
                },
                color: Colors.green,
              ),
              FlatButton(
                onPressed: () {
                  voice(5);
                },
                color: Colors.blue,
              ),
              FlatButton(
                onPressed: () {
                  voice(6);
                },
                color: Colors.indigo,
              ),
              FlatButton(
                onPressed: () {
                  voice(7);
                },
                color: Colors.blueAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
