import 'dart:async';

import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';
import 'package:talent_pitch/controllers/exports/exports.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';

/*
PANTALLA PARA REPRODUCIR EL VIDEO EN PANTALLA COMPLETA
*/
class OpenVideoScreen extends StatefulWidget {
  final String title; //usamos herencia de datos para usar los datos en memoria
  final String userName;
  final String avatar;
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
  final VideoPlayerController controller;
  const OpenVideoScreen({
    super.key,
    required this.title,
    required this.userName,
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
    required this.controller,
    required this.skills,
    required this.tools,
    required this.hobbies,
  });

  @override
  State<OpenVideoScreen> createState() => _OpenVideoScreenState();
}

class _OpenVideoScreenState extends State<OpenVideoScreen> {
  bool _showControls = true;
  Timer? _hideControlsTimer;

  @override
  void initState() {
    super.initState();
    _startHideControlsTimer();
  }

  void _toggleControls() {
    setState(() {
      _showControls = true;
    });

    _startHideControlsTimer();
  }

  void _startHideControlsTimer() {
    _hideControlsTimer?.cancel();
    _hideControlsTimer = Timer(Duration(seconds: 3), () {
      setState(() {
        _showControls = false;
      });
    });
  }

  @override
  void dispose() {
    _hideControlsTimer?.cancel();
    super.dispose();
  }

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
                    InkWell(
                        onTap: () => _toggleControls(),
                        child: VideoPlayer(widget.controller)),
                    if (_showControls)
                      Container(
                        height: size.height,
                        width: size.width,
                        color: PaletteTheme.secondary
                            .withAlpha((0.6 * 255).toInt()),
                      ),
                    /*linea de progreso */
                    VideoProgressIndicator(
                      widget.controller,
                      allowScrubbing: true,
                      colors: VideoProgressColors(
                          playedColor: PaletteTheme.principal,
                          backgroundColor: PaletteTheme.principal
                              .withAlpha((0.2 * 255).toInt()),
                          bufferedColor: PaletteTheme.principal
                              .withAlpha((0.3 * 255).toInt())),
                    ),

