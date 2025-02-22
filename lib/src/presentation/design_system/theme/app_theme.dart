import 'package:financial_wellness/src/presentation/design_system/color_palette/app_color_palette.dart';
import 'package:financial_wellness/src/presentation/design_system/theme/app_color_theme_extension.dart';
import 'package:financial_wellness/src/presentation/design_system/typography/typography.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTheme {
  static ThemeData buildTheme() {
    const colorPalette = AppColorPalette();

    final textTheme = AppTypographyExtension(
      xs: XSTextStyle(),
      lg: LGTextStyle(),
    );

    return ThemeData(
      extensions: [
        const AppColorPaletteExtension(palette: colorPalette),
        textTheme,
      ],
      textTheme: GoogleFonts.workSansTextTheme(),
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: colorPalette.primary,
        onPrimary: colorPalette.foreground.ultraLight,
        secondary: colorPalette.brand,
        onSecondary: colorPalette.foreground.ultraLight,
        error: colorPalette.feedback.attention,
        onError: colorPalette.foreground.ultraLight,
        surface: colorPalette.background.ultraLight,
        onSurface: colorPalette.foreground.ultraDark,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: ButtonStyle(
          textStyle: WidgetStatePropertyAll(textTheme.lg.button),
          minimumSize: const WidgetStatePropertyAll(Size(0, 56)),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          textStyle: WidgetStatePropertyAll(textTheme.lg.button),
          minimumSize: const WidgetStatePropertyAll(Size(0, 56)),
          side: WidgetStatePropertyAll(
            BorderSide(width: 2, color: colorPalette.primary),
          ),
        ),
      ),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: colorPalette.background.ultraLight,
        elevation: 0,
        toolbarHeight: 80,
      ),
    );
  }
}
