import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todoapp/data/data.dart';
import 'package:todoapp/providers/providers.dart';
import 'package:todoapp/utils/extensions.dart';

class AppAlert {
  AppAlert._();

  static void displaySnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message, style: context.textTheme.bodyLarge)),
    );
  }

  // alert onLongPress to delete

  static Future<void> showDeleteAlertDialog(
    BuildContext context,
    WidgetRef ref,
    Task task,
  ) async {
    Widget cancelButton = TextButton(
      child: const Text('NO'),
      onPressed: () => context.pop(),
    );

    Widget deleteButton = TextButton(
      child: const Text('YES'),
      onPressed: () async {
        try {
          await ref.read(taskProvider.notifier).deleteTask(task);
          if (context.mounted) {
            context.pop(); // Close dialog
            AppAlert.displaySnackBar(context, 'Task deleted successfully');
          }
        } catch (e) {
          if (context.mounted) {
            AppAlert.displaySnackBar(context, 'Failed to delete task: $e');
          }
        }
      },
    );

    AlertDialog alert = AlertDialog(
      title: const Text('Are you sure you want to delete this task?'),
      actions: [deleteButton, cancelButton],
    );

    // Show the dialog
    await showDialog(
      context: context,
      builder: (ctx) {
        return alert;
      },
    );
  }
}
