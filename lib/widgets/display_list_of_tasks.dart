import 'package:flutter/material.dart';
import 'package:todoapp/data/data.dart';
import 'package:todoapp/utils/utils.dart';
import 'package:todoapp/widgets/widgets.dart';

class DisplayListOfTasks extends StatelessWidget {
  const DisplayListOfTasks({
    super.key,
    required this.tasks,
    this.isCompletedTasks = false,
  });

  final List<Task> tasks;
  final bool isCompletedTasks;

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
          : ListView.separated(
              shrinkWrap: true,
              itemCount: tasks.length,
              padding: EdgeInsets.zero,
              itemBuilder: (ctx, index) {
                return InkWell(
                  onLongPress: () {
                    //Todo Delete
                  },
                  onTap: () async {
                    //Todo show task detail
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
