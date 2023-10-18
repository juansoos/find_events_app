import 'package:find_events/src/config/configuration.dart';
import 'package:flutter/material.dart';

class CustomTheme {
  CustomTheme._();

  static TextTheme get _textTheme {
    // Reference to define values https://api.flutter.dev/flutter/material/TextTheme-class.html
    return const TextTheme(
      displayLarge: CustomTypography.display1,
      displayMedium: CustomTypography.display2,
      headlineLarge: CustomTypography.headline1,
      headlineMedium: CustomTypography.headline2,
      headlineSmall: CustomTypography.headline3,
      titleLarge: CustomTypography.title1,
      titleMedium: CustomTypography.title2,
      titleSmall: CustomTypography.title3,
      bodyLarge: CustomTypography.body1,
      bodyMedium: CustomTypography.body2,
      bodySmall: CustomTypography.body3,
    );
  }

  static ElevatedButtonThemeData get _elevatedButtonTheme {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(CustomColors.cream),
        minimumSize: MaterialStateProperty.all(const Size(100, 40)),
        textStyle: MaterialStateProperty.all(_textTheme.titleSmall),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return CustomColors.brown.withOpacity(0.5);
            }
            return CustomColors.brown;
          },
        ),
      ),
    );
  }

  static NavigationBarThemeData get _navigatorBarTheme {
    return NavigationBarThemeData(
      backgroundColor: CustomColors.cream,
      indicatorColor: CustomColors.brown,
      shadowColor: CustomColors.lightBrown,
      surfaceTintColor: CustomColors.lightBrown,
      labelTextStyle: MaterialStateProperty.resolveWith((state) {
        if (state.contains(MaterialState.selected)) {
          return CustomTypography.body2.copyWith(color: CustomColors.brown);
        }
        return CustomTypography.body2.copyWith(color: CustomColors.lightBrown);
      }),
      iconTheme: MaterialStateProperty.resolveWith((state) {
        if (state.contains(MaterialState.selected)) {
          return const IconThemeData(color: CustomColors.background);
        }
        return const IconThemeData(color: CustomColors.lightBrown);
      }),
    );
  }

  static BottomNavigationBarThemeData get _bottomNavigatorBarTheme {
    const selectedColor = CustomColors.brown;
    const unselectedColor = CustomColors.lightBrown;

    return BottomNavigationBarThemeData(
      backgroundColor: CustomColors.cream,
      elevation: 10,
      selectedIconTheme: const IconThemeData(color: selectedColor),
      unselectedIconTheme: const IconThemeData(color: unselectedColor),
      selectedItemColor: selectedColor,
      unselectedItemColor: unselectedColor,
      showUnselectedLabels: true,
      showSelectedLabels: true,
      selectedLabelStyle:
          CustomTypography.body2.copyWith(color: CustomColors.brown),
      unselectedLabelStyle:
          CustomTypography.body2.copyWith(color: CustomColors.lightBrown),
    );
  }

  static AppBarTheme get _appBarTheme {
    return AppBarTheme(
        color: CustomColors.brown,
        foregroundColor: CustomColors.lightBrown,
        titleTextStyle: CustomTypography.title1.copyWith(
          color: CustomColors.background,
        ));
  }

  static InputDecorationTheme get _inputDecorationTheme {
    return const InputDecorationTheme(
      border: OutlineInputBorder(),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: CustomColors.onPrimary),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: CustomColors.secondary),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: CustomColors.error),
      ),
    );
  }

  static ThemeData material = ThemeData.from(
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: CustomColors.primary,
      onPrimary: CustomColors.onPrimary,
      secondary: CustomColors.secondary,
      onSecondary: CustomColors.onSecondary,
      error: CustomColors.error,
      onError: CustomColors.error,
      background: CustomColors.background,
      onBackground: CustomColors.background,
      surface: CustomColors.primary,
      onSurface: CustomColors.primary,
    ),
    useMaterial3: true,
  ).copyWith(
    textTheme: _textTheme,
    appBarTheme: _appBarTheme,
    elevatedButtonTheme: _elevatedButtonTheme,
    navigationBarTheme: _navigatorBarTheme,
    bottomNavigationBarTheme: _bottomNavigatorBarTheme,
    inputDecorationTheme: _inputDecorationTheme,
  );
}
