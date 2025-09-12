import 'package:equatable/equatable.dart';
import 'package:todoapp/utils/utils.dart';

class Task extends Equatable {
  final int? id;
  final String title;
  final String note;
  final String time;
  final String date;
  final TaskCategories category; // <-- ensure enum name matches
  final bool isCompleted;

  const Task({
    this.id,
    required this.title,
    required this.note,
    required this.time,
    required this.date,
    required this.category,
    required this.isCompleted,
  });

  @override
  List<Object> get props {
    return [id ?? 0, title, note, time, date, category, isCompleted];
  }
}
