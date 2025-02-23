import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';
import 'package:talent_pitch/controllers/exports/exports.dart';

/*
componente para ver el numero de reacciones
*/

class ReactionAddComponent extends StatefulWidget {
  const ReactionAddComponent({super.key});

  @override
  State<ReactionAddComponent> createState() => _ReactionAddComponentState();
}

class _ReactionAddComponentState extends State<ReactionAddComponent>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _shakeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _shakeAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0, end: 8), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 8, end: -8), weight: 2),
      TweenSequenceItem(tween: Tween(begin: -8, end: 5), weight: 2),
      TweenSequenceItem(tween: Tween(begin: 5, end: -5), weight: 2),
      TweenSequenceItem(tween: Tween(begin: -5, end: 2), weight: 2),
      TweenSequenceItem(tween: Tween(begin: 2, end: 0), weight: 1),
    ]).animate(_controller);
  }

  void _startShake() {
    _controller.forward(from: 0); // Inicia la animación de sacudida
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<AddReactionProvider>(
      builder: (context, reaction, child) {
        return GestureDetector(
          onTap: () async {
            /*activa la animacion de sacudida*/
            _startShake();
            /*marca como favorito*/
            reaction.toggleFavorite();
            /*efecto al vibrar*/
            await VibrationEffectService().vibrationEffect();
          },
          child: AnimatedBuilder(
            animation: _shakeAnimation,
            builder: (context, child) {
              return Transform.translate(
                offset:
                    Offset(_shakeAnimation.value, 0), // Movimiento horizontal
                child: Container(
                  height: size.height * .03,
                  width: size.width * .15,
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: PaletteTheme.categoryColors,
                    borderRadius:
                        BorderRadius.circular(ButtonsTheme.borderRadius),
                  ),
                  child: Center(
                      child: reaction.isFavorite
                          ? GradientIcon(icon: Iconsax.star_bold, size: 20)
                          : Icon(Iconsax.star_1_outline,
                              color: PaletteTheme.grey, size: 20)),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

/*numero de reacciones */
class ReactionNumber extends StatelessWidget {
  const ReactionNumber({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<AddReactionProvider>(
      builder: (context, reaction, child) {
        return Container(
          height: size.height * .03,
          width: size.width * .18,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: PaletteTheme.categoryColors,
            borderRadius: BorderRadius.circular(ButtonsTheme.borderRadius),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: size.width * .01,
            children: [
              Icon(Iconsax.star_1_outline, size: 15),
              SizedBox(
                width: size.width * .07,
                child: Text(
                  reaction.reactionCount.toString(),
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class SharedNumbersComponent extends StatelessWidget {
  final String number;
  final IconData icon;
  final double? height;
  final double? weight;
  const SharedNumbersComponent({
    super.key,
    required this.number,
    required this.icon,
    this.height,
    this.weight,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: height ?? size.height * .03,
      width: weight ?? size.width * .18,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: PaletteTheme.categoryColors,
        borderRadius: BorderRadius.circular(ButtonsTheme.borderRadius),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: size.width * .01,
        children: [
          Icon(icon, size: 15),
          SizedBox(
            width: size.width * .07,
            child: Text(
              number,
              textAlign: TextAlign.start,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          )
        ],
      ),
    );
  }
}

class IconContainerTap extends StatelessWidget {
  final IconData icon;
  final double? height;
  final double? weight;
  final Function onTap;
  const IconContainerTap({
    super.key,
    required this.icon,
    this.height,
    this.weight,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        height: height ?? size.height * .03,
        width: weight ?? size.width * .18,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: PaletteTheme.categoryColors,
          borderRadius: BorderRadius.circular(ButtonsTheme.borderRadius),
        ),
        child: Center(child: Icon(icon, size: 15)),
      ),
    );
  }
}
