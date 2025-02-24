import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:talent_pitch/controllers/exports/exports.dart';

/*
COMPONENTES: para la pantalla de discover
*/
class DiscoverInfoComponent extends StatelessWidget {
  final String name;
  final String nickName;
  final String avatar;
  const DiscoverInfoComponent({
    super.key,
    required this.name,
    required this.nickName,
    required this.avatar,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .1,
      margin: EdgeInsets.symmetric(horizontal: size.width * .04),
      child: Row(
        spacing: size.width * .02,
        children: [
          CircleAvatar(
            backgroundColor: PaletteTheme.categoryColors,
            backgroundImage:
                NetworkImageComponent.getImageNetworkImage(url: avatar),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: size.width * .02,
            children: [
              SizedBox(height: size.height * .01),
              //NICKNAME
              ClipRRect(
                borderRadius: BorderRadius.circular(ButtonsTheme.borderRadius),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                  child: Container(
                    height: size.height * 0.035,
                    width: size.width * 0.4,
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.04),
                    decoration: BoxDecoration(
                      color:
                          PaletteTheme.principal.withAlpha((0.3 * 255).toInt()),
                      borderRadius:
                          BorderRadius.circular(ButtonsTheme.borderRadius),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        /*texto ajustable con espacio dinamico */
                        Flexible(
                          child: GradientText(
                            maxLines: 1,
                            text: nickName,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(width: size.width * .02),
                        Icon(Iconsax.verify_bold, color: Colors.blue),
                      ],
                    ),
                  ),
                ),
              ),

              //NOMBRE
              Text(
                name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
