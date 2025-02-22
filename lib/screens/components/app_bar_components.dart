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
      toolbarHeight: size.height * .02,
      expandedHeight: size.height * .02,
      elevation: 0,
      pinned: false,
      backgroundColor: PaletteTheme.transparent,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        stretchModes: [
          StretchMode.blurBackground,
          StretchMode.zoomBackground,
        ],
        background: Container(
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
    );
  }
}
