import 'package:financial_wellness/src/presentation/design_system/color_palette/color_palette.dart';
import 'package:financial_wellness/src/presentation/design_system/spacing/spacing.dart';
import 'package:financial_wellness/src/presentation/design_system/theme/theme.dart';
import 'package:financial_wellness/src/presentation/design_system/typography/typography.dart';
import 'package:flutter/material.dart';

/// [BuildContext] set of extensions
extension BuildContextExtensions on BuildContext {
  /// Access app default color palette
  IAppColorPalette get colors =>
      Theme.of(this).extension<AppColorPaletteExtension>()!.palette;

  /// Access app default text styles
  AppTypographyExtension get text =>
      Theme.of(this).extension<AppTypographyExtension>()!;

  AppSpacing get spacing => AppSpacing();
}
