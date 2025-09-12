import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todoapp/data/data.dart';
import 'package:todoapp/utils/extensions.dart';
import 'package:todoapp/widgets/circle_container.dart';

class TaskTitle extends StatelessWidget {
  const TaskTitle(this.task, {super.key, this.onCompleted});

  final Task task;
  final Function(bool?)? onCompleted;

  @override
  Widget build(BuildContext context) {
    final style = context.textTheme; // lowercase 'style' for consistency
    final double iconOpacity = task.isCompleted ? 0.3 : 0.5;
    final backgroundOpacity = task.isCompleted ? 0.1 : 0.3;
    final TextDecoration textDecoration = task.isCompleted
        ? TextDecoration.lineThrough
        : TextDecoration.none;
    final fontWeight = task.isCompleted ? FontWeight.normal : FontWeight.bold;

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          CircleContainer(
            color: task.category.color.withValues(alpha: backgroundOpacity),
            child: Center(
              child: Icon(
                task.category.icon,
                color: task.category.color.withValues(alpha: iconOpacity),
              ),
            ),
          ),
          const Gap(10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.title,
                  style: style.titleMedium?.copyWith(
                    decoration: textDecoration,
                    fontSize: 20,
                    fontWeight: fontWeight,
                  ),
                ),
                Text(
                  task.time,
                  style: style.titleMedium?.copyWith(
                    decoration: textDecoration,
                  ),
                ),
              ],
            ),
          ),
          Checkbox(value: task.isCompleted, onChanged: onCompleted),
        ],
      ),
    );
  }
}
