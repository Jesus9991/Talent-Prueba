import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:talent_pitch/controllers/theme/palette_color_theme.dart';

/*
Componente reutilizable para efectos gradient
*/

class GradientLoading extends StatelessWidget {
  final double size;

  const GradientLoading({
    super.key,
    this.size = 50,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return const LinearGradient(
          colors: [
            Colors.blue,
            Color.fromRGBO(192, 73, 176, 1),
            Color.fromRGBO(156, 80, 90, 1)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ).createShader(bounds);
      },
      child: SizedBox(
          width: size,
          height: size,
          child: const CupertinoActivityIndicator(radius: 12)),
    );
  }
}

class GradientText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final Gradient gradient;
  final int? maxLines;
  final TextAlign? textAlign;
  const GradientText({
    super.key,
    required this.text,
    this.style,
    this.gradient = const LinearGradient(
      colors: [
        Colors.blue,
        Color.fromRGBO(192, 73, 176, 1),
        Color.fromRGBO(156, 80, 90, 1)
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    this.maxLines,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
        shaderCallback: (bounds) {
          return gradient.createShader(bounds);
        },
        child: Text(
          text,
          maxLines: maxLines ?? 4,
          overflow: TextOverflow.ellipsis,
          textAlign: textAlign ?? TextAlign.start,
          style: style ??
              Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: PaletteTheme.grey, fontWeight: FontWeight.w200),
        ));
  }
}

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
