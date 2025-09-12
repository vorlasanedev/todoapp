import 'package:flex_color_scheme/flex_color_scheme.dart'
    show
        FlexAppBarStyle,
        FlexInputBorderType,
        FlexScheme,
        FlexSubThemesData,
        FlexSurfaceMode,
        FlexTabBarStyle,
        FlexThemeData,
        FlexColorScheme;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

@immutable
class AppTheme {
  const AppTheme._();

  // Light theme
  static final ThemeData light = (() {
    final base = FlexThemeData.light(
      scheme: FlexScheme.indigo,
      surfaceMode: FlexSurfaceMode.highScaffoldLowSurfacesVariantDialog,
      blendLevel: 40,
      appBarStyle: FlexAppBarStyle.primary,
      appBarOpacity: 0.95,
      appBarElevation: 0,
      transparentStatusBar: true,
      tabBarStyle: FlexTabBarStyle.forBackground,
      tooltipsMatchBackground: true,
      swapColors: true,
      lightIsWhite: true,
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      // Do not set fontFamily here since we'll apply GoogleFonts on the final ThemeData
      subThemesData: const FlexSubThemesData(
        // Removed deprecated: useTextTheme, blendTextTheme
        fabUseShape: true,
        interactionEffects: true,
        bottomNavigationBarElevation: 0,
        bottomNavigationBarOpacity: 1,
        navigationBarOpacity: 1,
        navigationBarMutedUnselectedIcon: true,
        inputDecoratorIsFilled: true,
        inputDecoratorBorderType: FlexInputBorderType.outline,
        inputDecoratorFocusedHasBorder: true,
        blendOnColors: true,
        popupMenuOpacity: 0.95,
      ),
    );

    return base.copyWith(
      textTheme: GoogleFonts.dekkoTextTheme(base.textTheme),
      primaryTextTheme: GoogleFonts.dekkoTextTheme(base.primaryTextTheme),
    );
  })();

  // Dark theme
  static final ThemeData dark = (() {
    final base = FlexThemeData.dark(
      scheme: FlexScheme.indigo,
      surfaceMode: FlexSurfaceMode.highScaffoldLowSurfacesVariantDialog,
      blendLevel: 15,
      appBarStyle: FlexAppBarStyle.material,
      appBarOpacity: 0.97,
      appBarElevation: 0,
      transparentStatusBar: true,
      tabBarStyle: FlexTabBarStyle.forBackground,
      tooltipsMatchBackground: true,
      swapColors: true,
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      subThemesData: const FlexSubThemesData(
        // Removed deprecated: useTextTheme, blendTextTheme
        fabUseShape: true,
        interactionEffects: true,
        bottomNavigationBarElevation: 0,
        bottomNavigationBarOpacity: 1,
        navigationBarOpacity: 1,
        navigationBarMutedUnselectedIcon: true,
        inputDecoratorIsFilled: true,
        inputDecoratorBorderType: FlexInputBorderType.outline,
        inputDecoratorFocusedHasBorder: true,
        blendOnColors: true,
        popupMenuOpacity: 0.95,
      ),
    );

    return base.copyWith(
      textTheme: GoogleFonts.dekkoTextTheme(base.textTheme),
      primaryTextTheme: GoogleFonts.dekkoTextTheme(base.primaryTextTheme),
    );
  })();
}
