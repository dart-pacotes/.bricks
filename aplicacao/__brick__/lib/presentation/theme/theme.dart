import 'package:my_application_name/presentation/widgets/widgets.dart';

const _kFontFamily = 'GillSans';

const _kAppBarBackgroundColorDark = myApplicationNameLogoColor;
const _kAppBarBackgroundColorLight = myApplicationNameLogoColor;
const _kBottomNavigationBarUnselectedItemColorOpacity = 0.4;

final _myApplicationNameTextThemeLight = ThemeData.light().textTheme;
final _myApplicationNameTextThemeDark = ThemeData.dark().textTheme;

const myApplicationNameLogoColor = Color(0xFFDCEFD2);
const myApplicationNameBlack = Color(0xFF64646e);
const myApplicationNameGrey = Color(0xFFC1C1C5);
const myApplicationNameHighlight = Color(0xFFE6A08C);
const myApplicationNameTeacherColor = Color(0xFF7DC3DC);
const myApplicationNameParentColor = Color(0xFFC8A0DC);

final _myApplicationNameLightColorScheme = ColorScheme.fromSeed(
  seedColor: myApplicationNameLogoColor,
  brightness: Brightness.light,
);

final _myApplicationNameDarkColorScheme = ColorScheme.fromSeed(
  seedColor: myApplicationNameLogoColor,
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
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: _kAppBarBackgroundColorLight,
    selectedItemColor: Colors.black,
    unselectedItemColor: Colors.black.withOpacity(
      _kBottomNavigationBarUnselectedItemColorOpacity,
    ),
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
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: _kAppBarBackgroundColorDark,
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.white.withOpacity(
      _kBottomNavigationBarUnselectedItemColorOpacity,
    ),
  ),
);
