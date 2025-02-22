import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:talent_pitch/controllers/exports/exports.dart';

/*
custom para los estilos de botones
*/
class ButtonsTheme {
  /*tipo de fuente */
  static TextStyle typeFont = GoogleFonts.dmSans();
  static double borderRadius = 35;
  static double borderCards = 15;

  //*==========MODO CLARO=========
  static ElevatedButtonThemeData elevatedButtonLight = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          shadowColor: PaletteTheme.transparent,
          elevation: 0,
          textStyle: typeFont.copyWith(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: PaletteTheme.principal),
          foregroundColor: PaletteTheme.principal, //color de las letras */
          backgroundColor: PaletteTheme.blueViolet, //color del boton */
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius))));
  //
  static OutlinedButtonThemeData outlinedButtonLight = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      textStyle: typeFont.copyWith(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: PaletteTheme.principal,
      ),
      backgroundColor: PaletteTheme.transparent,
      surfaceTintColor: PaletteTheme.transparent,
      disabledBackgroundColor: PaletteTheme.principal,
      disabledForegroundColor: PaletteTheme.principal,
      elevation: 0,
      shadowColor: PaletteTheme.transparent,
      side: const BorderSide(color: PaletteTheme.principal),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        side:
            const BorderSide(color: PaletteTheme.principal), // Color del borde
      ),
    ),
  );
  //
  static TextButtonThemeData textButtonLight = TextButtonThemeData(
      style: TextButton.styleFrom(
    shadowColor: PaletteTheme.principal.withAlpha((0.5 * 255).toInt()),
    elevation: 0,
    textStyle: typeFont.copyWith(
        fontSize: 15,
        fontWeight: FontWeight.w700,
        color: PaletteTheme.principal),
    foregroundColor: PaletteTheme.principal,
  ));

  static IconButtonThemeData iconButtonLight = IconButtonThemeData(
      style: ButtonStyle(
    elevation: const WidgetStatePropertyAll(0),
    shadowColor: WidgetStatePropertyAll(
        PaletteTheme.principal.withAlpha((0.5 * 255).toInt())),
    foregroundColor: const WidgetStatePropertyAll(
        PaletteTheme.principal), //color de las letras */

    iconSize: WidgetStateProperty.all(25),
    iconColor: WidgetStateProperty.all(PaletteTheme.principal),
  ));

  // Tema claro para FloatingActionButton
  static FloatingActionButtonThemeData floatingActionLight =
      FloatingActionButtonThemeData(
    backgroundColor: PaletteTheme.blueViolet,
    foregroundColor: PaletteTheme.principal,
    elevation: 6,
  );

  //*==========MODO OSCURO=========
  static OutlinedButtonThemeData outlinedButtonDark = OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
    textStyle: typeFont.copyWith(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: PaletteTheme.principal),
    backgroundColor: PaletteTheme.transparent,
    surfaceTintColor: PaletteTheme.transparent,
    disabledBackgroundColor: PaletteTheme.principal,
    disabledForegroundColor: PaletteTheme.principal,
    elevation: 0,
    shadowColor: PaletteTheme.transparent,
    side: const BorderSide(color: PaletteTheme.principal),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      side: const BorderSide(color: PaletteTheme.principal), // Color del borde
    ),
  ));
  static ElevatedButtonThemeData elevatedButtonDark = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          shadowColor: PaletteTheme.transparent,
          textStyle: typeFont.copyWith(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: PaletteTheme.principal),
          foregroundColor: PaletteTheme.principal, //color de las letras */
          backgroundColor: PaletteTheme.blueViolet, //color del boton */
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius))));
  static TextButtonThemeData textButtonDark = TextButtonThemeData(
      style: TextButton.styleFrom(
    shadowColor: PaletteTheme.transparent,
    textStyle: typeFont.copyWith(
        fontSize: 15,
        fontWeight: FontWeight.w300,
        color: PaletteTheme.principal),
    elevation: 0,
    foregroundColor: PaletteTheme.principal,
  ));

  static IconButtonThemeData iconButtonDark = IconButtonThemeData(
      style: ButtonStyle(
    elevation: const WidgetStatePropertyAll(0),
    shadowColor: WidgetStatePropertyAll(
        PaletteTheme.principal.withAlpha((0.5 * 255).toInt())),
    foregroundColor: const WidgetStatePropertyAll(
        PaletteTheme.principal), //color de las letras */

    iconSize: WidgetStateProperty.all(25),
    iconColor: WidgetStateProperty.all(PaletteTheme.principal),
  ));

  // Tema claro para FloatingActionButton
  static FloatingActionButtonThemeData floatingActionDark =
      FloatingActionButtonThemeData(
    backgroundColor: PaletteTheme.blueViolet,
    foregroundColor: PaletteTheme.principal,
    elevation: 6,
  );
}
