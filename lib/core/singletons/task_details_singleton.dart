import 'package:aquan/features/tasks/data/model/task_details.dart';

class TaskDetailsSingleton {
  // Private variable to store tasks
  TaskDetails? _taskDetails;

  // Private constructor
  TaskDetailsSingleton._();

  // Singleton instance
  static final TaskDetailsSingleton _instance = TaskDetailsSingleton._();

  // Getter for the singleton instance
  static TaskDetailsSingleton get instance => _instance;

  // Getter to access tasks
  TaskDetails? get taskDetails => _taskDetails;

  // Load tasks into the singleton
  void load(TaskDetails taskDetails) {
    _taskDetails = taskDetails;
  }

  // Setter to update tasks (optional, based on use case)
  set taskDetails(TaskDetails? taskDetails) {
    _taskDetails = taskDetails;
  }

  // Clear tasks data
  void clear() {
    _taskDetails = null;
  }
}
