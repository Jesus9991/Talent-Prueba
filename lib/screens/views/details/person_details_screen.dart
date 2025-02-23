import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:talent_pitch/controllers/exports/exports.dart';
import 'package:video_player/video_player.dart';

/*
PANTALLA: para los detalles de la persona, seleccionada en el home
*/
class PersonDetailsScreen extends StatelessWidget {
  final int id;
  final String name;
  final String nickName;
  final String image;
  final int shared;
  final int review;
  final String instagram;
  final String facebook;
  final String about;
  final String career;
  final String languages;
  final String position;
  final String skills;
  final String tools;
  final String knowledge;
  final List<String> hobbies;
  final String? videoUrl;
  final String resumeImage;

  const PersonDetailsScreen({
    super.key,
    required this.id,
    required this.name,
    required this.image,
    required this.nickName,
    required this.shared,
    required this.review,
    required this.instagram,
    required this.facebook,
    required this.about,
    required this.career,
    required this.languages,
    required this.position,
    required this.skills,
    required this.tools,
    required this.knowledge,
    required this.hobbies,
    this.videoUrl,
    required this.resumeImage,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GradientWithoutAppComponent(
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        slivers: [
          DetailsPersonComponent(
            videoUrl: videoUrl,
            image: resumeImage,
          ),
          //compartidos
          _ContainerInformation(
            review: review,
            shared: shared,
            title: name,
            image: image,
            facebook: facebook,
            instagram: instagram,
          ),
          const DividerComponent(),
          /*nombre del usuario*/
          NamePersonComponent(
            name: name,
            nickName: nickName,
            avatar: image,
          ),
          //descripcion
          if (about.isNotEmpty)
            ColumnDetailsComponents(
              title: 'Acerca de',
              subtitle: about,
              maxLines: 4,
            ),
          if (about.isNotEmpty) const DividerComponent(),
          //profesion
          if (career.isNotEmpty)
            ColumnDetailsComponents(
              title: 'Profesión',
              subtitle: career,
              maxLines: 2,
            ),
          if (career.isNotEmpty) const DividerComponent(),
          //idiomas
          if (languages.isNotEmpty)
            ColumnDetailsComponents(
              title: 'Idiomas',
              subtitle: languages,
              maxLines: 2,
            ),
          if (languages.isNotEmpty) const DividerComponent(),
          //position
          if (position.isNotEmpty)
            ColumnDetailsComponents(
              title: 'Posición',
              subtitle: position,
              maxLines: 2,
            ),
          if (position.isNotEmpty) const DividerComponent(),

          //skills
          if (skills.isNotEmpty)
            ColumnDetailsComponents(
              title: 'Habilidades',
              subtitle: skills,
              maxLines: 2,
            ),
          if (skills.isNotEmpty) const DividerComponent(),
          //herramientas
          if (tools.isNotEmpty)
            ColumnDetailsComponents(
              title: 'Herramientas',
              subtitle: tools,
              maxLines: 2,
            ),
          if (tools.isNotEmpty) const DividerComponent(),
          //conocimientos
          if (knowledge.isNotEmpty)
            ColumnDetailsComponents(
              title: 'Conocimientos',
              subtitle: knowledge,
              maxLines: 2,
            ),
          if (knowledge.isNotEmpty) const DividerComponent(),
          //hobbies
          if (hobbies.isNotEmpty)
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * .04),
                child: Wrap(
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  spacing: size.width * .03,
                  runSpacing: size.height * .005,
                  children: hobbies.map((hobby) {
                    return Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * .03,
                          vertical: size.height * .005),
                      decoration: BoxDecoration(
                        color: PaletteTheme.greyDark
                            .withAlpha((0.2 * 255).toInt()),
                        borderRadius:
                            BorderRadius.circular(ButtonsTheme.borderRadius),
                      ),
                      child: GradientText(
                        text: '#$hobby',
                        gradient: LinearGradient(colors: [
                          PaletteTheme.deepFucsia,
                          PaletteTheme.orange
                        ]),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          SliverToBoxAdapter(child: SizedBox(height: size.height * .1))
        ],
      ),
    );
  }
}

class _ContainerInformation extends StatelessWidget {
  final int review;
  final int shared;
  final String title;
  final String image;
  final String instagram;
  final String facebook;
  const _ContainerInformation({
    required this.review,
    required this.shared,
    required this.title,
    required this.image,
    required this.instagram,
    required this.facebook,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SliverToBoxAdapter(
      child: Container(
        height: size.height * .05,
        width: size.width,
        margin: EdgeInsets.symmetric(vertical: size.height * .02),
        padding: EdgeInsets.symmetric(horizontal: size.width * .04),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SharedComponents(title: '$shared', subtitle: 'Compartidos'),
            SizedBox(width: size.width * .08),
            SharedComponents(title: '$review', subtitle: 'Comentarios'),
            const Spacer(),
            //redes sociales
            if (instagram.isNotEmpty)
              IconContainerTap(
                icon: Iconsax.instagram_outline,
                child: GradientIcon(icon: Iconsax.instagram_outline, size: 18),
                onTap: () async {
                  await OpenUrlSocialServices().openUrlInstagram(instagram);
                },
              ),
            if (facebook.isNotEmpty) SizedBox(width: size.width * .01),
            if (facebook.isNotEmpty)
              IconContainerTap(
                icon: Iconsax.facebook_outline,
                child: GradientIcon(icon: Iconsax.facebook_outline, size: 18),
                onTap: () async {
                  await OpenUrlSocialServices().openUrlFacebook(facebook);
                },
              ),
          ],
        ),
      ),
    );
  }
}

class DividerComponent extends StatelessWidget {
  const DividerComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * .04),
        child: const Divider(
          height: 1,
          thickness: 0.1,
        ),
      ),
    );
  }
}
