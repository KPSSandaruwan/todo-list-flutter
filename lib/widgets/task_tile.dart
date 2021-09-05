import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {
  @override
  _TaskTileState createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'Task 1',
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: TaskChecker(
        checkBoxState: isChecked,
        toggleCheckboxState: (bool currentCheckboxState) {
          setState(() {
            isChecked = currentCheckboxState;
          });
        }
      ),
    );
  }
}

class TaskChecker extends StatelessWidget {
  final bool checkBoxState;
  final Function toggleCheckboxState;

  TaskChecker({required this.checkBoxState,required this.toggleCheckboxState});

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: checkBoxState,
      onChanged: toggleCheckboxState,
    );
  }
}
