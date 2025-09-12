import 'package:flutter/material.dart';
import 'package:todoapp/config/routers/routers.dart';
import 'package:todoapp/config/theme/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodoApp extends ConsumerWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routeConfig = ref.watch(routersProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light, // ensure AppTheme.light is a ThemeData
      routerConfig: routeConfig,
    );
  }
}
