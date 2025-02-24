import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';
import 'package:talent_pitch/controllers/exports/exports.dart';

/*
Pantalla para visualizar la pantalla del perfil
*/

class ProfileUserScreen extends StatelessWidget {
  const ProfileUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tapPrv = Provider.of<PlaylistUserProvider>(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        slivers: [
          /*appbar*/
          AppBarProfileComponents(),
          /*tap bar */
          TabBarComponent(),
          /*lista de todas los videos guardados*/
          if (tapPrv.selectTabBar == 0) _AllSavedVideosComponent()
        ],
      ),
    );
  }
}

class _AllSavedVideosComponent extends StatelessWidget {
  const _AllSavedVideosComponent();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<SavePlaylistProvider>(
      builder: (context, value, child) {
        if (value.isloading) {
          return const SliverToBoxAdapter(
            child: ListMostPortafolio(),
          );
        }
        if (value.savedVideos.isEmpty) {
          return const SliverToBoxAdapter(
            child: Center(
              child: EmptyStateComponents(
                  title: 'No hay videos',
                  subtitle: 'Aún no ha guardado videos'),
            ),
          );
        }
        return SliverList.separated(
          itemCount: value.savedVideos.length,
          separatorBuilder: (context, index) =>
              SizedBox(height: size.height * .03),
          itemBuilder: (context, index) {
            final data = value.savedVideos[index];
            return Container(
              height: size.height * .27,
              width: size.width,
              margin: EdgeInsets.symmetric(horizontal: size.width * .04),
              padding: EdgeInsets.symmetric(horizontal: size.width * .025),
              child: FadeInComponent(
                child: Column(
                  spacing: size.height * .01,
                  children: [
                    //banner
                    Stack(
                      children: [
                        Container(
                          height: size.height * .2,
                          width: size.width,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image:
                                    NetworkImageComponent.getImageNetworkImage(
                                        url: data.avatar)),
                            borderRadius:
                                BorderRadius.circular(ButtonsTheme.borderCards),
                          ),
                          child: IconBlurComponents(
                            icon: Iconsax.play_outline,
                          ),
                          // child: ,
                        ),
                      ],
                    ),
                    //informacion
                    UserPhotoNameComponent(
                      image: data.avatar,
                      name: data.name,
                      createdAt: '',
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
