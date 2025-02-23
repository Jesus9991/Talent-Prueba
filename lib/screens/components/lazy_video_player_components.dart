import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talent_pitch/controllers/exports/exports_screen.dart';
import 'package:video_player/video_player.dart';
import 'package:talent_pitch/controllers/exports/exports.dart';
import 'package:visibility_detector/visibility_detector.dart';

class LazyVideoPlayerComponents extends StatelessWidget {
  final String? videoUrl;
  final String image;
  final String title;
  final String avatar;
  final String userName;
  final String shared;
  final String review;
  final String instagram;
  final String facebook;
  final String dreams;
  final String rolesDream;
  final String dreamTeam;
  final String knowledge;
  final String languages;
  final String skills;
  final String tools;
  final List<String> hobbies;
  const LazyVideoPlayerComponents({
    super.key,
    required this.videoUrl,
    required this.image,
    required this.userName,
    required this.title,
    required this.avatar,
    required this.shared,
    required this.review,
    required this.instagram,
    required this.facebook,
    required this.dreams,
    required this.rolesDream,
    required this.dreamTeam,
    required this.knowledge,
    required this.languages,
    required this.skills,
    required this.tools,
    required this.hobbies,
  });

  @override
  Widget build(BuildContext context) {
    final videoProvider = Provider.of<VideoReproductionProvider>(context);
    final size = MediaQuery.of(context).size;
    final isiOS = Platform.isIOS;
    return VisibilityDetector(
      key: Key(videoUrl ?? 'no_video'),
      onVisibilityChanged: (info) {
        if (videoUrl != null && videoUrl!.isNotEmpty) {
          if (info.visibleFraction > 0.5) {
            videoProvider.initializeVideo(videoUrl!).then((_) {
              videoProvider.playVideo(videoUrl!);
            });
          } else if (info.visibleFraction == 0.0) {
            videoProvider.pauseVideo(videoUrl!);
          }
        }
      },
      child: videoUrl == null || videoUrl == ''
          ? _buildPitchCard(image: image)
          : Consumer<VideoReproductionProvider>(
              builder: (context, provider, child) {
                final controller = provider.getController(videoUrl!);
                if (controller != null && provider.isVideoLoaded(videoUrl!)) {
                  return InkWell(
                    onTap: () {
                      final controller = videoProvider.getController(videoUrl!);
                      if (controller != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OpenVideoScreen(
                              title: title,
                              userName: userName,
                              avatar: avatar,
                              controller: controller,
                              shared: shared,
                              review: review,
                              facebook: facebook,
                              instagram: instagram,
                              dreams: dreams,
                              rolesDream: rolesDream,
                              dreamTeam: dreamTeam,
                              knowledge: knowledge,
                              languages: languages,
                              skills: skills,
                              tools: tools,
                              hobbies: hobbies,
                            ),
                          ),
                        );
                      } else {
                        return SnackbarWidget.showSnackBar(
                            context: context,
                            message:
                                'Ups! hubo un error al mostrar la información',
                            icon: Icons.error_outline,
                            colorIcon: Colors.red);
                      }
                    },
                    child: AspectRatio(
                      aspectRatio: controller.value.aspectRatio,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          VideoPlayer(controller),
                          /*linea de progreso */
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * .02,
                                vertical: size.height * .01),
                            child: VideoProgressIndicator(
                              controller,
                              allowScrubbing: true,
                              colors: VideoProgressColors(
                                  playedColor: PaletteTheme.principal,
                                  backgroundColor: PaletteTheme.principal
                                      .withAlpha((0.2 * 255).toInt()),
                                  bufferedColor: PaletteTheme.principal
                                      .withAlpha((0.3 * 255).toInt())),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return Center(
                      child: isiOS
                          ? GradientLoading()
                          : CircularProgressIndicator(
                              color: PaletteTheme.secondary,
                            ));
                }
              },
            ),
    );
  }

  /*cuando el video no se pudo reproducir */
  Widget _buildPitchCard({required String image}) {
    return Container(
      decoration: BoxDecoration(
        color: PaletteTheme.secondary,
        borderRadius: BorderRadius.circular(ButtonsTheme.borderCards),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(ButtonsTheme.borderCards),
        child: Image.network(
          image,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => Image.asset(
            ImagesPath.bannerWhite,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
