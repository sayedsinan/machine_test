import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machine_test/controller/controller.dart';
import 'package:machine_test/controller/task_controller.dart';
import 'package:machine_test/controller/theme_controller.dart';
import 'package:machine_test/view/screen/task_form.dart';
import 'package:machine_test/view/style/style.dart';

class TaskListScreen extends StatelessWidget {
  final TaskController taskController = Get.find<TaskController>();
  final AuthController authController = Get.find<AuthController>();
  final ThemeController themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Obx(
          () => Text(
            'Tasks',
            style: myStyle(
              fontSize: 20,
              color: themeController.isDarkMode.value
                  ? Colors.white
                  : Colors.black,
            ),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.lightbulb_outline), // Icon for toggling theme
          onPressed: () {
            themeController
                .toggleTheme(!themeController.isDarkMode.value); // Toggle theme
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.door_back_door_sharp),
            onPressed: () {
              authController.signOut();
            },
          ),
        ],
      ),
      body: Obx(() {
        if (taskController.tasks.isEmpty) {
          return Center(
            child: Text(
              'No tasks yet.',
              style: myStyle(fontSize: 15),
            ),
          );
        }

        return ListView.builder(
          itemCount: taskController.tasks.length,
          itemBuilder: (context, index) {
            final task = taskController.tasks[index];

            return Dismissible(
              key: UniqueKey(),
              direction: DismissDirection.horizontal,
              background: Container(
                color: Colors.blue,
                child: Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
              ),
              secondaryBackground: Container(
                color: Colors.red,
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
              confirmDismiss: (direction) async {
                if (direction == DismissDirection.endToStart) {
                  // Handle swipe left (delete)
                  return await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Confirm Delete'),
                        content: Text(
                            'Are you sure you want to delete "${task.title}"?'),
                        actions: [
                          TextButton(
                            onPressed: () =>
                                Navigator.pop(context, false), // Cancel
                            child: Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              taskController
                                  .deleteTask(task.id!)
                                  .then((success) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        'Error deleting task. Please try again.'),
                                  ),
                                );
                              });
                              Navigator.pop(context, true); // Confirm deletion
                            },
                            child: Text('Delete'),
                          ),
                        ],
                      );
                    },
                  );
                } else if (direction == DismissDirection.startToEnd) {
                  // Handle swipe right (edit)
                  Get.to(() => TaskFormScreen(task: task));
                  return false; // Don't dismiss the item on swipe right (edit)
                }
                return false; // Shouldn't reach here
              },
              child: ListTile(
                title: Text(
                  task.title,
                  style: TextStyle(
                    decoration: task.isCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
                subtitle:
                    task.description != null ? Text(task.description!) : null,
                trailing: Checkbox(
                  value: task.isCompleted,
                  onChanged: (value) {
                    task.isCompleted = value!;
                    taskController.updateTask(task);
                  },
                ),
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Get.to(() => TaskFormScreen());
        },
      ),
    );
  }
}
