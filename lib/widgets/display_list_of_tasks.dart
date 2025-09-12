import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todoapp/data/data.dart';
import 'package:todoapp/utils/utils.dart';
import 'package:todoapp/widgets/common_container.dart';

class DisplayListOfTasks extends StatelessWidget {
  const DisplayListOfTasks({
    super.key,
    required this.tasks,
    this.isCompletedTasks = false,
  });

  final List<Task> tasks;
  final isCompletedTasks;

  @override
  Widget build(BuildContext context) {
    final deviceSize = context.deviceSize;
    final height = isCompletedTasks
        ? deviceSize.height * 0.25
        : deviceSize.height * 0.3;
    final emptyTasksMessage = isCompletedTasks
        ? 'There is no completed task yet!'
        : 'There is no task todo!';

    return CommonContainer(
      height: height,
      child: tasks.isEmpty
          ? Center(
              child: Text(
                emptyTasksMessage,
                style: context.textTheme.headlineSmall,
              ),
            )
          : ListView.builder(
              shrinkWrap: true,
              itemCount: tasks.length,
              padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
              itemBuilder: (ctx, index) {
                final task = tasks[index];
                return Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(9.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: task.category.color.withOpacity(0.3),
                        border: Border.all(
                          width: 2,
                          color: task.category.color,
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          task.category.icon,
                          color: task.category.color,
                        ),
                      ),
                    ),
                    const Gap(10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [Text(task.title), Text(task.time)],
                      ),
                    ),
                    Checkbox(value: task.isCompleted, onChanged: (value) {}),
                  ],
                );
              },
            ),
    );
  }
}
