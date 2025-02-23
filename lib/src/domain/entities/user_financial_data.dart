import 'package:financial_wellness/src/domain/entities/interface/interface.dart';
import 'package:financial_wellness/src/domain/exceptions/validations/validations.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_financial_data.freezed.dart';

/// This class holds the system required information about the user financial data.
/// To be considered valid, the data should be non-null and greater than zero.
@freezed
class UserFinancialData extends IEntity<UserFinancialDataValidation>
    with _$UserFinancialData {
  const UserFinancialData._();

  factory UserFinancialData({
    /// Annual gross income
    @Default(0) double annualIncome,

    /// Average monthly costs
    @Default(0) double monthlyCosts,
  }) = _UserFinancialData;

  /// Calculates the annual cost, based on the [monthlyCosts], by multiplying this number by 12 months.
  double get annualCost => 12 * monthlyCosts;

  @override
  List<UserFinancialDataValidation> validate() {
    final response = <UserFinancialDataValidation>[];

    if (annualIncome <= 0.0) {
      response.add(UserFinancialDataValidation.invalidAnnualIncome());
    }

    if (monthlyCosts <= 0.0) {
      response.add(UserFinancialDataValidation.invalidMonthlyCosts());
    }

    return response;
  }
}
