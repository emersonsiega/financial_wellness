import 'package:either_dart/either.dart';
import 'package:financial_wellness/src/domain/entities/entities.dart';
import 'package:financial_wellness/src/domain/exceptions/interface/interface.dart';
import 'package:financial_wellness/src/domain/repositories/repositories.dart';

/// Calculates the user financial wellness score, represented by [FinancialWellnessScore],
/// based on the relation between his annual costs and his annual net compensation,
/// taking into account the current taxes rate.
///
/// ### Input:
/// - TAX: Current annual tax rate;
/// - COSTS: User annual costs;
/// - INCOME: User annual gross income - Annual tax;
///
/// ### Rule:
/// - healthy: COSTS <= 25% of INCOME
/// - medium: COSTS > 25% and <= 75% of INCOME
/// - low: COSTS > 75% of INCOME
abstract class ICalculateUserFinancialWellnessScore {
  Future<Either<List<IException>, FinancialWellnessScore>> call(
    UserFinancialData data,
  );
}

class CalculateUserFinancialWellnessScore
    implements ICalculateUserFinancialWellnessScore {
  final ITaxRateRepository _repository;
  const CalculateUserFinancialWellnessScore(this._repository);

  @override
  Future<Either<List<IException>, FinancialWellnessScore>> call(
    UserFinancialData data,
  ) async {
    final validations = data.validate();
    if (validations.isNotEmpty) return Left(validations);

    final response = await _repository.getTaxes();
    if (response.isLeft) return Left([response.left]);

    final taxes = response.right;

    final annualTax = data.annualIncome * taxes.annual;
    final netIncome = data.annualIncome - annualTax;
    final relationCostsIncome = data.annualCost * 100 / netIncome;

    final score = switch (relationCostsIncome) {
      <= 25 => FinancialWellnessScore.healthy,
      > 25 && <= 75 => FinancialWellnessScore.medium,
      _ => FinancialWellnessScore.low,
    };
    return Right(score);
  }
}
