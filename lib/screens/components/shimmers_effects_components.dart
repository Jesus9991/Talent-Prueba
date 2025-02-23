import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:talent_pitch/controllers/theme/palette_color_theme.dart';

/*
efecto shimmer
*/
class ShimmerWidget extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;
  final bool isCircular;

  const ShimmerWidget({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius = 8.0,
    this.isCircular = false,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: PaletteTheme.secondary,
      highlightColor: Color.fromRGBO(32, 27, 30, 1),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Color.fromRGBO(32, 27, 30, 1),
          shape: isCircular ? BoxShape.circle : BoxShape.rectangle,
          borderRadius: isCircular ? null : BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}

class ListShimmerHighlight extends StatelessWidget {
  const ListShimmerHighlight({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .15,
      width: size.width,
      alignment: Alignment.topCenter,
      margin: EdgeInsets.only(top: size.height * .03),
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: ListView.separated(
        itemCount: 4,
        padding: EdgeInsets.only(left: size.width * .04),
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        separatorBuilder: (context, index) => SizedBox(width: size.width * .02),
        itemBuilder: (context, index) {
          return SizedBox(
            width: size.width * .26,
            child: Column(
              spacing: size.height * .01,
              children: [
                ShimmerWidget(
                  height: size.height * 0.06,
                  width: size.width * 0.13,
                  isCircular: true,
                ),
                ShimmerWidget(width: size.width * .2, height: size.height * .02)
              ],
            ),
          );
        },
      ),
    );
  }
}
