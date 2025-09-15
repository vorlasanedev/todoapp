import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:todoapp/config/routers/routers.dart';
import 'package:todoapp/data/models/task.dart';
import 'package:todoapp/providers/providers.dart';
import 'package:todoapp/utils/utils.dart';
import 'package:todoapp/widgets/widgets.dart';

class CreateTaskScreen extends ConsumerStatefulWidget {
  //goRouter
  static CreateTaskScreen builder(BuildContext context, GoRouterState state) =>
      const CreateTaskScreen();

  const CreateTaskScreen({super.key});

  @override
  ConsumerState<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends ConsumerState<CreateTaskScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;

    return Scaffold(
      appBar: AppBar(title: DisplayWhiteText(text: 'Add new task')),

      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              CommonTextField(
                title: 'Task Title',
                hintText: 'title',
                controller: _titleController,
              ),
              const SelectCategory(),
              const SelectDateTime(),
              CommonTextField(
                title: 'Note',
                hintText: 'Task note',
                maxLines: 7,
                controller: _noteController,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      colors.primary, // Set your desired button color here
                ),
                onPressed: _createTask,
                child: DisplayWhiteText(text: 'Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _createTask() async {
    final title = _titleController.text.trim();
    final note = _noteController.text.trim();
    final date = ref.watch(dateProvider);
    final time = ref.watch(timeProvider);
    final category = ref.watch(categoryProvider);

    if (title.isNotEmpty) {
      final task = Task(
        title: title,
        note: note,
        date: DateFormat.yMMM().format(date),
        time: Helpers.timeToString(time),
        category: category,
        isCompleted: false,
      );

      try {
        await ref.read(taskProvider.notifier).createTask(task);

        // Check if the widget is still mounted before using the context
        if (!mounted) return;

        AppAlert.displaySnackBar(context, 'Task created successfully');
        context.go(RouteLocation.home);
      } catch (e) {
        // Optionally handle any errors here
      }
    } else {
      // Make sure the context usage is safe
      if (!mounted) return;
      AppAlert.displaySnackBar(context, "Task title can't be empty");
    }
  }
}
