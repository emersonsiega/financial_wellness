import 'package:financial_wellness/src/domain/domain.dart';
import 'package:financial_wellness/src/presentation/design_system/design_system.dart';
import 'package:financial_wellness/src/presentation/translations/translations.dart';
import 'package:financial_wellness/src/presentation/utils/utils.dart';
import 'package:financial_wellness/src/presentation/views/score/input/score_input_controller.dart';
import 'package:financial_wellness/src/presentation/views/score/input/score_input_state.dart';
import 'package:financial_wellness/src/presentation/views/score/input/widgets/widgets.dart';
import 'package:financial_wellness/src/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ScoreInputPage extends StatefulWidget {
  const ScoreInputPage({super.key});

  @override
  State<ScoreInputPage> createState() => _ScoreInputPageState();
}

class _ScoreInputPageState
    extends ControllerState<ScoreInputPage, ScoreInputController> {
  late UserFinancialData userData;

  @override
  void initState() {
    super.initState();
    userData = UserFinancialData();
    controller.init();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
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
                t.shared.score.input.disclaimer(
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
              padding: EdgeInsets.all(context.spacing.lg),
              child: BlocConsumer<ScoreInputController, ScoreInputState>(
                bloc: controller,
                listener: (context, state) {
                  switch (state) {
                    case ScoreCalculationFailed(:final hasError) when hasError:
                      _showSnackbarError();
                    case ScoreCompleted(:final score):
                      _showResults(score);
                    default:
                  }
                },
                builder: (context, state) {
                  return KalshiCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          t.shared.score.input.title,
                          textAlign: TextAlign.center,
                          style: context.text.xs.headingSmall.copyWith(
                            color: context.colors.foreground.darker,
                          ),
                        ),
                        Text(
                          t.shared.score.input.inputRequest,
                          textAlign: TextAlign.center,
                          style: context.text.xs.paragraph.copyWith(
                            color: context.colors.foreground.regular,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        context.spacing.lg.vertical,
                        Builder(
                          builder: (context) {
                            final error = switch (state) {
                              ScoreCalculationFailed(
                                :final isAnnualIncomeInvalid,
                              )
                                  when isAnnualIncomeInvalid =>
                                t.shared.score.input.validations.annualIncome,
                              _ => null,
                            };

                            return CurrencyFormField(
                              label: t.shared.score.input.annualIncomeInput,
                              value: userData.annualIncome,
                              errorText: error,
                              onChanged: _onChangeAnnualIncome,
                            );
                          },
                        ),
                        Builder(
                          builder: (context) {
                            final error = switch (state) {
                              ScoreCalculationFailed(
                                :final isMonthlyCostsIinvalid,
                              )
                                  when isMonthlyCostsIinvalid =>
                                t.shared.score.input.validations.monthlyCosts,
                              _ => null,
                            };

                            return CurrencyFormField(
                              label: t.shared.score.input.monthlyCostsInput,
                              value: userData.monthlyCosts,
                              errorText: error,
                              onChanged: _onChangeMonthlyCosts,
                            );
                          },
                        ),
                        context.spacing.xs.vertical,
                        FilledButton(
                          onPressed: () => controller.calculate(userData),
                          child: Text(t.shared.score.input.continueCTA),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            context.spacing.xl.vertical,
            const SecurityDisclaimerText(),
          ],
        ),
      ),
    );
  }

  void _showResults(FinancialWellnessScore score) {
    context.go('/result', extra: score);
  }

  void _showSnackbarError() {
    final snackBar = SnackBar(
      content: Text(
        t.shared.score.input.failures.fetching,
        style: context.text.xs.description.copyWith(
          color: context.colors.foreground.ultraLight,
        ),
      ),
      behavior: SnackBarBehavior.floating,
      padding: EdgeInsets.all(context.spacing.lg),
      backgroundColor: context.colors.feedback.attention,
      duration: const Duration(seconds: 4),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _onChangeAnnualIncome(double value) {
    setState(() {
      userData = userData.copyWith(annualIncome: value);
    });
  }

  void _onChangeMonthlyCosts(double value) {
    setState(() {
      userData = userData.copyWith(monthlyCosts: value);
    });
  }
}
