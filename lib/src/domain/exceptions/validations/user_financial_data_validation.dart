import 'package:financial_wellness/src/domain/exceptions/validations/interface/interface.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_financial_data_validation.freezed.dart';

/// Represents the validation states of [UserFinancialData] entity.
@freezed
sealed class UserFinancialDataValidation extends IValidation
    with _$UserFinancialDataValidation {
  const UserFinancialDataValidation._();

  factory UserFinancialDataValidation.invalidAnnualIncome() =
      InvalidAnnualIncomeData;

  factory UserFinancialDataValidation.invalidMonthlyCosts() =
      InvalidMonthlyCostsData;
}
