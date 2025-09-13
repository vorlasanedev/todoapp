import 'package:flutter_riverpod/legacy.dart';
import 'package:todoapp/utils/utils.dart';

final categoryProvider = StateProvider.autoDispose<TaskCategories>((ref) {
  return TaskCategories.others;
});
