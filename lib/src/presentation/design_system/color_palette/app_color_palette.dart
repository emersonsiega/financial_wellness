import 'dart:ui';

/// Defines the abstraction to the color palette wide used in the whole app.
abstract class IAppColorPalette {
  Color get primary;
  Color get brand;
  IAppForegroundColor get foreground;
  IAppBackgroundColor get background;
  IAppFeedbackColor get feedback;
}

/// Foreground color palette, used for icons, texts and borders.
abstract class IAppForegroundColor {
  Color get ultraDark;
  Color get darker;
  Color get dark;
  Color get regular;
  Color get light;
  Color get lighter;
  Color get ultraLight;
}

/// Background color palette, used for any background such as cards, scaffolds, etc.
abstract class IAppBackgroundColor {
  Color get ultraLight;
  Color get lighter;
  Color get light;
}

/// Feedback color palette, used for any kind of feedback that whants to demonstrate attention, danger or success.
abstract class IAppFeedbackColor {
  Color get success;
  Color get warning;
  Color get attention;
}

class AppColorPalette implements IAppColorPalette {
  const AppColorPalette();

  @override
  Color get primary => const Color(0xff001C95);

  @override
  Color get brand => const Color(0xff00D991);

  @override
  IAppBackgroundColor get background => const AppBackgroundColor();

  @override
  IAppForegroundColor get foreground => const AppForegroundColor();

  @override
  IAppFeedbackColor get feedback => const AppFeedbackColor();
}

class AppBackgroundColor implements IAppBackgroundColor {
  const AppBackgroundColor();

  @override
  Color get ultraLight => const Color(0xffFFFFFF);

  @override
  Color get lighter => const Color(0xffF4F8FA);

  @override
  Color get light => const Color(0xffE9EEF2);
}

class AppForegroundColor implements IAppForegroundColor {
  const AppForegroundColor();

  @override
  Color get ultraDark => const Color(0xff000000);

  @override
  Color get darker => const Color(0xff1E2A32);

  @override
  Color get dark => const Color(0xff4D6475);

  @override
  Color get regular => const Color(0xff708797);

  @override
  Color get light => const Color(0xff8A9CA9);

  @override
  Color get lighter => const Color(0xffCBD5DC);

  @override
  Color get ultraLight => const Color(0xffFFFFFF);
}

class AppFeedbackColor implements IAppFeedbackColor {
  const AppFeedbackColor();

  @override
  Color get success => const Color(0xff04C761);

  @override
  Color get warning => const Color(0xffFFC032);

  @override
  Color get attention => const Color(0xffD32A36);
}
