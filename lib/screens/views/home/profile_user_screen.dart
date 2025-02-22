import 'package:flutter/material.dart';
import 'package:talent_pitch/controllers/exports/exports.dart';

/*
Pantalla para visualizar la pantalla del perfil
*/

class ProfileUserScreen extends StatelessWidget {
  const ProfileUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
        ],
      ),
    );
  }
}
