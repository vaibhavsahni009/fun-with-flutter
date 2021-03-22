import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:ui' as ui;

class QuestionAnswerPage extends StatefulWidget {
  @override
  _QuestionAnswerPageState createState() => _QuestionAnswerPageState();
}

class _QuestionAnswerPageState extends State<QuestionAnswerPage> {
  TextEditingController questionFieldController = TextEditingController();
  String currentAnswer;
  GlobalKey<ScaffoldMessengerState> _scaffoldState =
      GlobalKey<ScaffoldMessengerState>();
  handleAnswers() async {
    String question = questionFieldController.text?.trim();

    if (question == null ||
        question.length == 0 ||
        question[question.length - 1] != '?') {
      _scaffoldState.currentState.showSnackBar(
        SnackBar(
          content: Text('Please Search a valid question'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    dynamic Url = Uri.parse("https://yesno.wtf/api");
    try {
      http.Response response = await http.get(Url);
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);

        setState(() {
          currentAnswer = data['image'];
          print(currentAnswer);
        });
      }
    } catch (e) {
      print(e);
    }
  }

  handleReset() {
    setState(() {
      questionFieldController.clear();

      currentAnswer = null;
    });
  }

  @override
  Widget build(BuildContext context) {
// ui.platformViewRegistry.registerViewFactory(
//   'video-container',
//   (int viewId) => IFrameElement()
//     ..id = 'my-iframe'
//     ..width = '100%'
//     ..height = '100%'
//     ..src = 'assets/web_elements/agora_container.html'
//     ..allow = "camera; microphone"
//     ..style.border = 'none');

    return ScaffoldMessenger(
      key: _scaffoldState,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('I Know Everything'),
          backgroundColor: Colors.purple,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: TextField(
                controller: questionFieldController,
                decoration: InputDecoration(
                    labelText: 'Ask a yes or no question',
                    border: OutlineInputBorder()),
              ),
              width: 0.5 * MediaQuery.of(context).size.width,
            ),
            SizedBox(
              height: 20,
            ),
            if (currentAnswer != null)
              // HtmlElementView(viewType: 'image-viewer').build(context),
              // Image.network(currentAnswer),
              Container(
                width: 400,
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      image: NetworkImage(currentAnswer), fit: BoxFit.fill),
                ),
              ),
            if (currentAnswer != null)
              SizedBox(
                height: 20,
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: handleAnswers,
                  child: Text('Get Answer'),
                  style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: handleReset,
                  child: Text('Reset'),
                  style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
