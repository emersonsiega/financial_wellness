# Financial Wellness

Financial Wellness is an app that helps people to keep track of their financial situation.

In order to do that, users registers information regarding their financial situation. Two key pieces of information are his annual gross income and average monthly costs.

Based on that information, the system calculates a score to represent how healthy his financial life is - Healthy, Medium or Low.

## Setup

Install Flutter version 3.29.0.

Run the app as any regular Flutter app.

## Project structure

This project follows the official [Flutter Architecture Guide](https://docs.flutter.dev/app-architecture/guide).
As it's a small project, only two layers were necessary: `domain` and `presentation`. 

#### Domain layer

Holds the Entites and Use Cases. It's where all the important application rules and business rules are implemented.

Entities are the backbone of our application. The UI will always use them, so keep it simple.

#### Presentation

This layer is responsible for centralize all the user interface related content, such as theme, colors, typography, icons, custom widgets and the views.


## Design system

The app design system follows the Figma prototype definitions, using its colors, text styles and assets.


### Color Palette

The color palette was designed to implement a custom interface called `IAppColorPalette`. In the long term it can be useful for a white-label implementation.

The colors was named to make its usage easier. An improvement can be made by talking to UX team to follow the same name convention in the prototype.

The color palette can be accessed through a `BuildContext` extension:

```dart
Container(
    color: context.colors.primary,
)
```

### Typography

Two font families were used: Work Sans and Rubik. Both are downloaded through `GoogleFonts` package.

The text styles were named according to the Figma description, but, as the color palette, it also can be improved in order to make all the used styles more clear and organized in one stylesheet.

The text styles can be accessed through a `BuildContext` extension:

```dart
Text(
    'Example',
    fontStyle: context.text.xs.headingSmall,
)
```

### Assets

All app assets are available through `AppAssets` and `AppIcons`.