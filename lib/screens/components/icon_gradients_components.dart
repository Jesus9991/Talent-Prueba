import 'package:flutter/material.dart';
import 'package:talent_pitch/controllers/theme/palette_color_theme.dart';

/*
Componente reutilizable para iconos gradient
*/
class GradientIcon extends StatelessWidget {
  final IconData icon;
  final double size;

  const GradientIcon({
    super.key,
    required this.icon,
    this.size = 25,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return const LinearGradient(
          colors: [Colors.blue, PaletteTheme.deepFucsia, PaletteTheme.redColor],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ).createShader(bounds);
      },
      child: Icon(
        icon,
        size: size,
        color: Colors.white, // Necesario para que el gradiente se vea bien
      ),
    );
  }
}
