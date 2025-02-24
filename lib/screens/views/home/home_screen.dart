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
    final size = MediaQuery.of(context).size;
    final categorie = Provider.of<CategoriesListProvider>(context);
    final hight = Provider.of<HightPersonsHomeProvider>(context);
    final mostTalent = Provider.of<ListMostViewTalentProvider>(context);
    final mostView = Provider.of<MostViewedPortfoliosProvider>(context);
    final newTalentView = Provider.of<NewTalentsProvider>(context);

    return Consumer<HomeDataProvider>(
      builder: (context, feth, child) {
        return GradientBackground(
          child: FadeInComponent(
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              slivers: [
                /*appBar */
                AppbarHomeComponents(),

                /*categorias */
                ListCategoriesHomeComponent(),

                /*muestra todas las categorias la seleccionadas */
                if (categorie.categorySelected.isEmpty ||
                    categorie.selectCategory == -1) ...[
                  ListPortfolioComponent(),
                  HightlightTalentComponents(),
                  TalentMostViewComponent(),
                  NewTalentComponents(),
                ] else ...[
                  if (categorie.categorySelected == hight.personHomeModels.key)
                    ListPortfolioComponent(),
                  _SpacerComponent(space: size.height * .05),
                  if (categorie.categorySelected == mostTalent.talentModel.key)
                    HightlightTalentComponents(),
                  if (categorie.categorySelected == mostView.talentModel.key)
                    TalentMostViewComponent(),
                  if (categorie.categorySelected ==
                      newTalentView.talentModel.key)
                    NewTalentComponents(),
                ],
                /*muestra un mensaje si despues de filtrar no hay datos */
                if (!(categorie.categorySelected.isEmpty ||
                        categorie.selectCategory == -1) &&
                    categorie.categorySelected != hight.personHomeModels.key &&
                    categorie.categorySelected != mostTalent.talentModel.key &&
                    categorie.categorySelected != mostView.talentModel.key &&
                    categorie.categorySelected != newTalentView.talentModel.key)
                  SliverToBoxAdapter(
                    child: EmptyStateComponents(
                      title: '¡Ups! Aquí no hay nada…',
                      subtitle:
                          'No encontramos contenido en esta categoría. Explora otras opciones',
                    ),
                  ),
                /* Espacio final */
                SliverToBoxAdapter(child: SizedBox(height: size.height * .2)),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _SpacerComponent extends StatelessWidget {
  final double space;
  const _SpacerComponent({
    required this.space,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(child: SizedBox(height: space));
  }
}
