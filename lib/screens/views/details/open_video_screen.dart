import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';
import 'package:talent_pitch/controllers/exports/exports.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';

/*
PANTALLA PARA REPRODUCIR EL VIDEO EN PANTALLA COMPLETA
*/
class OpenVideoScreen extends StatelessWidget {
  final String title; //usamos herencia de datos para usar los datos en memoria
  final String userName;
  final String avatar;
  final String shared;
  final String review;
  final String instagram;
  final String facebook;
  final VideoPlayerController controller;
  const OpenVideoScreen({
    super.key,
    required this.title,
    required this.userName,
    required this.avatar,
    required this.controller,
    required this.shared,
    required this.review,
    required this.instagram,
    required this.facebook,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GradientDownBackground(
      child: Consumer<VideoReproductionProvider>(
        builder: (context, view, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              /*video reproduccion*/
              AspectRatio(
                aspectRatio: 12 / 9,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    /*video */
                    VideoPlayer(controller),
                    /*linea de progreso */
                    VideoProgressIndicator(
                      controller,
                      allowScrubbing: true,
                      colors: VideoProgressColors(
                          playedColor: PaletteTheme.principal,
                          backgroundColor: PaletteTheme.principal
                              .withAlpha((0.2 * 255).toInt()),
                          bufferedColor: PaletteTheme.principal
                              .withAlpha((0.3 * 255).toInt())),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: ListView(
                physics: const BouncingScrollPhysics(),
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * .04, vertical: size.height * .02),
                children: [
                  /*titulo, foto y username */
                  ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    leading: PhotoBorderGradientComponent(
                      image: avatar,
                      fit: BoxFit.contain,
                    ),
                    title: GradientText(
                      text: userName,
                      maxLines: 1,
                      textAlign: TextAlign.start,
                    ),
                    subtitle: Text(
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: PaletteTheme.grey,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    spacing: size.width * .02,
                    children: [
                      /*numero de compartidos */
                      SharedNumbersComponent(
                        number: shared,
                        icon: Iconsax.send_2_outline,
                      ),
                      /*numero de review */
                      SharedNumbersComponent(
                        number: review,
                        icon: Iconsax.message_2_outline,
                      ),
                      if (instagram.isNotEmpty)
                        IconContainerTap(
                          icon: Iconsax.instagram_outline,
                          onTap: () async {
                            /*abre el perfil de isntgram */
                            await openUrlInstagram();
                          },
                        ),
                      if (facebook.isNotEmpty)
                        IconContainerTap(
                          icon: Iconsax.facebook_outline,
                          onTap: () async {
                            await openUrlFacebook();
                          },
                        ),
                    ],
                  ),
                ],
              ))
            ],
          );
        },
      ),
    );
  }

  /*abre instagram */
  openUrlInstagram() async {
    final Uri appUri = Uri.parse('instagram://user?username=$instagram');
    final Uri webUri = Uri.parse('https://www.instagram.com/$instagram');
    if (await canLaunchUrl(appUri)) {
      await launchUrl(appUri);
    } else {
      await launchUrl(webUri, mode: LaunchMode.externalApplication);
    }
  }

  /*abre facebook*/
  openUrlFacebook() async {
    final Uri appUri = Uri.parse('fb://profile/$facebook');
    final Uri webUri = Uri.parse('https://www.facebook.com/$facebook');
    if (await canLaunchUrl(appUri)) {
      await launchUrl(appUri);
    } else {
      await launchUrl(webUri, mode: LaunchMode.externalApplication);
    }
  }
}







              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     IconButton(
              //       icon: Icon(Icons.replay_10),
              //       onPressed: () {
              //         controller.seekTo(
              //           controller.value.position - Duration(seconds: 10),
              //         );
              //       },
              //     ),
              //     IconButton(
              //       icon: Icon(controller.value.isPlaying
              //           ? Icons.pause
              //           : Icons.play_arrow),
              //       onPressed: () {
              //         controller.value.isPlaying
              //             ? controller.pause()
              //             : controller.play();
              //       },
              //     ),
              //     IconButton(
              //       icon: Icon(Icons.forward_10),
              //       onPressed: () {
              //         controller.seekTo(
              //           controller.value.position + Duration(seconds: 10),
              //         );
              //       },
              //     ),
              //   ],
              // ),