import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';
import 'package:talent_pitch/controllers/exports/exports.dart';
import 'package:video_player/video_player.dart';

/*
pantalla scroll page para vizualiza videos
*/
class DiscoverVideosScreen extends StatelessWidget {
  const DiscoverVideosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: _PageViewComponent(),
    );
  }
}

/*
COMPONENTE PARA EL SCROLL PAGE VIEW
*/

class _PageViewComponent extends StatelessWidget {
  const _PageViewComponent();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final disc = Provider.of<DiscoverVideosProvider>(context);
    return Consumer<MostViewedPortfoliosProvider>(
      builder: (context, talent, child) {
        if (talent.isLoading) {
          return Center(child: GradientLoading());
        }
        if (talent.errorMessage != null) {
          return Center(
            child: EmptyStateComponents(
                title: 'Error en los datos',
                subtitle: 'Hubo un error: ${talent.errorMessage}'),
          );
        }
        if (talent.talentModel.data.isEmpty) {
          return Center(
            child: EmptyStateComponents(
                title: 'No se encontraron datos',
                subtitle: 'No hay videos para mostrar en la lista.'),
          );
        }

        /*inicializa videos solo si aún no se han cargado */
        if (disc.videoControllers.isEmpty) {
          disc.initializeVideos(
            talent.talentModel.data.map((e) => e.videoUrl).toList(),
          );
        }

        return PageView.builder(
          itemCount: talent.talentModel.data.length,
          controller: disc.pageController,
          scrollDirection: Axis.vertical,
          onPageChanged: (index) {
            disc.playVideo(index);
          },
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            final data = talent.talentModel.data[index];
            final videoController = disc.videoControllers[index];

            return SizedBox(
              height: size.height,
              width: size.width,
              child: Stack(
                children: [
                  if (videoController != null &&
                      videoController.value.isInitialized)
                    VideoPlayer(videoController)
                  else
                    Center(child: GradientLoading()),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: size.height * .3,
                      width: size.width,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                        end: Alignment.topCenter,
                        begin: Alignment.bottomCenter,
                        colors: [
                          PaletteTheme.secondary.withAlpha((0.9 * 255).toInt()),
                          PaletteTheme.secondary.withAlpha((0 * 255).toInt()),
                        ],
                      )),
                    ),
                  ),
                  /*informacion de usuario*/
                  _DetailsComponents(
                    name: data.name,
                    nickName: data.slug,
                    imagen: data.avatar,
                    hobbies: data.hobbies,
                    about: data.about,
                    shared: data.matchesCount.toString(),
                    review: data.reviewCount.toString(),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class _DetailsComponents extends StatelessWidget {
  final String name;
  final String nickName;
  final String imagen;
  final List<String> hobbies;
  final String about;
  final String shared;
  final String review;

  const _DetailsComponents({
    required this.name,
    required this.nickName,
    required this.imagen,
    required this.hobbies,
    required this.about,
    required this.shared,
    required this.review,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return /*nombre del usuario*/
        Padding(
      padding: EdgeInsets.symmetric(
          vertical: size.height * .15, horizontal: size.width * .04),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DiscoverInfoComponent(
                name: name,
                nickName: nickName,
                avatar: imagen,
              ),
              if (hobbies.isNotEmpty)
                GradientText(text: "#${hobbies.join(" #")}"),
              Text(
                about,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
              )
            ],
          ),
          /*añade a la lists */
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.only(bottom: size.height * .18),
              child: Column(
                // spacing: size.height * .02,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  //
                  IconBlurComponents(icon: Iconsax.send_2_outline),
                  _TextComponent(title: shared),
                  SizedBox(height: size.height * .01),
                  //
                  IconBlurComponents(icon: Iconsax.message_2_outline),
                  _TextComponent(title: review),
                  SizedBox(height: size.height * .01),
                  //añadir a favoritos
                  CircleButtonsComponent(
                    icon: Iconsax.archive_add_outline,
                    onTap: () async {
                      //Todo: debe añadir a la lista

                      await VibrationEffectService().vibrationEffect();
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
    /*guardar en lista*/
  }
}

class _TextComponent extends StatelessWidget {
  final String title;
  const _TextComponent({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
