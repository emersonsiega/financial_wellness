import 'package:financial_wellness/src/constants/constants.dart';
import 'package:financial_wellness/src/data/repositories/repositories.dart';
import 'package:financial_wellness/src/domain/domain.dart';

Future setupDataDI() async {
  getIt.registerFactory<ITaxRateRepository>(LocalTaxRateRepository.new);
}
