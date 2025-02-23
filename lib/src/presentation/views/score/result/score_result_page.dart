import 'package:financial_wellness/src/domain/domain.dart';
import 'package:financial_wellness/src/presentation/design_system/design_system.dart';
import 'package:financial_wellness/src/presentation/translations/translations.dart';
import 'package:financial_wellness/src/presentation/views/score/result/widgets/widgets.dart';
import 'package:financial_wellness/src/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScoreResultPage extends StatelessWidget {
  final FinancialWellnessScore score;
  const ScoreResultPage({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: context.colors.background.lighter,
        appBar: const CustomAppBar(),
        body: ListView(
          shrinkWrap: true,
          primary: false,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: context.spacing.xl,
                horizontal: context.spacing.lg,
              ),
              child: Text.rich(
                textAlign: TextAlign.center,
                t.shared.score.result.disclaimer(
                  darker:
                      (text) => TextSpan(
                        text: text,
                        style: context.text.lg.subtitle.copyWith(
                          color: context.colors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                ),
                style: context.text.xs.subtitle.copyWith(
                  color: context.colors.primary,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                context.spacing.lg,
                0,
                context.spacing.lg,
                context.spacing.lg,
              ),
              child: KalshiCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ScoreIndicator(score: score),
                    context.spacing.xxl.vertical,
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: context.spacing.lg,
                      ),
                      child: OutlinedButton(
                        onPressed: () => _finish(context),
                        child: Text(t.shared.score.result.returnCTA),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            context.spacing.xl.vertical,
            const SecurityDisclaimerText(),
          ],
        ),
      ),
    );
  }

  void _finish(BuildContext context) {
    GoRouter.of(context).replace('/');
  }
}
