import 'package:flutter/material.dart';
import 'package:talent_pitch/controllers/exports/exports.dart';

/*
custom para manejar los botones
*/
class CustomButton extends StatelessWidget {
  final String text;
  final Function onTap;
  final List<Color>? gradientColors;

  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.gradientColors,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height * .05,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors ??
              [
                PaletteTheme.blueViolet,
                PaletteTheme.redColor,
              ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.transparent,
          elevation: 0,
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: () => onTap(),
        child: Text(
          text,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
