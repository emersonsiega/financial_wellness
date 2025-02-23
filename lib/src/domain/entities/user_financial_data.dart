import 'package:financial_wellness/src/domain/entities/interface/interface.dart';
import 'package:financial_wellness/src/domain/exceptions/validations/validations.dart';

/// This class holds the system required information about the user financial data.
/// To be considered valid, the data should be non-null and greater than zero.
class UserFinancialData extends IEntity<UserFinancialDataValidation> {
  /// Annual gross income
  final double annualIncome;

  /// Average monthly costs
  final double monthlyCosts;

  UserFinancialData({this.annualIncome = 0.0, this.monthlyCosts = 0.0});

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