                    //icono para pausar, adelantar o retroceder
                    if (_showControls)
                      Align(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(Iconsax.backward_10_seconds_outline,
                                  size: 30),
                              onPressed: () {
                                widget.controller.seekTo(
                                  widget.controller.value.position -
                                      Duration(seconds: 10),
                                );
                              },
                            ),
                            IconButton(
                              icon: Icon(
                                  widget.controller.value.isPlaying
                                      ? Iconsax.pause_circle_outline
                                      : Iconsax.play_outline,
                                  size: 30),
                              onPressed: () {
                                widget.controller.value.isPlaying
                                    ? widget.controller.pause()
                                    : widget.controller.play();
                              },
                            ),
                            IconButton(
                              icon: Icon(Iconsax.forward_10_seconds_outline,
                                  size: 30),
                              onPressed: () {
                                widget.controller.seekTo(
                                  widget.controller.value.position +
                                      Duration(seconds: 10),
                                );
                              },
                            ),
                          ],
                        ),
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
                      image: widget.avatar,
                      fit: BoxFit.contain,
                    ),
                    title: GradientText(
                      text: widget.userName,
                      maxLines: 1,
                      textAlign: TextAlign.start,
                    ),
                    subtitle: Text(
                      widget.title,
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
                        number: widget.shared,
                        icon: Iconsax.send_2_outline,
                      ),
                      /*numero de review */
                      SharedNumbersComponent(
                        number: widget.review,
                        icon: Iconsax.message_2_outline,
                      ),
                      if (widget.instagram.isNotEmpty)
                        IconContainerTap(
                          icon: Iconsax.instagram_outline,
                          child: GradientIcon(
                              icon: Iconsax.instagram_outline, size: 18),
                          onTap: () async {
                            /*abre el perfil de isntgram */
                            await openUrlInstagram();
                          },
                        ),
                      if (widget.facebook.isNotEmpty)
                        IconContainerTap(
                          icon: Iconsax.facebook_outline,
                          child: GradientIcon(
                              icon: Iconsax.facebook_outline, size: 18),
                          onTap: () async {
                            await openUrlFacebook();
                          },
                        ),
                    ],
                  ),

                  //habilidades
                  if (widget.skills.isNotEmpty)
                    SizedBox(height: size.height * .02),
                  if (widget.skills.isNotEmpty)
                    _TitleComponent(title: 'Habilidades'),
                  if (widget.skills.isNotEmpty)
                    _SubtitleComponent(subtitle: widget.skills),
                  //herramientas
                  if (widget.tools.isNotEmpty)
                    SizedBox(height: size.height * .02),
                  if (widget.tools.isNotEmpty)
                    _TitleComponent(title: 'Herramientas  '),
                  if (widget.tools.isNotEmpty)
                    _SubtitleComponent(subtitle: widget.tools),
                  //leguajes
                  if (widget.languages.isNotEmpty)
                    SizedBox(height: size.height * .02),
                  if (widget.languages.isNotEmpty)
                    _TitleComponent(title: 'Lenguajes'),
                  if (widget.languages.isNotEmpty)
                    _SubtitleComponent(subtitle: widget.languages),

                  if (widget.dreams.isNotEmpty)
                    SizedBox(height: size.height * .02),
                  //sueños
                  if (widget.dreams.isNotEmpty)
                    _TitleComponent(title: 'Marcas de sus sueños'),
                  //descripcion
                  if (widget.dreams.isNotEmpty)
                    _SubtitleComponent(subtitle: widget.dreams),

                  if (widget.rolesDream.isNotEmpty)
                    SizedBox(height: size.height * .02),
                  //roles de ensueño
                  if (widget.rolesDream.isNotEmpty)
                    _TitleComponent(title: 'Roles de ensueño'),
                  if (widget.rolesDream.isNotEmpty)
                    _SubtitleComponent(subtitle: widget.rolesDream),
                  //equipo de ensueño
                  if (widget.dreamTeam.isNotEmpty)
                    SizedBox(height: size.height * .02),
                  if (widget.dreamTeam.isNotEmpty)
                    _TitleComponent(title: 'Equipo de ensueño'),
                  if (widget.dreamTeam.isNotEmpty)
                    _SubtitleComponent(subtitle: widget.dreamTeam),
                  //conocimientos
                  if (widget.knowledge.isNotEmpty)
                    SizedBox(height: size.height * .02),
                  if (widget.knowledge.isNotEmpty)
                    _TitleComponent(title: 'Conocimientos'),
                  if (widget.knowledge.isNotEmpty)
                    _SubtitleComponent(subtitle: widget.knowledge),
                  //tags
                  if (widget.hobbies.isNotEmpty)
                    SizedBox(height: size.height * .02),
                  if (widget.hobbies.isNotEmpty)
                    Wrap(
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      spacing: size.width * .03,
                      runSpacing: size.height * .005,
                      children: widget.hobbies.map((hobby) {
                        return Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * .03,
                              vertical: size.height * .005),
                          decoration: BoxDecoration(
                            color: PaletteTheme.greyDark
                                .withAlpha((0.2 * 255).toInt()),
                            borderRadius: BorderRadius.circular(
                                ButtonsTheme.borderRadius),
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
    final Uri appUri =
        Uri.parse('instagram://user?username=${widget.instagram}');
    final Uri webUri =
        Uri.parse('https://www.instagram.com/${widget.instagram}');
    if (await canLaunchUrl(appUri)) {
      await launchUrl(appUri);
    } else {
      await launchUrl(webUri, mode: LaunchMode.externalApplication);
    }
  }

  /*abre facebook*/
  openUrlFacebook() async {
    final Uri appUri = Uri.parse('fb://profile/${widget.facebook}');
    final Uri webUri = Uri.parse('https://www.facebook.com/${widget.facebook}');
    if (await canLaunchUrl(appUri)) {
      await launchUrl(appUri);
    } else {
      await launchUrl(webUri, mode: LaunchMode.externalApplication);
    }
  }
}

class _SubtitleComponent extends StatelessWidget {
  final String subtitle;
  const _SubtitleComponent({required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Text(
      subtitle,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.start,
    );
  }
}

class _TitleComponent extends StatelessWidget {
  final String title;
  const _TitleComponent({required this.title});

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