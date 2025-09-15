import 'package:flutter_riverpod/legacy.dart';
import 'package:todoapp/data/repositories/repository_provider.dart';
import 'package:todoapp/providers/task/task.dart';

final taskProvider = StateNotifierProvider<TaskNotifier, TaskState>((ref) {
  final repository = ref.watch(taskRepositoryProvider);
  return TaskNotifier(repository);
});
