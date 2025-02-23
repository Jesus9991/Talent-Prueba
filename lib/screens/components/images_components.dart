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
  final BoxFit? fit;
  const PhotoBorderGradientComponent({
    super.key,
    required this.image,
    this.height,
    this.width,
    this.padding,
    this.fit,
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
              fit: fit ?? BoxFit.cover,
              image: NetworkImage(image),
            )),
      ),
    );
  }
}

/*
clase para las imagenes de tipo NetworkImage */
class NetworkImageComponent {
  static ImageProvider getImageNetworkImage({
    required String url,
  }) {
    if (url.isEmpty) {
      return AssetImage(ImagesPath
          .tlogoWhite); //si la URL está vacía, usa la imagen por defecto
    }

    try {
      return NetworkImage(url);
    } catch (_) {
      return AssetImage(
          ImagesPath.tlogoWhite); //si hay un error, usa la imagen local
    }
  }
}
