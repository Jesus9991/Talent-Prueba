import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talent_pitch/controllers/exports/exports.dart';

/*
COMPONENTES: componentes para el home, listas
*/

/*talento destacado */
//Todo: conectar con backend(datos reales)
class HightlightTalentComponents extends StatelessWidget {
  const HightlightTalentComponents({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SliverToBoxAdapter(
        child: Container(
      height: size.height * .42,
      width: size.width,
      // color: PaletteTheme.categoryColors,
      margin: EdgeInsets.symmetric(horizontal: size.width * .04),
      padding: EdgeInsets.symmetric(horizontal: size.width * .025),
      child: Column(
        spacing: size.height * .007,
        children: [
          /*informacion del usario*/
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: size.width * .02,
            children: [
              CircleAvatar(
                backgroundColor: PaletteTheme.categoryColors,
                backgroundImage: NetworkImage(
                    'https://t3.ftcdn.net/jpg/11/17/84/58/360_F_1117845893_al1Yuw9YqxcxWsUz5XzhFQ4DOuimQodj.jpg'),
              ),
              /*nombre del usuario*/
              SizedBox(
                width: size.width * .4,
                child: Text(
                  'USER.NAME LAST',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              const Spacer(),
              SizedBox(
                width: size.width * .2,
                child: Text(
                  'hace 2h',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.end,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(color: PaletteTheme.grey),
                ),
              ),
            ],
          ),
          /*descripcion*/
          Text(
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: PaletteTheme.grey, fontWeight: FontWeight.w200),
          ),
          SizedBox(height: size.height * .005),
          /*video reproduccion*/
          Container(
            height: size.height * .25,
            width: size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(ButtonsTheme.borderCards),
                color: PaletteTheme.categoryColors),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(ButtonsTheme.borderCards),
              child: Image.network(
                'https://assets.simpleviewinc.com/simpleview/image/upload/c_fill,h_907,q_75,w_1100/v1/clients/virginiabeachva/144_3_6076_jpeg_21f028b6-1ad7-4378-8808-e76b654d5065.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          /*reaccion del usuario*/
          Row(
            spacing: size.width * .02,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [ReactionNumber(), ReactionAddComponent()],
          ),
        ],
      ),
    ));
  }
}

/*lista de portafolios*/
//Todo: conectar con backend(datos reales)
class ListPortfolioComponent extends StatelessWidget {
  const ListPortfolioComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Consumer<HightPersonsHomeProvider>(
      builder: (context, high, child) {
        if (high.isLoading) {
          return const SliverToBoxAdapter(
            child: ListShimmerHighlight(),
          );
        }

        if (high.errorMessage != null) {
          return SliverToBoxAdapter(
            child: Center(),
          );
        }

        if (high.personHomeModels.data.isEmpty) {
          return const SliverToBoxAdapter(
            child: Center(),
          );
        }

        return SliverToBoxAdapter(
          child: Container(
            height: size.height * .15,
            width: size.width,
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(top: size.height * .03),
            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return ListView.separated(
                  itemCount: high.personHomeModels.data.length,
                  padding: EdgeInsets.only(left: size.width * .04),
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  separatorBuilder: (context, index) =>
                      SizedBox(width: size.width * .00),
                  itemBuilder: (context, index) {
                    final person = high.personHomeModels.data[index];

                    return SizedBox(
                      width: size.width * .2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          /*FOTO DE PERFIL*/
                          PhotoBorderGradientComponent(image: person.avatar),
                          SizedBox(height: size.height * .006),

                          /*NOMBRE DE USUARIO*/
                          Text(
                            person.name.split(" ").first,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(fontSize: 10),
                          ),
                        ],
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

/*lista de categorias */
//Todo: conectar con backend(datos reales)
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
            margin: EdgeInsets.only(top: size.height * .03),
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
