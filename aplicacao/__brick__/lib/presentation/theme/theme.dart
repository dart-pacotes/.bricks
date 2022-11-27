import 'package:{{name.lowerCase().snakeCase()}}/presentation/widgets/widgets.dart';

const _kFontFamily = 'ComicSansMS';

const _kApplicationNameLogoColor = Colors.yellow;
const _kAppBarBackgroundColorDark = _kApplicationNameLogoColor;
const _kAppBarBackgroundColorLight = _kApplicationNameLogoColor;

const {{name.lowerCase().camelCase()}}Highlight = Colors.pink;

final _{{name.lowerCase().camelCase()}}TextThemeLight =
    ThemeData.light().textTheme.apply(fontFamily: _kFontFamily);

final _{{name.lowerCase().camelCase()}}TextThemeDark =
    ThemeData.dark().textTheme.apply(fontFamily: _kFontFamily);

final _{{name.lowerCase().camelCase()}}LightColorScheme = ColorScheme.fromSeed(
  seedColor: _kApplicationNameLogoColor,
  brightness: Brightness.light,
);

final _{{name.lowerCase().camelCase()}}DarkColorScheme = ColorScheme.fromSeed(
  seedColor: _kApplicationNameLogoColor,
  brightness: Brightness.dark,
);

final {{name.lowerCase().camelCase()}}LightTheme = ThemeData(
  textTheme: _{{name.lowerCase().camelCase()}}TextThemeLight,
  useMaterial3: true,
  colorScheme: _{{name.lowerCase().camelCase()}}LightColorScheme,
  fontFamily: _kFontFamily,
  checkboxTheme: CheckboxThemeData(
    checkColor: MaterialStateProperty.all(
      _{{name.lowerCase().camelCase()}}LightColorScheme.onPrimary,
    ),
    fillColor: MaterialStateProperty.all(
      _{{name.lowerCase().camelCase()}}LightColorScheme.inversePrimary,
    ),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: _kAppBarBackgroundColorLight,
  ),
);

final {{name.lowerCase().camelCase()}}DarkTheme = ThemeData(
  textTheme: _{{name.lowerCase().camelCase()}}TextThemeDark,
  useMaterial3: true,
  colorScheme: _{{name.lowerCase().camelCase()}}DarkColorScheme,
  fontFamily: _kFontFamily,
  checkboxTheme: CheckboxThemeData(
    checkColor: MaterialStateProperty.all(
      _{{name.lowerCase().camelCase()}}DarkColorScheme.onPrimary,
    ),
    fillColor: MaterialStateProperty.all(
      _{{name.lowerCase().camelCase()}}DarkColorScheme.inversePrimary,
    ),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: _kAppBarBackgroundColorDark,
  ),
);
