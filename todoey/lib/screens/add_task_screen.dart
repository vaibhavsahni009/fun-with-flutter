import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todoey/models/task_data.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatelessWidget {
  final Function addTaskList;

  AddTaskScreen({this.addTaskList});

  @override
  Widget build(BuildContext context) {
    String taskTitle;

    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(30.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 30,
              ),
            ),
            TextField(
              onChanged: (value) {
                taskTitle = value;
              },
              autofocus: true,
              textAlign: TextAlign.center,
              cursorColor: Colors.lightBlueAccent,
            ),
            FlatButton(
              child: Text('ADD'),
              color: Colors.lightBlueAccent,
              onPressed: () {
                Provider.of<TaskData>(context, listen: false)
                    .addTask(taskTitle);
                Navigator.pop(context);
              },
              textColor: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
