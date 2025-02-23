import 'package:financial_wellness/src/domain/domain.dart';
import 'package:financial_wellness/src/presentation/design_system/design_system.dart';
import 'package:financial_wellness/src/presentation/translations/translations.g.dart';
import 'package:flutter/widgets.dart';

extension FinancialWellnessScoreExtensions on FinancialWellnessScore {
  Color color(BuildContext context) {
    return switch (this) {
      FinancialWellnessScore.healthy => context.colors.feedback.success,
      FinancialWellnessScore.medium => context.colors.feedback.warning,
      FinancialWellnessScore.low => context.colors.feedback.attention,
    };
  }

  String title() {
    return t.shared.score.result.title(score: this);
  }

  String name() {
    return t.shared.score.result.name(score: this);
  }
}
