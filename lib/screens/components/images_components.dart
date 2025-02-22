import 'package:flutter/material.dart';
import 'package:talent_pitch/controllers/exports/exports.dart';
/*
COMPONENTES PARA LAS IMAGENES
*/

/*manejo de imagen con efecto gradient de border */
class PhotoBorderGradientComponent extends StatelessWidget {
  final String image;
  final double? height;
  final double? width;
  final double? padding;
  const PhotoBorderGradientComponent({
    super.key,
    required this.image,
    this.height,
    this.width,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: height ?? size.height * 0.06,
      width: width ?? size.width * 0.13,
      padding: EdgeInsets.all(padding ?? 1),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [
            PaletteTheme.blueViolet,
            PaletteTheme.redColor,
          ],
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
            color: PaletteTheme.categoryColors,
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(image),
            )),
      ),
    );
  }
}
