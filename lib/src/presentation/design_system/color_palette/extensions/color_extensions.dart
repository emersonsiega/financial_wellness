import 'dart:ui';

extension ColorExtensions on Color {
  Color changeOpacity(double opacity) {
    assert(opacity >= 0.0 && opacity <= 1.0);
    return withAlpha((255.0 * opacity).round());
  }
}
