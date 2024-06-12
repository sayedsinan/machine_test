// task_model.dart
class Task {
  String? id;
  String title;
  String description;
  DateTime deadline;
  int duration;
  bool isCompleted;

  Task(
      {this.id,
      required this.title,
      required this.description,
      required this.deadline,
      required this.duration,
      this.isCompleted = false});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'deadline': deadline.toIso8601String(),
      'duration': duration,
      'isCompleted': isCompleted,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map, String id) {
    return Task(
      id: id,
      title: map['title'],
      description: map['description'],
      deadline: DateTime.parse(map['deadline']),
      duration: map['duration'],
      isCompleted: map['isCompleted'],
    );
  }
}
