import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:talent_pitch/controllers/exports/exports.dart';
/*
COMPONENTS: appbars para toda lapp
*/

class AppbarHomeComponents extends StatelessWidget {
  const AppbarHomeComponents({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SliverAppBar(
      toolbarHeight: size.height * .01,
      expandedHeight: size.height * .01,
      elevation: 0,
      pinned: true,
      backgroundColor: PaletteTheme.transparent,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        stretchModes: [
          StretchMode.blurBackground,
          StretchMode.zoomBackground,
        ],
        background: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: size.height * .04),
              padding: EdgeInsets.symmetric(horizontal: size.width * .04),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /*logo del app */
                  Container(
                    alignment: Alignment.topRight,
                    width: size.width * 0.11,
                    height: size.width * 0.11,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(ImagesPath.bannerBlack)),
                        shape: BoxShape.circle,
                        color: PaletteTheme.principal),
                  ),
                  const Spacer(),
                  /*buscado*/
                  CircleButtonsComponent(
                    icon: Iconsax.search_normal_1_outline,
                    onTap: () {
                      //Todo: debe abrir el buscador
                    },
                  ),
                  SizedBox(width: size.width * .03),
                  CircleButtonsComponent(
                    icon: Iconsax.notification_outline,
                    onTap: () {
                      //Todo: debe navegar a las notificaciones
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AppBarProfileComponents extends StatelessWidget {
  const AppBarProfileComponents({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SliverAppBar(
      toolbarHeight: size.height * .25,
      expandedHeight: size.height * .25,
      elevation: 0,
      floating: true,
      pinned: true,
      actions: [
        Padding(
          padding: EdgeInsets.only(right: size.width * .03),
          child: Align(
            alignment: Alignment.topRight,
            child: CircleButtonsComponent(
              icon: Icons.more_vert_sharp,
              onTap: () {
                //Todo: debe navegar a editar el perfil
              },
            ),
          ),
        ),
      ],
      backgroundColor: PaletteTheme.transparent,
      flexibleSpace: FlexibleSpaceBar(
          collapseMode: CollapseMode.parallax,
          stretchModes: [
            StretchMode.blurBackground,
            StretchMode.zoomBackground,
          ],
          background: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              /*imagen de fondo*/
              SizedBox(
                height: size.height,
                width: size.width,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(
                      'https://plus.unsplash.com/premium_photo-1671656349218-5218444643d8?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8YXZhdGFyfGVufDB8fDB8fHww',
                      fit: BoxFit.cover,
                    ),
                    Positioned.fill(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                        child: Container(
                          color: PaletteTheme.transparent
                              .withAlpha((0.2 * 255).toInt()),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: size.height * .4,
                width: size.width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  end: Alignment.topCenter,
                  begin: Alignment.bottomCenter,
                  colors: [
                    PaletteTheme.secondary.withAlpha((1 * 255).toInt()),
                    PaletteTheme.secondary.withAlpha((0.0 * 255).toInt()),
                  ],
                )),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /*foto de perfil*/
                  SizedBox(
                    height: size.height * .12,
                    child: PhotoBorderGradientComponent(
                      height: size.height * 0.6,
                      width: size.width * .3,
                      padding: 4,
                      image:
                          'https://plus.unsplash.com/premium_photo-1671656349218-5218444643d8?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8YXZhdGFyfGVufDB8fDB8fHww',
                    ),
                  ),
                  Text(
                    'NAME USER.DATA',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'email@example.com.co',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
