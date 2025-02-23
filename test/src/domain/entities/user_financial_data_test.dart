import 'package:financial_wellness/src/domain/entities/entities.dart';
import 'package:financial_wellness/src/domain/exceptions/validations/validations.dart';
import 'package:test/test.dart';

void main() {
  group('Successful validation', () {
    test('Should validate data successfully', () {
      final sut = UserFinancialData(annualIncome: 1000, monthlyCosts: 10);
      final result = sut.validate();
      expect(result, isEmpty);
    });
  });

  group('Unsuccessful validation', () {
    test('Should inform invalid annual income', () {
      final sut = UserFinancialData(annualIncome: 0, monthlyCosts: 10);
      final result = sut.validate();
      expect(
        result,
        contains(UserFinancialDataValidation.invalidAnnualIncome()),
      );
    });

    test('Should inform invalid montlhy costs', () {
      final sut = UserFinancialData(annualIncome: 1000, monthlyCosts: -10);
      final result = sut.validate();
      expect(
        result,
        contains(UserFinancialDataValidation.invalidMonthlyCosts()),
      );
    });

    test('Should inform invalid annual income and montlhy costs', () {
      final sut = UserFinancialData();
      final result = sut.validate();
      expect(
        result,
        containsAll([
          UserFinancialDataValidation.invalidMonthlyCosts(),
          UserFinancialDataValidation.invalidAnnualIncome(),
        ]),
      );
    });
  });

  group('Annual costs calculation', () {
    test('Should calculate the annual costs', () {
      final sut = UserFinancialData(annualIncome: 1000, monthlyCosts: 10);
      final result = sut.annualCost;
      expect(result, 120);
    });
  });
}
