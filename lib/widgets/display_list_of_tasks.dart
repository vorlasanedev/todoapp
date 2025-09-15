import 'package:flutter/material.dart';
import 'package:todoapp/data/data.dart';
import 'package:todoapp/utils/utils.dart';
import 'package:todoapp/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DisplayListOfTasks extends ConsumerWidget {
  const DisplayListOfTasks({
    super.key,
    required this.tasks,
    this.isCompletedTasks = false,
  });

  final List<Task> tasks;
  final bool isCompletedTasks;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          : ListView.separated(
              shrinkWrap: true,
              itemCount: tasks.length,
              padding: EdgeInsets.zero,
              itemBuilder: (ctx, index) {
                final task = tasks[index]; // Define task here
                return InkWell(
                  onLongPress: () {
                    // Call your custom alert dialog
                    AppAlert.showDeleteAlertDialog(context, ref, task);
                  },
                  onTap: () async {
                    // Show task detail
                    await showModalBottomSheet(
                      context: context,
                      builder: (ctx) {
                        return TaskDetails(tasks[index]);
                      },
                    );
                  },
                  child: TaskTitle(tasks[index]),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(thickness: 1.5);
              },
            ),
    );
  }
}
