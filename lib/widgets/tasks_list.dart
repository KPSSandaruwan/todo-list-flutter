import 'package:flutter/material.dart';
import 'task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/task_data.dart';

class TaskList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return TaskTile(
                isChecked: taskData.tasks![index].isDone,
                taskTitle: taskData.tasks![index].name,
                checkboxCallback: (checkboxState) {
                  taskData.updateTask(taskData.tasks![index]);
                },
              longPressCallback: () {
                  taskData.deleteTask(taskData.tasks![index]);
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
