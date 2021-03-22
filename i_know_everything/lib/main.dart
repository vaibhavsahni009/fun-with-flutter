import 'package:flutter/material.dart';
import 'package:i_know_everything/pages/question-answer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'I Know Everything',
      home: QuestionAnswerPage(),
      theme: ThemeData(primarySwatch: Colors.purple),
    );
  }
}
