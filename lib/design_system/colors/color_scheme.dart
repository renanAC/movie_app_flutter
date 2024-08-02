import 'package:flutter/material.dart';
import 'package:my_flutter_app/design_system/colors/foreground_color_group.dart';

abstract interface class MovieAppColorScheme {
  ForegroundColorGroup get foreground;
}

class RegularColorScheme implements MovieAppColorScheme {
  RegularColorScheme({required this.mode});
  final Brightness mode;
  @override
  ForegroundColorGroup get foreground => mode == Brightness.dark
      ? const ForegroundColorGroup.dark()
      : const ForegroundColorGroup.light();
}
