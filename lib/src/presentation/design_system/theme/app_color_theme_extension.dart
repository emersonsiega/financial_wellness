import 'package:financial_wellness/src/presentation/design_system/color_palette/color_palette.dart';
import 'package:flutter/material.dart';

/// Defines a [ThemeExtension] for [IAppColorPalette]
class AppColorPaletteExtension
    extends ThemeExtension<AppColorPaletteExtension> {
  final IAppColorPalette palette;

  const AppColorPaletteExtension({required this.palette});

  @override
  AppColorPaletteExtension copyWith({IAppColorPalette? palette}) {
    return AppColorPaletteExtension(palette: palette ?? this.palette);
  }

  @override
  AppColorPaletteExtension lerp(
    ThemeExtension<AppColorPaletteExtension>? other,
    double t,
  ) {
    if (other is! AppColorPaletteExtension) return this;
    return AppColorPaletteExtension(palette: other.palette);
  }
}
