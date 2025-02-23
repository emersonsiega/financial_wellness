import 'package:financial_wellness/src/domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'score_input_state.freezed.dart';

@freezed
sealed class ScoreInputState with _$ScoreInputState {
  const ScoreInputState._();

  /// No errors, no data, no actions. The initial and idle state of the page.
  factory ScoreInputState.idle() = ScoreInputInitialState;

  /// The calculation was requested and is still loading
  factory ScoreInputState.loading({required UserFinancialData data}) =
      ScoreInputLoading;

  //// The score calculation has failed.
  factory ScoreInputState.failed({
    required UserFinancialData data,

    /// Global kind of error, during data fetching for instance.
    @Default(false) bool hasError,

    /// Field errors
    @Default(false) bool isAnnualIncomeInvalid,
    @Default(false) bool isMonthlyCostsIinvalid,
  }) = ScoreCalculationFailed;

  /// The score calculation has successfully completed
  factory ScoreInputState.completed({required FinancialWellnessScore score}) =
      ScoreCompleted;
}
