import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';

final timeProvider = StateProvider<TimeOfDay>((ref) {
  return TimeOfDay.now();
});
