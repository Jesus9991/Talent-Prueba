import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:talent_pitch/controllers/exports/exports.dart';
/*
tema para manejar el appbar de la aplicación
*/

class AppBarMainTheme {
  /*tipo de fuente */
  static TextStyle typeFont = GoogleFonts.dmSans();

  static AppBarTheme appbarLight = AppBarTheme(
    iconTheme: const IconThemeData(
      color: PaletteTheme.principal,
      size: 25,
    ),
    actionsIconTheme: const IconThemeData(
      color: PaletteTheme.principal,
      size: 25,
    ),
    foregroundColor: PaletteTheme.transparent,
    backgroundColor: PaletteTheme.transparent,
    shadowColor: PaletteTheme.transparent,
    centerTitle: true,
    elevation: 0,
    titleTextStyle: typeFont.copyWith(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: PaletteTheme.principal),
  );
  //: modo oscuro
  static AppBarTheme appbarDark = AppBarTheme(
    iconTheme: const IconThemeData(color: PaletteTheme.principal, size: 25),
    actionsIconTheme:
        const IconThemeData(color: PaletteTheme.principal, size: 25),
    foregroundColor: PaletteTheme.transparent,
    backgroundColor: PaletteTheme.transparent,
    shadowColor: PaletteTheme.transparent,
    centerTitle: true,
    elevation: 0,
    titleTextStyle: typeFont.copyWith(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: PaletteTheme.principal),
  );
}
