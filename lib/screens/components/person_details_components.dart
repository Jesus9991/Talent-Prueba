import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:talent_pitch/controllers/exports/exports.dart';

/*
COPONENTES PARA LOS DETALLES DE LAS PERSONAS
*/

class ColumnDetailsComponents extends StatelessWidget {
  final String title;
  final String subtitle;
  final int maxLines;
  const ColumnDetailsComponents({
    super.key,
    required this.title,
    required this.subtitle,
    required this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * .04, vertical: size.height * .02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: size.height * .006,
          children: [
            _TitleComponent(title: title),
            _SubtitleComponent(subtitle: subtitle, maxLines: maxLines)
          ],
        ),
      ),
    );
  }
}

class NamePersonComponent extends StatelessWidget {
  final String name;
  final String nickName;
  final String avatar;
  const NamePersonComponent({
    super.key,
    required this.name,
    required this.nickName,
    required this.avatar,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: size.width * .04),
        child: Row(
          spacing: size.width * .02,
          children: [
            CircleAvatar(
              backgroundColor: PaletteTheme.categoryColors,
              backgroundImage:
                  NetworkImageComponent.getImageNetworkImage(url: avatar),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: size.width * .02,
              children: [
                SizedBox(height: size.height * .01),
                //NICKNAME
                Container(
                  height: size.height * 0.03,
                  width: size.width * 0.5,
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                  decoration: BoxDecoration(
                    color: PaletteTheme.categoryColors,
                    borderRadius:
                        BorderRadius.circular(ButtonsTheme.borderRadius),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Texto ajustable con espacio dinámico
                      Flexible(
                        child: GradientText(
                          maxLines: 1,
                          text: nickName,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(width: size.width * .02),
                      Icon(Iconsax.verify_bold, color: Colors.blue),
                    ],
                  ),
                ),

                //NOMBRE
                Text(
                  name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SharedComponents extends StatelessWidget {
  final String title;
  final String subtitle;
  const SharedComponents({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: size.height * .005,
      children: [
        Text(
          title,
          textAlign: TextAlign.start,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        Text(
          subtitle,
          textAlign: TextAlign.start,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(fontWeight: FontWeight.bold, fontSize: 12),
        ),
      ],
    );
  }
}

class _SubtitleComponent extends StatelessWidget {
  final String subtitle;
  final int maxLines;
  const _SubtitleComponent({
    required this.subtitle,
    required this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      subtitle,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.start,
    );
  }
}

class _TitleComponent extends StatelessWidget {
  final String title;

  const _TitleComponent({
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.start,
      style: Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(fontWeight: FontWeight.bold),
    );
  }
}
