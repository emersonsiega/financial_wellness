import 'package:flutter/material.dart';

/// Default app spacing style
class AppSpacing {
  /// Extra small - 8
  double get xs => 8;

  /// Small - 11
  double get sm => 11;

  /// Large - 16
  double get lg => 16;

  /// Extra large - 24
  double get xl => 24;

  /// Extra extra large - 24
  double get xxl => 32;
}

extension AppSpacingExtension on double {
  SizedBox get vertical => SizedBox(height: this);
  SizedBox get horizontal => SizedBox(width: this);
}
