import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talent_pitch/controllers/exports/exports.dart';
import 'package:talent_pitch/controllers/exports/exports_screen.dart';

/*
COMPONENTES: componentes para el home, listas
*/

/*talento destacado */
class HightlightTalentComponents extends StatelessWidget {
  const HightlightTalentComponents({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<ListMostViewTalentProvider>(
      builder: (context, view, child) {
        if (view.isLoading) {
          return const SliverToBoxAdapter(
            child: ListShimmerMostView(),
          );
        }

        if (view.errorMessage != null) {
          return SliverToBoxAdapter(
            child: Center(),
          );
        }

        if (view.talentModel.data.isEmpty) {
          return const SliverToBoxAdapter(
            child: Center(),
          );
        }

        return SliverList.separated(
          itemCount: view.talentModel.data.length,
          separatorBuilder: (context, index) =>
              SizedBox(height: size.height * .04),
          itemBuilder: (context, index) {
            final data = view.talentModel.data[index];

            return Container(
              height: size.height * .52,
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
                        onBackgroundImageError: (exception, stackTrace) =>
                            AssetImage(ImagesPath.tlogoWhite),
                        backgroundImage:
                            NetworkImageComponent.getImageNetworkImage(
                                url: data.avatar),
                      ),
                      /*nombre del usuario*/
                      SizedBox(
                        width: size.width * .4,
                        child: Text(
                          data.name,
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
                          data.createdAt,
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
                  SizedBox(height: size.height * .005),
                  /*video reproduccion*/
                  Container(
                    height: size.height * .25,
                    width: size.width,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(ButtonsTheme.borderCards),
                        color: PaletteTheme.cards),
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(ButtonsTheme.borderCards),
                      child: LazyVideoPlayerComponents(
                        videoUrl: data.videoUrl,
                        image: view.talentModel.image,
                        title: data.resumeName,
                        userName: '@${data.slug}',
                        avatar: data.avatar,
                        review: data.review.toString(),
                        shared: data.shared.toString(),
                        facebook: data.facebook,
                        instagram: data.instagram,
                        dreams: data.dreamBrands.join(", "),
                        rolesDream: data.dreamRoles.join(", "),
                        dreamTeam: data.dreamTeam.join(", "),
                        knowledge: data.knowledge.join(", "),
                        languages: data.languages.join(", "),
                        skills: data.skills.join(", "),
                        tools: data.tools.join(", "),
                        hobbies: data.hobbies,
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
                  SizedBox(height: size.height * .005),
                  /*hastag*/
                  if (data.hobbies.isNotEmpty)
                    Align(
                      alignment: Alignment.topLeft,
                      child: Wrap(
                        alignment: WrapAlignment.start,
                        spacing: size.width * .03,
                        runSpacing: size.height * .005,
                        children: data.hobbies.map((hobby) {
                          return Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * .03,
                                vertical: size.height * .005),
                            decoration: BoxDecoration(
                              color: PaletteTheme.categoryColors
                                  .withAlpha((0.2 * 255).toInt()),
                              borderRadius: BorderRadius.circular(
                                  ButtonsTheme.borderRadius),
                            ),
                            child: GradientText(text: '#$hobby'),
                          );
                        }).toList(),
                      ),
                    ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

/*lista de portafolios*/
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

                    return Consumer<VideoReproductionProvider>(
                      builder: (context, video, child) {
                        return SizedBox(
                          width: size.width * .2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              /*FOTO DE PERFIL*/
                              InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            PersonDetailsScreen(
                                          id: person.id,
                                          name: person.name,
                                          image: person.avatar,
                                          nickName: person.slug,
                                          review: person.review,
                                          shared: person.shared,
                                          facebook: person.facebook,
                                          instagram: person.instagram,
                                          about: person.about,
                                          career: person.career,
                                          languages:
                                              person.languages.join(", "),
                                          position: person.position,
                                          skills: person.skills.join(", "),
                                          tools: person.tools.join(", "),
                                          knowledge:
                                              person.knowledge.join(", "),
                                          hobbies: person.hobbies,
                                          resumeImage: person.resumeimage,
                                          videoUrl: person.videoUrl,
                                        ),
                                      ),
                                    );
                                  },
                                  child: PhotoBorderGradientComponent(
                                      image: person.avatar)),
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
        if (category.isLoading) {
          return const SliverToBoxAdapter(
            child: ListShimmerCategories(),
          );
        }

        if (category.errorMessage != null) {
          return SliverToBoxAdapter(
            child: Center(),
          );
        }

        if (category.categories.data.isEmpty) {
          return const SliverToBoxAdapter(
            child: Center(),
          );
        }

        return SliverToBoxAdapter(
          child: Container(
            height: size.height * .05,
            width: size.width,
            margin: EdgeInsets.only(top: size.height * .03),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return ListView.separated(
                  itemCount: category.categories.data.length,
                  padding: EdgeInsets.only(left: size.width * .04),
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  separatorBuilder: (context, index) =>
                      SizedBox(width: size.width * .03),
                  itemBuilder: (context, index) {
                    final data = category.categories.data[index];
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
                            image: category.selectCategory == index
                                ? DecorationImage(
                                    fit: BoxFit.cover,
                                    onError: (exception, stackTrace) =>
                                        AssetImage(ImagesPath.bannerBlack),
                                    image: NetworkImage(data.image))
                                : null,
                            borderRadius: BorderRadius.circular(
                                ButtonsTheme.borderRadius),
                            color: PaletteTheme.categoryColors,
                            // gradient: LinearGradient(
                            //   colors: category.selectCategory != index
                            //       ? [
                            //           PaletteTheme.blueViolet,
                            //           PaletteTheme.redColor,
                            //         ]
                            //       : [
                            //           PaletteTheme.categoryColors,
                            //           PaletteTheme.categoryColors,
                            //         ],
                            // ),
                          ),
                          child: Center(
                            child: Text(
                              data.title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(
                                    fontWeight: category.selectCategory == index
                                        ? FontWeight.bold
                                        : FontWeight.w100,
                                  ),
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
