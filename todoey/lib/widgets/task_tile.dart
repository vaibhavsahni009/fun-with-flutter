import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function checkboxCallback;
  final Function deleteCallback;

  TaskTile(
      {this.isChecked,
      this.taskTitle,
      this.checkboxCallback,
      this.deleteCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: deleteCallback,
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        value: isChecked,
        onChanged: checkboxCallback,
        activeColor: Colors.lightBlueAccent,
      ),
    );
  }
}
