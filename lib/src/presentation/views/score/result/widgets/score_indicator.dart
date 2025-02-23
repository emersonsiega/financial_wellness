import 'package:financial_wellness/src/domain/domain.dart';
import 'package:financial_wellness/src/presentation/translations/translations.dart';
import 'package:financial_wellness/src/src.dart';
import 'package:flutter/material.dart';

class ScoreIndicator extends StatelessWidget {
  final FinancialWellnessScore score;
  const ScoreIndicator({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            return _buildIndicator(context, constraints.maxWidth);
          },
        ),
        context.spacing.xl.vertical,
        Text(
          score.title(),
          textAlign: TextAlign.center,
          style: context.text.xs.headingSmall.copyWith(
            color: context.colors.foreground.darker,
          ),
        ),
        Text.rich(
          t.shared.score.result.text(
            name: TextSpan(
              text: score.name(),
              style: context.text.xs.paragraph.copyWith(
                color: context.colors.foreground.dark,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          textAlign: TextAlign.center,
          style: context.text.xs.paragraph.copyWith(
            color: context.colors.foreground.dark,
          ),
        ),
      ],
    );
  }

  int get _filledSize {
    return switch (score) {
      FinancialWellnessScore.healthy => 3,
      FinancialWellnessScore.medium => 2,
      FinancialWellnessScore.low => 1,
    };
  }

  Widget _buildIndicator(BuildContext context, double maxWidth) {
    final gap = 10.0;
    final width = maxWidth / 3;
    final filledSize = _filledSize;

    indicatorBuilder(bool filled) => Container(
      width: width,
      height: 16,
      decoration: BoxDecoration(
        color: filled ? score.color(context) : context.colors.background.light,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: context.colors.background.ultraLight,
          strokeAlign: BorderSide.strokeAlignInside,
          width: 2,
        ),
      ),
    );

    return SizedBox(
      height: 16,
      child: Padding(
        padding: EdgeInsets.only(left: gap),
        child: Stack(
          alignment: Alignment.center,
          children:
              List.generate(3, (index) {
                return Positioned(
                  left: switch (index) {
                    2 => (width - gap) * 2,
                    1 => width - gap,
                    _ => 0,
                  },
                  child: indicatorBuilder(index <= filledSize - 1),
                );
              }).reversed.toList(),
        ),
      ),
    );
  }
}
