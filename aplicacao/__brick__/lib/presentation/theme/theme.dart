import 'package:my_application_name/presentation/widgets/widgets.dart';

const _kFontFamily = 'ComicSansMS';

const _kApplicationNameLogoColor = Colors.yellow;
const _kAppBarBackgroundColorDark = _kApplicationNameLogoColor;
const _kAppBarBackgroundColorLight = _kApplicationNameLogoColor;

const myApplicationNameHighlight = Colors.pink;

final _myApplicationNameTextThemeLight =
    ThemeData.light().textTheme.apply(fontFamily: _kFontFamily);

final _myApplicationNameTextThemeDark =
    ThemeData.dark().textTheme.apply(fontFamily: _kFontFamily);

final _myApplicationNameLightColorScheme = ColorScheme.fromSeed(
  seedColor: _kApplicationNameLogoColor,
  brightness: Brightness.light,
);

final _myApplicationNameDarkColorScheme = ColorScheme.fromSeed(
  seedColor: _kApplicationNameLogoColor,
  brightness: Brightness.dark,
);

final myApplicationNameLightTheme = ThemeData(
  textTheme: _myApplicationNameTextThemeLight,
  useMaterial3: true,
  colorScheme: _myApplicationNameLightColorScheme,
  fontFamily: _kFontFamily,
  checkboxTheme: CheckboxThemeData(
    checkColor: MaterialStateProperty.all(
      _myApplicationNameLightColorScheme.onPrimary,
    ),
    fillColor: MaterialStateProperty.all(
      _myApplicationNameLightColorScheme.inversePrimary,
    ),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: _kAppBarBackgroundColorLight,
  ),
);

final myApplicationNameDarkTheme = ThemeData(
  textTheme: _myApplicationNameTextThemeDark,
  useMaterial3: true,
  colorScheme: _myApplicationNameDarkColorScheme,
  fontFamily: _kFontFamily,
  checkboxTheme: CheckboxThemeData(
    checkColor: MaterialStateProperty.all(
      _myApplicationNameDarkColorScheme.onPrimary,
    ),
    fillColor: MaterialStateProperty.all(
      _myApplicationNameDarkColorScheme.inversePrimary,
    ),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: _kAppBarBackgroundColorDark,
  ),
);
