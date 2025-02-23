import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Defines the app wide used text styles
abstract class IAppTypography {
  final TextStyle headingSmall;
  final TextStyle subtitle;
  final TextStyle paragraph;
  final TextStyle description;
  final TextStyle button;

  const IAppTypography({
    required this.headingSmall,
    required this.subtitle,
    required this.paragraph,
    required this.description,
    required this.button,
  });
}

/// Extra small text style
class XSTextStyle extends IAppTypography {
  XSTextStyle({
    TextStyle? button,
    TextStyle? description,
    TextStyle? headingSmall,
    TextStyle? paragraph,
    TextStyle? subtitle,
  }) : super(
         button:
             button ??
             GoogleFonts.workSans(
               textStyle: const TextStyle(
                 fontSize: 16,
                 fontWeight: FontWeight.w500,
                 height: 1.0,
               ),
             ),
         description:
             description ??
             GoogleFonts.workSans(
               textStyle: const TextStyle(fontSize: 12, height: 1.5),
             ),
         headingSmall:
             headingSmall ??
             GoogleFonts.rubik(
               textStyle: const TextStyle(
                 fontSize: 20,
                 height: 1.2,
                 fontWeight: FontWeight.w500,
               ),
             ),
         paragraph:
             paragraph ??
             GoogleFonts.workSans(textStyle: const TextStyle(fontSize: 14)),
         subtitle:
             subtitle ??
             GoogleFonts.workSans(
               textStyle: const TextStyle(fontSize: 18, height: 1.5),
             ),
       );
}

/// Large text style
class LGTextStyle extends IAppTypography {
  LGTextStyle({
    TextStyle? button,
    TextStyle? description,
    TextStyle? headingSmall,
    TextStyle? paragraph,
    TextStyle? subtitle,
  }) : super(
         button:
             button ??
             GoogleFonts.workSans(
               textStyle: const TextStyle(
                 fontSize: 16,
                 fontWeight: FontWeight.w500,
               ),
             ),
         description:
             description ??
             GoogleFonts.workSans(textStyle: const TextStyle(fontSize: 12)),
         headingSmall:
             headingSmall ??
             GoogleFonts.rubik(
               textStyle: const TextStyle(fontSize: 24),
               fontWeight: FontWeight.w500,
               height: 1.2,
             ),
         paragraph:
             paragraph ??
             GoogleFonts.workSans(textStyle: const TextStyle(fontSize: 14)),
         subtitle:
             subtitle ??
             GoogleFonts.workSans(textStyle: const TextStyle(fontSize: 20)),
       );
}

/// Creates a [ThemeExtension] to the [AppTypography].
class AppTypographyExtension extends ThemeExtension<AppTypographyExtension> {
  final IAppTypography xs;
  final IAppTypography lg;

  const AppTypographyExtension({required this.xs, required this.lg});

  @override
  AppTypographyExtension copyWith({IAppTypography? xs, IAppTypography? lg}) {
    return AppTypographyExtension(xs: xs ?? this.xs, lg: lg ?? this.lg);
  }

  @override
  AppTypographyExtension lerp(
    ThemeExtension<AppTypographyExtension>? other,
    double t,
  ) {
    if (other is! AppTypographyExtension) return this;
    return AppTypographyExtension(
      xs: XSTextStyle(
        headingSmall:
            TextStyle.lerp(xs.headingSmall, other.xs.headingSmall, t)!,
        subtitle: TextStyle.lerp(xs.subtitle, other.xs.subtitle, t)!,
        paragraph: TextStyle.lerp(xs.paragraph, other.xs.paragraph, t)!,
        description: TextStyle.lerp(xs.description, other.xs.description, t)!,
        button: TextStyle.lerp(xs.button, other.xs.button, t)!,
      ),
      lg: LGTextStyle(
        headingSmall:
            TextStyle.lerp(lg.headingSmall, other.lg.headingSmall, t)!,
        subtitle: TextStyle.lerp(lg.subtitle, other.lg.subtitle, t)!,
        paragraph: TextStyle.lerp(lg.paragraph, other.lg.paragraph, t)!,
        description: TextStyle.lerp(lg.description, other.lg.description, t)!,
        button: TextStyle.lerp(lg.button, other.lg.button, t)!,
      ),
    );
  }
}
