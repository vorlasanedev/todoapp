import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:todoapp/config/routers/routers.dart';
import 'package:todoapp/data/data.dart';
import 'package:todoapp/providers/task/task_provider.dart';
import 'package:todoapp/utils/utils.dart';
import 'package:todoapp/widgets/widgets.dart';

class HomeScreen extends ConsumerWidget {
  //goRouter
  static HomeScreen builder(BuildContext context, GoRouterState state) =>
      const HomeScreen();

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskState = ref.watch(taskProvider);
    final colors = context.colorScheme;
    final deviceSize = context.deviceSize;
    final completedTasks = _completedTasks(taskState.tasks);
    final incompletedTasks = _incompletedTasks(taskState.tasks);

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                // height: 300,
                // width: 200,
                // color: Theme.of(context).colorScheme.primary,
                height: deviceSize.height * 0.3,
                width: deviceSize.width,
                color: colors.primary,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DisplayWhiteText(
                      text: 'Aug 7, 2025',
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                    const Gap(2),
                    DisplayWhiteText(
                      text: 'My Todo List',
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
              // Expanded(
              //   child: Container(
              //     width: deviceSize.width,
              //     color: colors.secondary,
              //   ),
              // ),
            ],
          ),
          Positioned(
            top: 120,
            left: 0,
            right: 0,
            child: SafeArea(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    DisplayListOfTasks(tasks: incompletedTasks),
                    const Gap(20),
                    Text('Complete', style: context.textTheme.headlineMedium),
                    const Gap(20),
                    DisplayListOfTasks(
                      tasks: completedTasks,
                      isCompletedTasks: true,
                    ),

                    const Gap(20),
                    ElevatedButton(
                      onPressed: () => context.push(
                        RouteLocation.createTask,
                        extra: DateTime.now(),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            colors.primary, // Set your desired color here
                        elevation: 4, // Adjust elevation as needed
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: DisplayWhiteText(text: 'Add New task'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // isComplete filter function
  List<Task> _completedTasks(List<Task> tasks) {
    final List<Task> filteredTask = [];
    for (var task in tasks) {
      if (task.isCompleted) {
        filteredTask.add(task);
      }
    }
    return filteredTask;
  }

  List<Task> _incompletedTasks(List<Task> tasks) {
    final List<Task> filteredTask = [];
    for (var task in tasks) {
      if (!task.isCompleted) {
        filteredTask.add(task);
      }
    }
    return filteredTask;
  }
}

// all dependencies
/*
equatable: https://pub.dev/packages/equatable
flex_color_scheme: https://pub.dev/packages/flex_color_scheme/install
flutter_riverpod: https://pub.dev/packages/flutter_riverpod/install
font_awesome: https://pub.dev/packages/font_awesome_flutter/install
gap: https://pub.dev/packages/gap/install
go_router: https://pub.dev/packages/go_router/install
google_fonts: https://pub.dev/packages/google_fonts/install
intl: http://pub.dev/packages/intl/install
path: https://pub.dev/packages/path/install
sqflite: https://pub.dev/packages/sqflite/install
 */
