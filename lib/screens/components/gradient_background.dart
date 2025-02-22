import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:talent_pitch/controllers/exports/exports.dart';

/*
GRADIENTE: effecto gradiante reutilizable en toda la app
*/
class GradientBackground extends StatelessWidget {
  final Widget child;
  const GradientBackground({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            /*fondo que se verá afectado por el desenfoque */
            Container(
              alignment: Alignment.topRight,
              height: size.height * 0.04,
              width: size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    PaletteTheme.blueViolet,
                    PaletteTheme.redColor,
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: size.height * .2,
                width: size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    end: Alignment.topCenter,
                    begin: Alignment.bottomCenter,
                    colors: [
                      PaletteTheme.principal.withAlpha((0.0 * 255).toInt()),
                      PaletteTheme.secondary.withAlpha((0.1 * 255).toInt()),
                    ],
                  ),
                ),
              ),
            ),
            /*efecto de desenfoque */
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 150, sigmaY: 150),
                child: Container(
                  color: PaletteTheme.secondary.withAlpha((0.2 * 255).toInt()),
                ),
              ),
            ),

            /*contenido principal del widget */
            child,
          ],
        ),
      ),
    );
  }
}
