import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todoapp/data/data.dart';
import 'package:todoapp/utils/extensions.dart';
import 'package:todoapp/widgets/circle_container.dart';

class TaskDetails extends StatelessWidget {
  const TaskDetails(this.task, {super.key});

  final Task task;

  @override
  Widget build(BuildContext context) {
    final style = context.textTheme;
    return Padding(
      padding: EdgeInsets.all(30),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.center, // make children stretch horizontally
          children: [
            CircleContainer(
              color: task.category.color.withValues(alpha: 0.3),
              child: Icon(task.category.icon, color: task.category.color),
            ),
            const Gap(30),
            Text(
              task.title,
              style: style.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(task.time, style: style.titleMedium),
            const Gap(30),
            Visibility(
              visible: !task.isCompleted,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Task to be completed on ${task.date}'),
                  Icon(Icons.check_box, color: task.category.color),
                ],
              ),
            ),
            const Gap(16),
            Divider(thickness: 1.5, color: task.category.color),
            const Gap(16),
            Text(
              task.note.isEmpty
                  ? 'There is no addition note for this task'
                  : task.note,
            ),
            const Gap(16),
            Visibility(
              visible: task.isCompleted,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('task completed'),
                  Icon(Icons.check_box, color: Colors.green),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
