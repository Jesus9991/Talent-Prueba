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
                    child: Icon(
                      reaction.isFavorite
                          ? Iconsax.heart_bold
                          : Iconsax.heart_outline,
                      color: PaletteTheme.grey,
                    ),
                  ),
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
  final String emoji;
  const ReactionNumber({
    super.key,
    required this.emoji,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<AddReactionProvider>(
      builder: (context, reaction, child) {
        return Container(
          height: size.height * .03,
          width: size.width * .15,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: PaletteTheme.categoryColors,
            borderRadius: BorderRadius.circular(ButtonsTheme.borderRadius),
          ),
          child: IntrinsicWidth(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: size.width * .01,
              children: [
                Icon(Iconsax.heart_bold, size: 15, color: Colors.red),
                Text(
                  reaction.reactionCount.toString(),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
