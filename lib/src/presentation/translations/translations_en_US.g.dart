///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'translations.g.dart';

// Path: <root>
typedef TranslationsEnUs = Translations; // ignore: unused_element
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.enUs,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en-US>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	// Translations
	late final TranslationsSharedEnUs shared = TranslationsSharedEnUs.internal(_root);
}

// Path: shared
class TranslationsSharedEnUs {
	TranslationsSharedEnUs.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsSharedScoreEnUs score = TranslationsSharedScoreEnUs.internal(_root);
}

// Path: shared.score
class TranslationsSharedScoreEnUs {
	TranslationsSharedScoreEnUs.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsSharedScoreInputEnUs input = TranslationsSharedScoreInputEnUs.internal(_root);
	late final TranslationsSharedScoreResultEnUs result = TranslationsSharedScoreResultEnUs.internal(_root);
	String get securityDisclaimer => 'Your financial information is encrypted and\nsecure. We\'ll never share or sell any of your\npersonal data.';
}

// Path: shared.score.input
class TranslationsSharedScoreInputEnUs {
	TranslationsSharedScoreInputEnUs.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	TextSpan disclaimer({required InlineSpanBuilder darker}) => TextSpan(children: [
		const TextSpan(text: 'Let\'s find out your '),
		darker('financial\nwellness score.'),
	]);
	String get title => 'Financial wellness test';
	String get inputRequest => 'Enter your financial information below';
	String get annualIncomeInput => 'Annual income';
	String get monthlyCostsInput => 'Monthly costs';
	String get continueCTA => 'Continue';
	late final TranslationsSharedScoreInputValidationsEnUs validations = TranslationsSharedScoreInputValidationsEnUs.internal(_root);
	late final TranslationsSharedScoreInputFailuresEnUs failures = TranslationsSharedScoreInputFailuresEnUs.internal(_root);
}

// Path: shared.score.result
class TranslationsSharedScoreResultEnUs {
	TranslationsSharedScoreResultEnUs.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	TextSpan disclaimer({required InlineSpanBuilder darker}) => TextSpan(children: [
		const TextSpan(text: 'Here\'s your '),
		darker('financial wellness\nscore.'),
	]);
	String name({required FinancialWellnessScore score}) {
		switch (score) {
			case FinancialWellnessScore.healthy:
				return 'Healthy';
			case FinancialWellnessScore.medium:
				return 'Average';
			case FinancialWellnessScore.low:
				return 'Unhealthy';
		}
	}
	String title({required FinancialWellnessScore score}) {
		switch (score) {
			case FinancialWellnessScore.healthy:
				return 'Congratulations!';
			case FinancialWellnessScore.medium:
				return 'There is room for\nimprovement.';
			case FinancialWellnessScore.low:
				return 'Caution!';
		}
	}
	TextSpan text({required InlineSpan name}) => TextSpan(children: [
		const TextSpan(text: 'Your financial wellness score is\n'),
		name,
		const TextSpan(text: '.'),
	]);
	String get returnCTA => 'Return';
}

// Path: shared.score.input.validations
class TranslationsSharedScoreInputValidationsEnUs {
	TranslationsSharedScoreInputValidationsEnUs.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get annualIncome => 'Annual income should be greater than zero';
	String get monthlyCosts => 'Monthly costs should be greater than zero';
}

// Path: shared.score.input.failures
class TranslationsSharedScoreInputFailuresEnUs {
	TranslationsSharedScoreInputFailuresEnUs.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get fetching => 'Something wrong happened. Try again later!';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'shared.score.input.disclaimer': return ({required InlineSpanBuilder darker}) => TextSpan(children: [
				const TextSpan(text: 'Let\'s find out your '),
				darker('financial\nwellness score.'),
			]);
			case 'shared.score.input.title': return 'Financial wellness test';
			case 'shared.score.input.inputRequest': return 'Enter your financial information below';
			case 'shared.score.input.annualIncomeInput': return 'Annual income';
			case 'shared.score.input.monthlyCostsInput': return 'Monthly costs';
			case 'shared.score.input.continueCTA': return 'Continue';
			case 'shared.score.input.validations.annualIncome': return 'Annual income should be greater than zero';
			case 'shared.score.input.validations.monthlyCosts': return 'Monthly costs should be greater than zero';
			case 'shared.score.input.failures.fetching': return 'Something wrong happened. Try again later!';
			case 'shared.score.result.disclaimer': return ({required InlineSpanBuilder darker}) => TextSpan(children: [
				const TextSpan(text: 'Here\'s your '),
				darker('financial wellness\nscore.'),
			]);
			case 'shared.score.result.name': return ({required FinancialWellnessScore score}) {
				switch (score) {
					case FinancialWellnessScore.healthy:
						return 'Healthy';
					case FinancialWellnessScore.medium:
						return 'Average';
					case FinancialWellnessScore.low:
						return 'Unhealthy';
				}
			};
			case 'shared.score.result.title': return ({required FinancialWellnessScore score}) {
				switch (score) {
					case FinancialWellnessScore.healthy:
						return 'Congratulations!';
					case FinancialWellnessScore.medium:
						return 'There is room for\nimprovement.';
					case FinancialWellnessScore.low:
						return 'Caution!';
				}
			};
			case 'shared.score.result.text': return ({required InlineSpan name}) => TextSpan(children: [
				const TextSpan(text: 'Your financial wellness score is\n'),
				name,
				const TextSpan(text: '.'),
			]);
			case 'shared.score.result.returnCTA': return 'Return';
			case 'shared.score.securityDisclaimer': return 'Your financial information is encrypted and\nsecure. We\'ll never share or sell any of your\npersonal data.';
			default: return null;
		}
	}
}

