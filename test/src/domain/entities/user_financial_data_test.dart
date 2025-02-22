import 'package:financial_wellness/src/domain/entities/entities.dart';
import 'package:financial_wellness/src/domain/validations/validations.dart';
import 'package:test/test.dart';

void main() {
  group('Successful validation', () {
    test('Should validate data successfully', () {
      final sut = UserFinancialData(annualIncome: 1000, monthlyCosts: 10);
      final result = sut.isValid();
      expect(result, isEmpty);
    });
  });

  group('Unsuccessful validation', () {
    test('Should inform invalid annual income', () {
      final sut = UserFinancialData(annualIncome: 0, monthlyCosts: 10);
      final result = sut.isValid();
      expect(
        result,
        contains(UserFinancialDataValidation.invalidAnnualIncome()),
      );
    });

    test('Should inform invalid montlhy costs', () {
      final sut = UserFinancialData(annualIncome: 1000, monthlyCosts: -10);
      final result = sut.isValid();
      expect(
        result,
        contains(UserFinancialDataValidation.invalidMonthlyCosts()),
      );
    });

    test('Should inform invalid annual income and montlhy costs', () {
      final sut = UserFinancialData();
      final result = sut.isValid();
      expect(
        result,
        containsAll([
          UserFinancialDataValidation.invalidMonthlyCosts(),
          UserFinancialDataValidation.invalidAnnualIncome(),
        ]),
      );
    });
  });
}
