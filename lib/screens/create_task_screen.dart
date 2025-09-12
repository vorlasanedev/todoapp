import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todoapp/utils/utils.dart';
import 'package:todoapp/widgets/widgets.dart';

class CreateTaskScreen extends StatefulWidget {
  //goRouter
  static CreateTaskScreen builder(BuildContext context, GoRouterState state) =>
      const CreateTaskScreen();

  const CreateTaskScreen({super.key});

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;

    return Scaffold(
      appBar: AppBar(title: DisplayWhiteText(text: 'Add new task')),

      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            const CommonTextField(title: 'Task Title', hintText: 'title'),
            SelectDartTime(),
            const CommonTextField(
              title: 'Note',
              hintText: 'Task note',
              maxLines: 7,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    colors.primary, // Set your desired button color here
              ),
              onPressed: () {},
              child: DisplayWhiteText(text: 'Save'),
            ),
          ],
        ),
      ),
    );
  }
}
