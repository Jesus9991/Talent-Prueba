import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:talent_pitch/controllers/exports/exports.dart';

/*
COMPONENTE: manejo del boton con efecto blur, reuzable
*/
class CircleButtonsComponent extends StatelessWidget {
  final IconData icon;
  final double? sizeWidget;
  final Function onTap;
  const CircleButtonsComponent({
    super.key,
    required this.icon,
    this.sizeWidget,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => onTap(),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Blur y fondo con gradiente
          ClipRRect(
            borderRadius: BorderRadius.circular(size.width * 0.06),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
              child: Container(
                width: sizeWidget ?? size.width * 0.11,
                height: sizeWidget ?? size.width * 0.11,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: PaletteTheme.principal
                      .withAlpha((.07 * 255).toInt()), // Fondo semitransparente
                ),
              ),
            ),
          ),
          // Icono de búsqueda
          Icon(
            icon,
            color: PaletteTheme.principal,
            size: size.width * 0.06,
          ),
        ],
      ),
    );
  }
}

class IconBlurComponents extends StatelessWidget {
  final IconData icon;
  final double? sizeWidget;
  const IconBlurComponents({
    super.key,
    required this.icon,
    this.sizeWidget,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.center,
      children: [
        // Blur y fondo con gradiente
        ClipRRect(
          borderRadius: BorderRadius.circular(size.width * 0.06),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
            child: Container(
              width: sizeWidget ?? size.width * 0.11,
              height: sizeWidget ?? size.width * 0.11,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: PaletteTheme.principal
                    .withAlpha((.07 * 255).toInt()), // Fondo semitransparente
              ),
            ),
          ),
        ),
        // Icono de búsqueda
        Icon(
          icon,
          color: PaletteTheme.principal,
          size: size.width * 0.06,
        ),
      ],
    );
  }
}

class CirleGradientBottonComponent extends StatelessWidget {
  final IconData icon;
  final double? sizeWidget;
  final Function onTap;
  const CirleGradientBottonComponent({
    super.key,
    required this.icon,
    this.sizeWidget,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => onTap(),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Blur y fondo con gradiente
          ClipRRect(
            borderRadius: BorderRadius.circular(size.width * 0.06),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
              child: Container(
                width: sizeWidget ?? size.width * 0.11,
                height: sizeWidget ?? size.width * 0.11,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: PaletteTheme.principal
                      .withAlpha((.07 * 255).toInt()), // Fondo semitransparente
                ),
              ),
            ),
          ),
          // Icono de búsqueda
          GradientIcon(
            icon: icon,
            size: size.width * 0.06,
          ),
        ],
      ),
    );
  }
}
