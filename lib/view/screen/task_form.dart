// task_form_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine_test/controller/task_controller.dart';
import 'package:machine_test/model/task.dart';

class TaskFormScreen extends StatelessWidget {
  final TaskController taskController = Get.find<TaskController>();
  final Task? task;

  TaskFormScreen({this.task});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';
  DateTime deadline = DateTime.now();
  int duration = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(task == null ? 'Add Task' : 'Update Task')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: task?.title ?? '',
                decoration: InputDecoration(labelText: 'Title'),
                onSaved: (value) => title = value!,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              TextFormField(
                initialValue: task?.description ?? '',
                decoration: InputDecoration(labelText: 'Description'),
                onSaved: (value) => description = value!,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              TextFormField(
                initialValue: task?.duration.toString() ?? '',
                decoration: InputDecoration(labelText: 'Duration (in minutes)'),
                onSaved: (value) => duration = int.parse(value!),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the task duration';
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    final newTask = Task(
                      id: task?.id,
                      title: title,
                      description: description,
                      deadline: deadline,
                      duration: duration,
                      isCompleted: task?.isCompleted ?? false,
                    );
                    if (task == null) {
                      taskController.addTask(newTask);
                    } else {
                      taskController.updateTask(newTask);
                    }
                    Get.back();
                  }
                },
                child: Text(task == null ? 'Add Task' : 'Update Task'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
