import 'package:financial_wellness/src/domain/domain.dart';
import 'package:financial_wellness/src/presentation/views/score/input/score_input_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScoreInputController extends Cubit<ScoreInputState> {
  final ICalculateUserFinancialWellnessScore _calculateFinancialWellnessScore;

  ScoreInputController(this._calculateFinancialWellnessScore)
    : super(ScoreInputState.idle());

  void init() {
    emit(ScoreInputState.idle());
  }

  Future calculate(UserFinancialData data) async {
    emit(ScoreInputState.loading(data: data));

    final response = await _calculateFinancialWellnessScore(data);

    /// Two kind of errors can be returned.
    /// Field specific errors or data fetching errors.
    if (response.isLeft) {
      final validationErrors =
          response.left.whereType<UserFinancialDataValidation>();

      if (validationErrors.isNotEmpty) {
        return emit(_handleValidationErrors(validationErrors, data));
      }

      final fetchFailures = response.left.whereType<DataFetchFailure>();
      return emit(
        ScoreInputState.failed(data: data, hasError: fetchFailures.isNotEmpty),
      );
    }

    emit(ScoreInputState.completed(score: response.right));
  }

  ScoreInputState _handleValidationErrors(
    Iterable<UserFinancialDataValidation> validationErrors,
    UserFinancialData data,
  ) {
    bool isAnnualIncomeInvalid = false;
    bool isMonthlyCostsIinvalid = false;

    for (final error in validationErrors) {
      switch (error) {
        case InvalidAnnualIncomeData():
          isAnnualIncomeInvalid = true;
        case InvalidMonthlyCostsData():
          isMonthlyCostsIinvalid = true;
      }
    }

    final newState = ScoreInputState.failed(
      data: data,
      isAnnualIncomeInvalid: isAnnualIncomeInvalid,
      isMonthlyCostsIinvalid: isMonthlyCostsIinvalid,
    );
    return newState;
  }
}
