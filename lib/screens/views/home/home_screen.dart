import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talent_pitch/controllers/exports/exports.dart';

/*
PANTALLA: inicial al abrir la app carga los datos
*/
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return Consumer<HomeDataProvider>(
      builder: (context, feth, child) {
        return GradientBackground(
          child: FadeInComponent(
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              slivers: [
                /*appbar */
                AppbarHomeComponents(),
                /*categorias*/
                ListCategoriesHomeComponent(),
                /*lista de porfafolio*/
                ListPortfolioComponent(),
                /*talento descatado*/
                HightlightTalentComponents(),
                /*talento destacado mas visto*/
                TalentMostViewComponent(),
              ],
            ),
          ),
        );
      },
    );
  }
}
