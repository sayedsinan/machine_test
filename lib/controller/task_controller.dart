// task_controller.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:machine_test/model/task.dart';

class TaskController extends GetxController {
  static TaskController instance = Get.find();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  var tasks = <Task>[].obs;

  @override
  void onInit() {
    tasks.bindStream(getTasks());
    super.onInit();
  }

  Stream<List<Task>> getTasks() {
    return firestore.collection('tasks').snapshots().map((query) {
      return query.docs.map((doc) {
        return Task.fromMap(doc.data(), doc.id);
      }).toList();
    });
  }

  void addTask(Task task) async {
    var ref = await firestore.collection('tasks').add(task.toMap());
    task.id = ref.id;
    // scheduleNotification(task);
  }

  void updateTask(Task task) async {
    await firestore.collection('tasks').doc(task.id).update(task.toMap());
    // scheduleNotification(task);
  }

  Future<void> deleteTask(String taskId) async {
    await firestore.collection('tasks').doc(taskId).delete();
    flutterLocalNotificationsPlugin.cancel(taskId.hashCode);
  }

  void scheduleNotification(Task task) async {
    var scheduledNotificationDateTime =
        task.deadline.subtract(Duration(minutes: 10));
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'task_channel', 'Task Notifications',
        importance: Importance.max, priority: Priority.high, showWhen: false);
    var iOSPlatformChannelSpecifics = DarwinNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);

    //   await flutterLocalNotificationsPlugin.schedule(
    //     task.id.hashCode,
    //     'Task Reminder',
    //     'Your task "${task.title}" is due in 10 minutes',
    //     scheduledNotificationDateTime,
    //     platformChannelSpecifics,
    //     uiLocalNotificationDateInterpretation:
    //         UILocalNotificationDateInterpretation.absoluteTime,
    //   );
    // }
  }
}
