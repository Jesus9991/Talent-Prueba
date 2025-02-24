import 'package:flutter/material.dart';
import 'package:talent_pitch/controllers/exports/exports.dart';

/*
COMPONENTE: para las listas vacias
*/
class EmptyStateComponents extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? image;
  const EmptyStateComponents({
    super.key,
    required this.title,
    required this.subtitle,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return FadeInComponent(
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: size.height * 0.1, horizontal: size.width * .03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: size.height * .01,
            children: [
              SizedBox(
                  height: size.height * .07,
                  child: Image.asset(ImagesPath.emptyState)),
              GradientText(
                text: title,
                maxLines: 2,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                subtitle,
                maxLines: 3,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
