import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';
import 'package:talent_pitch/controllers/exports/exports.dart';
/*
modela reuzables
*/

class ModalSheetWidget {
  //modal con 2 opciones
  static void showSelectTwoOption({
    required BuildContext context,
    required int videoId,
    required Function onCancel,
  }) {
    showModalBottomSheet(
      elevation: 0,
      context: context,
      isDismissible: false,
      enableDrag: true,
      isScrollControlled: true,
      builder: (context) => _ContainerListPlayList(
        videoId: videoId,
        onTap: () => onCancel(),
      ),
    );
  }

/*modal para crear una lista de proudcciones*/
  static void createPlaylist({
    required BuildContext context,
    required int videoId,
    required Function onCancel,
  }) {
    showDialog(
        // elevation: 0,
        context: context,
        // isDismissible: false,
        // enableDrag: true,
        // isScrollControlled: true,
        builder: (context) => AlertDialog(
              content: _CreatePlayList(
                onTap: () => onCancel(),
              ),
            ));
  }
}

class _CreatePlayList extends StatefulWidget {
  final Function onTap;
  const _CreatePlayList({
    required this.onTap,
  });

  @override
  State<_CreatePlayList> createState() => _CreatePlayListState();
}

class _CreatePlayListState extends State<_CreatePlayList> {
  /*key*/
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final playlist = Provider.of<PlaylistUserProvider>(context);
    final value = Provider.of<SavePlaylistProvider>(context);

    return Container(
      height: size.height * .3,
      width: size.width,
      padding: EdgeInsets.symmetric(
          horizontal: size.height * .03, vertical: size.height * .03),
      decoration: BoxDecoration(
        color: PaletteTheme.secondary,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: Form(
        key: formKey,
        child: ListView(
          children: [
            InputsComponents(
              title: 'Ingresar nombre',
              hintext: 'Playlist',
              validator: (val) {
                return null;
              },
              onChanged: (val) => playlist.setPlayListName(val),
            ),
            SizedBox(height: size.height * .03),
            CustomButton(
              text: 'Crear nueva playlist',
              onTap: () async {
                if (formKey.currentState!.validate()) {
                  /*cierra el modal*/
                  Navigator.pop(context);

                  await value.addPlaylist(playlist.playListName.text);

                  /*recarga las listas */
                  await value.loadSavedVideos();
                  await value.loadPlaylists();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

/*para mostrar la lista de reprdocucciones*/
class _ContainerListPlayList extends StatelessWidget {
  final int videoId;
  final Function onTap;
  const _ContainerListPlayList({
    required this.videoId,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .6,
      width: size.width,
      padding: EdgeInsets.symmetric(
          horizontal: size.height * .03, vertical: size.height * .03),
      decoration: BoxDecoration(
        color: PaletteTheme.secondary,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: Stack(
        children: [
          Consumer<SavePlaylistProvider>(
            builder: (context, value, child) {
              if (value.playlists.isEmpty) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  // spacing: size.height * .01,
                  children: [
                    EmptyStateComponents(
                      title: 'No se encontraron playlist',
                      subtitle: 'Crea tu primera playlist para continuar',
                    ),
                    CustomButton(
                      text: 'Crear nueva playlist',
                      onTap: () async {
                        /*cierra el modal*/
                        Navigator.pop(context);
                        /*abre el nuevo modal*/
                        ModalSheetWidget.createPlaylist(
                          context: context,
                          videoId: videoId,
                          onCancel: () => onTap(),
                        );
                        /*recarga las listas */
                        await value.loadSavedVideos();
                        await value.loadPlaylists();
                      },
                    ),
                  ],
                );
              }
              return ListView.separated(
                itemCount: value.playlists.length,
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * .03, vertical: size.height * .05),
                separatorBuilder: (context, index) =>
                    SizedBox(height: size.height * .03),
                itemBuilder: (context, index) {
                  final data = value.playlists[index];
                  return ListTile(
                    onTap: () async {
                      Navigator.pop(context);
                      /*GUARDA EL VIDEO EN LA PLAYLIST*/
                      await value.addVideoToPlaylist(videoId,
                          playlistId: data.id);
                    },
                    leading: Text(
                      data.name,
                      maxLines: 1,
                      textAlign: TextAlign.start,
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(
                      'Añadir videos',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.end,
                    ),
                  );
                },
              );
            },
          ),
          Align(
            alignment: Alignment.topRight,
            child: CircleButtonsComponent(
                icon: Iconsax.close_circle_outline, onTap: () => onTap()),
          ),
        ],
      ),
    );
  }
}
