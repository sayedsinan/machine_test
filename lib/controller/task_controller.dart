// task_controller.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:machine_test/model/task.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

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
      }).toList()
        ..sort((a, b) => a.deadline.compareTo(b.deadline)); // Sort by deadline
    });
  }

  void addTask(Task task) async {
    var ref = await firestore.collection('tasks').add(task.toMap());
    task.id = ref.id;
    scheduleTaskNotification(task);
  }

  void updateTask(Task task) async {
    await firestore.collection('tasks').doc(task.id).update(task.toMap());
    scheduleTaskNotification(task);
  }

  Future<void> deleteTask(String taskId) async {
    await firestore.collection('tasks').doc(taskId).delete();
    flutterLocalNotificationsPlugin.cancel(taskId.hashCode);
  }

  void scheduleTaskNotification(Task task) async {
    // Initialize time zones (ensure this is done early in your app, possibly in main.dart)
    // tz.initializeTimeZones();
    tz.setLocalLocation(
        tz.getLocation('your_timezone_name')); // Set your desired time zone

    // Calculate the notification date and time (10 minutes before task deadline)
    var scheduledNotificationDateTime = tz.TZDateTime.from(
      task.deadline.subtract(Duration(minutes: 10)),
      tz.local,
    );

    // Define platform-specific notification details
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'task_channel',
      'Task Notifications',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: false,
    );

    var iOSPlatformChannelSpecifics = DarwinNotificationDetails();

    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );

    // Schedule the notification
    await flutterLocalNotificationsPlugin.zonedSchedule(
      task.id.hashCode,
      'Task Reminder',
      'Your task "${task.title}" is due in 10 minutes',
      scheduledNotificationDateTime,
      platformChannelSpecifics,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }
}
