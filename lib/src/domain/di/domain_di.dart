import 'package:financial_wellness/src/constants/constants.dart';
import 'package:financial_wellness/src/domain/repositories/repositories.dart';
import 'package:financial_wellness/src/domain/usecases/usecases.dart';

Future setupDomainDI() async {
  getIt.registerFactory<ICalculateUserFinancialWellnessScore>(
    () => CalculateUserFinancialWellnessScore(getIt.get<ITaxRateRepository>()),
  );
}
