import 'package:financial_wellness/src/domain/entities/interface/interface.dart';
import 'package:financial_wellness/src/domain/validations/validations.dart';

/// This class holds the system required information about the user financial data.
/// To be considered valid, the data should be non-null and greater than zero.
class UserFinancialData extends IEntity<UserFinancialDataValidation> {
  final double annualIncome;
  final double monthlyCosts;

  UserFinancialData({this.annualIncome = 0.0, this.monthlyCosts = 0.0});

  @override
  List<UserFinancialDataValidation> isValid() {
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
