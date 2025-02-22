import 'package:flutter/material.dart';
import 'package:talent_pitch/controllers/exports/exports.dart';

/*
manejo del tema global de la aplicación
*/

class MainTheme {
  //*==========MODO CLARO=========
  static final ThemeData whiteTheme = ThemeData.light().copyWith(
    appBarTheme: AppBarMainTheme.appbarLight,
    primaryColor: PaletteTheme.principal,
    highlightColor: PaletteTheme.secondary,
    floatingActionButtonTheme: ButtonsTheme.floatingActionLight,
    colorScheme: const ColorScheme.light(primary: PaletteTheme.principal),
    textTheme: FontTheme.lightThemeFont,
    disabledColor: PaletteTheme
        .principal, //Establece el color para los elementos desactivados
    dividerColor: PaletteTheme.principal, //Color del widget Divider()
    scaffoldBackgroundColor:
        PaletteTheme.secondary, // Establece el color para el "scaffold"
    visualDensity: VisualDensity
        .adaptivePlatformDensity, //Adaptándose a diferentes tamaños y resoluciones de pantalla.
    unselectedWidgetColor: PaletteTheme.principal, //widgets no seleccionados
    scrollbarTheme: ScrollbarThemeData(
            radius: const Radius.circular(10),
            thumbColor: WidgetStatePropertyAll(
                PaletteTheme.secondary.withAlpha((0.5 * 255).toInt())),
            trackColor: const WidgetStatePropertyAll(PaletteTheme.orange))
        .copyWith(thumbColor: WidgetStateProperty.all(PaletteTheme.orange)),

    iconTheme: const IconThemeData(color: PaletteTheme.principal, size: 20),
    sliderTheme: SliderThemeData(
      activeTrackColor: PaletteTheme.principal,
      thumbColor: PaletteTheme.principal,
      overlayColor: PaletteTheme.principal,
      inactiveTrackColor: PaletteTheme.principal.withAlpha((0.2 * 255).toInt()),
    ),
    textSelectionTheme:
        const TextSelectionThemeData(cursorColor: PaletteTheme.principal),
    outlinedButtonTheme: ButtonsTheme.outlinedButtonLight,

    elevatedButtonTheme: ButtonsTheme.elevatedButtonLight,
    textButtonTheme: ButtonsTheme.textButtonLight,
    iconButtonTheme: ButtonsTheme.iconButtonLight,
    dividerTheme: const DividerThemeData(color: PaletteTheme.grey),
    splashColor: PaletteTheme.secondary.withAlpha((0.2 * 255).toInt()),
    splashFactory: InkSparkle.splashFactory,
    pageTransitionsTheme: const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
        }),
    // navigationBarTheme: NavBarMainThemeData.navigationBarLight,
  );

  //*==========MODO OSCURO=========
  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    floatingActionButtonTheme: ButtonsTheme.floatingActionDark,
    appBarTheme: AppBarMainTheme.appbarDark,
    primaryColor: PaletteTheme.secondary,
    highlightColor: PaletteTheme.principal,
    colorScheme: const ColorScheme.dark(
      primary: PaletteTheme.secondary,
      onPrimary: PaletteTheme.principal,
      secondary: PaletteTheme.principal,
      onSecondary: PaletteTheme.principal,
      error: Colors.red,
      onError: PaletteTheme.principal,
      surface: PaletteTheme.secondary,
      onSurface: PaletteTheme.grey,
    ),
    sliderTheme: SliderThemeData(
      activeTrackColor: PaletteTheme.greyDark,
      thumbColor: PaletteTheme.greyDark,
      overlayColor: PaletteTheme.greyDark,
      inactiveTrackColor: PaletteTheme.greyDark,
    ),
    textTheme: FontTheme.dartThemeFont,
    disabledColor: PaletteTheme.greyDark,
    dividerColor: PaletteTheme.greyDark,
    scaffoldBackgroundColor: PaletteTheme.principal,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    unselectedWidgetColor: PaletteTheme.greyDark,
    scrollbarTheme: ScrollbarThemeData(
      radius: const Radius.circular(10),
      thumbColor: WidgetStatePropertyAll(
          PaletteTheme.principal.withAlpha((0.5 * 255).toInt())),
      trackColor: const WidgetStatePropertyAll(PaletteTheme.principal),
    ).copyWith(thumbColor: WidgetStateProperty.all(PaletteTheme.principal)),
    iconTheme: const IconThemeData(color: PaletteTheme.principal, size: 20),
    textSelectionTheme:
        const TextSelectionThemeData(cursorColor: PaletteTheme.principal),
    outlinedButtonTheme: ButtonsTheme.outlinedButtonDark,
    elevatedButtonTheme: ButtonsTheme.elevatedButtonDark,
    textButtonTheme: ButtonsTheme.textButtonDark,
    iconButtonTheme: ButtonsTheme.iconButtonDark,
    dividerTheme: const DividerThemeData(color: PaletteTheme.greyDark),
    splashColor: PaletteTheme.greyDark.withAlpha((0.2 * 255).toInt()),
    splashFactory: InkSparkle.splashFactory,
    pageTransitionsTheme: const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
        }),
  );
}
