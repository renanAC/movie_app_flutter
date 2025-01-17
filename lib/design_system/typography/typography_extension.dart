import 'package:flutter/material.dart';
import 'package:my_flutter_app/design_system/colors/primitive_color_palette.dart';

extension Weight on TextStyle {
  TextStyle get regular =>
      copyWith(fontWeight: FontWeight.w400, fontFamily: fontFamily);

  TextStyle get semibold =>
      copyWith(fontWeight: FontWeight.w500, fontFamily: fontFamily);

  TextStyle get bold =>
      copyWith(fontWeight: FontWeight.w700, fontFamily: fontFamily);
}

extension Color on TextStyle {
  TextStyle get black =>
      copyWith(color: PrimitiveColorPalette.gray900, fontFamily: fontFamily);

  TextStyle get white =>
      copyWith(color: PrimitiveColorPalette.gray100, fontFamily: fontFamily);
}
