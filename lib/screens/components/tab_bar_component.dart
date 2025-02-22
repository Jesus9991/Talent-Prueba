import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';
import 'package:talent_pitch/controllers/exports/exports.dart';

/*
COMPONENTE: para el tab bar del perfil
*/
class TabBarComponent extends StatelessWidget {
  const TabBarComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<PlaylistUserProvider>(
      builder: (context, playList, child) {
        return SliverToBoxAdapter(
          child: Container(
            height: size.height * .08,
            width: size.width,
            alignment: Alignment.center,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: size.width * .25,
              children: [
                /*seleccion de categoria*/
                InkWell(
                  splashColor: PaletteTheme.transparent,
                  onTap: () async {
                    playList.setSelectTabBar(true);
                    await VibrationEffectService().vibrationEffect();
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: size.height * .01,
                    children: [
                      Icon(
                        Iconsax.grid_1_outline,
                        size: 25,
                      ),
                      if (playList.selectTabBar == 0)
                        _ContainerSelect()
                      else
                        SizedBox(
                            height: size.height * .007, width: size.width * .1)
                    ],
                  ),
                ),
                InkWell(
                  splashColor: PaletteTheme.transparent,
                  onTap: () async {
                    playList.setSelectTabBar(false);
                    await VibrationEffectService().vibrationEffect();
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: size.height * .01,
                    children: [
                      Icon(
                        Iconsax.category_2_outline,
                        size: 25,
                      ),
                      if (playList.selectTabBar == 1)
                        _ContainerSelect()
                      else
                        SizedBox(
                            height: size.height * .007, width: size.width * .1)
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _ContainerSelect extends StatelessWidget {
  const _ContainerSelect();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<PlaylistUserProvider>(
      builder: (context, value, child) {
        return Container(
          height: size.height * .007,
          width: size.width * .1,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(ButtonsTheme.borderRadius),
            gradient: LinearGradient(colors: [
              PaletteTheme.blueViolet,
              PaletteTheme.redColor,
            ]),
          ),
        );
      },
    );
  }
}
