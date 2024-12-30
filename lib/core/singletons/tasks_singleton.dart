import '../../features/tasks/data/model/task.dart';

class TasksSingleton {
  // Private variable to store tasks
  List<Task>? _tasks;

  // Private constructor
  TasksSingleton._();

  // Singleton instance
  static final TasksSingleton _instance = TasksSingleton._();

  // Getter for the singleton instance
  static TasksSingleton get instance => _instance;

  // Getter to access tasks
  List<Task>? get tasks => _tasks;

  // Load tasks into the singleton
  void load(List<Task> tasks) {
    _tasks = tasks;
  }

  // Setter to update tasks (optional, based on use case)
  set tasks(List<Task>? tasks) {
    _tasks = tasks;
  }

  // Clear tasks data
  void clear() {
    _tasks = null;
  }

  // Check if tasks are loaded
  bool get isLoaded => _tasks != null && _tasks!.isNotEmpty;
}
