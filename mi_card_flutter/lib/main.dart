import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigo,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('images/aang.png'),
              ),
              Text(
                'Avatar Aang',
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'THE LAST AIRBENDER',
                style: TextStyle(
                  fontFamily: 'SourceSansPro',
                  color: Colors.indigo.shade100,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.5,
                ),
              ),
              SizedBox(
                height: 25,
                width: 250,
                child: Divider(
                  color: Colors.indigo.shade100,
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Colors.indigo,
                  ),
                  title: Text(
                    '+91 123 456 7890',
                    style: TextStyle(
                      fontFamily: 'SourceSansPro',
                      color: Colors.indigo.shade900,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Colors.indigo,
                  ),
                  title: Text(
                    'airnomad@avatar.com',
                    style: TextStyle(
                      fontFamily: 'SourceSansPro',
                      color: Colors.indigo.shade900,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
