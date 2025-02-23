import 'package:financial_wellness/src/constants/constants.dart';
import 'package:financial_wellness/src/domain/domain.dart';
import 'package:financial_wellness/src/presentation/views/views.dart';

Future setupPresentationDI() async {
  getIt.registerFactory<ScoreInputController>(
    () => ScoreInputController(getIt.get<ICalculateUserFinancialWellnessScore>()),
  );
}
