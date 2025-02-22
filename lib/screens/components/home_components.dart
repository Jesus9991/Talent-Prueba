import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talent_pitch/controllers/exports/exports.dart';

/*
COMPONENTES: componentes para el home, listas
*/
class ListCategoriesHomeComponent extends StatelessWidget {
  const ListCategoriesHomeComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<CategoriesListProvider>(
      builder: (context, category, child) {
        return SliverToBoxAdapter(
          child: Container(
            height: size.height * .05,
            width: size.width,
            margin: EdgeInsets.only(top: size.height * .01),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return ListView.separated(
                  itemCount: category.categories.length,
                  padding: EdgeInsets.only(left: size.width * .04),
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  separatorBuilder: (context, index) =>
                      SizedBox(width: size.width * .03),
                  itemBuilder: (context, index) {
                    final data = category.categories[index];
                    return InkWell(
                      onTap: () async {
                        /*selecciona la categoria */
                        category.setSelectCategory(index);
                        /*efecto de vibracion */
                        await VibrationEffectService().vibrationEffect();

                        //Todo: debe hacer la peticion o filtro para mostrar por categoria
                      },
                      child: IntrinsicWidth(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.04, vertical: 8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  ButtonsTheme.borderRadius),
                              gradient: LinearGradient(
                                colors: category.selectCategory == index
                                    ? [
                                        PaletteTheme.blueViolet,
                                        PaletteTheme.redColor,
                                      ]
                                    : [
                                        PaletteTheme.categoryColors,
                                        PaletteTheme.categoryColors,
                                      ],
                              )),
                          child: Center(
                            child: Text(
                              data.category,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(
                                      fontWeight:
                                          category.selectCategory == index
                                              ? FontWeight.bold
                                              : FontWeight.w300),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}
