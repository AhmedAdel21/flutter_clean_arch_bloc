import 'package:flutter/material.dart';

/// 1. Custom Extensions
@immutable
class AppColors extends ThemeExtension<AppColors> {
  final Color success;
  final Color warning;
  final Color info;

  const AppColors({
    required this.success,
    required this.warning,
    required this.info,
  });

  @override
  AppColors copyWith({Color? success, Color? warning, Color? info}) {
    return AppColors(
      success: success ?? this.success,
      warning: warning ?? this.warning,
      info: info ?? this.info,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    return AppColors(
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      info: Color.lerp(info, other.info, t)!,
    );
  }
}

@immutable
class ShapeTokens extends ThemeExtension<ShapeTokens> {
  final double radiusSmall;
  final double radiusMedium;
  final double radiusLarge;
  final double radiusXLarge;
  final double radiusFull;

  const ShapeTokens({
    required this.radiusSmall,
    required this.radiusMedium,
    required this.radiusLarge,
    required this.radiusXLarge,
    required this.radiusFull,
  });

  @override
  ShapeTokens copyWith({
    double? radiusSmall,
    double? radiusMedium,
    double? radiusLarge,
    double? radiusXLarge,
    double? radiusFull,
  }) {
    return ShapeTokens(
      radiusSmall: radiusSmall ?? this.radiusSmall,
      radiusMedium: radiusMedium ?? this.radiusMedium,
      radiusLarge: radiusLarge ?? this.radiusLarge,
      radiusXLarge: radiusXLarge ?? this.radiusXLarge,
      radiusFull: radiusFull ?? this.radiusFull,
    );
  }

  @override
  ShapeTokens lerp(ThemeExtension<ShapeTokens>? other, double t) {
    if (other is! ShapeTokens) return this;
    return ShapeTokens(
      radiusSmall: lerpDouble(radiusSmall, other.radiusSmall, t)!,
      radiusMedium: lerpDouble(radiusMedium, other.radiusMedium, t)!,
      radiusLarge: lerpDouble(radiusLarge, other.radiusLarge, t)!,
      radiusXLarge: lerpDouble(radiusXLarge, other.radiusXLarge, t)!,
      radiusFull: lerpDouble(radiusFull, other.radiusFull, t)!,
    );
  }
}

double? lerpDouble(double a, double b, double t) {
  return a + (b - a) * t;
}

/// 2. Define Light & Dark ColorSchemes
const _lightColorScheme = ColorScheme.light(
  primary: Color(0xFF6750A4),
  onPrimary: Colors.white,
  secondary: Color(0xFF625B71),
  onSecondary: Colors.white,
  tertiary: Color(0xFF7D5260),
  onTertiary: Colors.white,
  background: Color(0xFFFDF8FD),
  onBackground: Colors.black,
  surface: Colors.white,
  onSurface: Colors.black,
  error: Color(0xFFB3261E),
  onError: Colors.white,
  outline: Color(0xFF79747E),
  shadow: Color(0xFF000000),
);

const _darkColorScheme = ColorScheme.dark(
  primary: Color(0xFFD0BCFF),
  onPrimary: Colors.black,
  secondary: Color(0xFFCCC2DC),
  onSecondary: Colors.black,
  tertiary: Color(0xFFEFB8C8),
  onTertiary: Colors.black,
  background: Color(0xFF1C1B1F),
  onBackground: Colors.white,
  surface: Color(0xFF1C1B1F),
  onSurface: Colors.white,
  error: Color(0xFFF2B8B5),
  onError: Colors.black,
  outline: Color(0xFF938F99),
  shadow: Color(0xFF000000),
);

/// 3. Typography (TextTheme)
const _textTheme = TextTheme(
  displayLarge: TextStyle(fontSize: 57, fontWeight: FontWeight.bold),
  displayMedium: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
  displaySmall: TextStyle(fontSize: 36, fontWeight: FontWeight.w600),
  headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
  headlineMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
  headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
  titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
  titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
  titleSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
  bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
  bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
  bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
  labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
  labelMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
  labelSmall: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
);

/// 4. Extensions (Shape & Extra Colors)
const _shapeTokens = ShapeTokens(
  radiusSmall: 4,
  radiusMedium: 8,
  radiusLarge: 16,
  radiusXLarge: 28,
  radiusFull: 9999,
);

const _extraColors = AppColors(
  success: Color(0xFF4CAF50),
  warning: Color(0xFFFF9800),
  info: Color(0xFF2196F3),
);

/// 5. ThemeData (Light & Dark)
final lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: _lightColorScheme,

  textTheme: _textTheme,
  cardTheme: CardThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(_shapeTokens.radiusMedium),
    ),
    elevation: 2,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: _lightColorScheme.primary,
    foregroundColor: _lightColorScheme.onPrimary,
    elevation: 2,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: _lightColorScheme.primary,
      foregroundColor: _lightColorScheme.onPrimary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(_shapeTokens.radiusMedium),
      ),
      textStyle: _textTheme.labelLarge,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(_shapeTokens.radiusSmall),
    ),
  ),
  extensions: [_shapeTokens, _extraColors],
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: _darkColorScheme,
  textTheme: _textTheme,
  cardTheme: CardThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(_shapeTokens.radiusMedium),
    ),
    elevation: 2,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: _darkColorScheme.primary,
    foregroundColor: _darkColorScheme.onPrimary,
    elevation: 2,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: _darkColorScheme.primary,
      foregroundColor: _darkColorScheme.onPrimary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(_shapeTokens.radiusMedium),
      ),
      textStyle: _textTheme.labelLarge,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(_shapeTokens.radiusSmall),
    ),
  ),
  extensions: [_shapeTokens, _extraColors],
);
