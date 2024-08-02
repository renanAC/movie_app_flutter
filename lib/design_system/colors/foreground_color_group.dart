import 'dart:ui';

import 'package:my_flutter_app/design_system/colors/primitive_color_palette.dart';

class ForegroundColorGroup {
  const ForegroundColorGroup.light({
    this.primary = const ForegroundColorAspectPrimaryLight(),
  });

  const ForegroundColorGroup.dark({
    this.primary = const ForegroundColorAspectPrimaryDark(),
  });

  final ForegroundColorAspectPrimary primary;
}

class ForegroundColorAspectPrimary {
  const ForegroundColorAspectPrimary({
    this.dark = PrimitiveColorPalette.gray900,
    this.medium = PrimitiveColorPalette.gray500,
    this.light = PrimitiveColorPalette.gray300,
  });
  final Color dark;
  final Color medium;
  final Color light;
}

class ForegroundColorAspectPrimaryLight extends ForegroundColorAspectPrimary {
  const ForegroundColorAspectPrimaryLight({
    super.dark = PrimitiveColorPalette.gray900,
    super.medium = PrimitiveColorPalette.gray500,
    super.light = PrimitiveColorPalette.gray300,
  });
}

class ForegroundColorAspectPrimaryDark extends ForegroundColorAspectPrimary {
  const ForegroundColorAspectPrimaryDark({
    super.dark = PrimitiveColorPalette.gray900,
    super.medium = PrimitiveColorPalette.gray500,
    super.light = PrimitiveColorPalette.gray300,
  });
}
