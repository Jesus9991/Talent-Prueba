import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';
import 'package:talent_pitch/controllers/exports/exports.dart';
import 'package:talent_pitch/controllers/exports/exports_screen.dart';

/*
COMPONENTES: componentes para el home, listas
*/

/*
nuevos talentos
*/

class NewTalentComponents extends StatelessWidget {
  const NewTalentComponents({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<NewTalentsProvider>(
      builder: (context, newTalent, child) {
        if (newTalent.isLoading) {
          return const SliverToBoxAdapter(
            child: ListMostPortafolio(),
          );
        }
        if (newTalent.errorMessage != null) {
          return SliverToBoxAdapter(
            child: Center(),
          );
        }
        if (newTalent.talentModel.data.isEmpty) {
          return const SliverToBoxAdapter(
            child: Center(),
          );
        }
        return SliverList.separated(
          itemCount: newTalent.talentModel.data.length,
          separatorBuilder: (context, index) =>
              SizedBox(height: size.height * .02),
          itemBuilder: (context, index) {
            final data = newTalent.talentModel.data[index];
            return InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PersonDetailsScreen(
                    id: data.id,
                    name: data.name,
                    image: data.avatar,
                    nickName: data.slug,
                    shared: data.sharedCount,
                    review: data.reviewCount,
                    about: data.about,
                    career: data.career,
                    instagram: data.instagram,
                    facebook: data.facebook,
                    languages: data.languages.join(", "),
                    tools: data.tools.join(", "),
                    position: data.position,
                    skills: data.skills.join(", "),
                    knowledge: data.knowledge.join(", "),
                    hobbies: data.hobbies,
                    resumeImage: data.resumeImage,
                    videoUrl: data.videoUrl,
                  ),
                ),
              ),
              child: FadeInComponent(
                child: Container(
                  height: size.height * .27,
                  width: size.width,
                  margin: EdgeInsets.symmetric(horizontal: size.width * .04),
                  padding: EdgeInsets.symmetric(horizontal: size.width * .025),
                  child: Column(
                    spacing: size.height * .01,
                    children: [
                      //banner
                      Stack(
                        children: [
                          Container(
                            height: size.height * .2,
                            width: size.width,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImageComponent
                                      .getImageNetworkImage(
                                          url: data.resumeImage)),
                              borderRadius: BorderRadius.circular(
                                  ButtonsTheme.borderCards),
                            ),
                            child: IconBlurComponents(
                              icon: Iconsax.play_outline,
                            ),
                            // child: ,
                          ),
                          BlurCategorieComponent(
                              categorie: newTalent.talentModel.title),
                        ],
                      ),
                      //informacion
                      UserPhotoNameComponent(
                        image: data.avatar,
                        name: data.name,
                        createdAt: data.createdAt,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

/*talento destacado mas visto*/
class TalentMostViewComponent extends StatelessWidget {
  const TalentMostViewComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<MostViewedPortfoliosProvider>(
      builder: (context, porta, child) {
        if (porta.isLoading) {
          return const SliverToBoxAdapter(
            child: ListMostPortafolio(),
          );
        }
        if (porta.errorMessage != null) {
          return SliverToBoxAdapter(
            child: Center(),
          );
        }
        if (porta.talentModel.data.isEmpty) {
          return const SliverToBoxAdapter(
            child: Center(),
          );
        }
        return SliverList.separated(
          itemCount: porta.talentModel.data.length,
          separatorBuilder: (context, index) =>
              SizedBox(height: size.height * .02),
          itemBuilder: (context, index) {
            final data = porta.talentModel.data[index];
            return InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PersonDetailsScreen(
                    id: data.id,
                    name: data.name,
                    image: data.avatar,
                    nickName: data.slug,
                    shared: data.sharedCount,
                    review: data.reviewCount,
                    about: data.about,
                    career: data.career,
                    instagram: data.instagram,
                    facebook: data.facebook,
                    languages: data.languages.join(", "),
                    tools: data.tools.join(", "),
                    position: data.position,
                    skills: data.skills.join(", "),
                    knowledge: data.knowledge.join(", "),
                    hobbies: data.hobbies,
                    resumeImage: data.resumeImage,
                    videoUrl: data.videoUrl,
                  ),
                ),
              ),
              child: FadeInComponent(
                child: Container(
                  height: size.height * .27,
                  width: size.width,
                  margin: EdgeInsets.symmetric(horizontal: size.width * .04),
                  padding: EdgeInsets.symmetric(horizontal: size.width * .025),
                  child: Column(
                    spacing: size.height * .01,
                    children: [
                      //banner
                      Stack(
                        children: [
                          Container(
                            height: size.height * .2,
                            width: size.width,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImageComponent
                                      .getImageNetworkImage(
                                          url: data.resumeImage)),
                              borderRadius: BorderRadius.circular(
                                  ButtonsTheme.borderCards),
                            ),
                            child: IconBlurComponents(
                              icon: Iconsax.play_outline,
                            ),
                            // child: ,
                          ),
                          BlurCategorieComponent(
                              categorie: porta.talentModel.title),
                        ],
                      ),
                      //informacion
                      UserPhotoNameComponent(
                        image: data.avatar,
                        name: data.name,
                        createdAt: data.createdAt,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

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

            return FadeInComponent(
              child: Container(
                height: size.height * .52,
                width: size.width,
                // color: PaletteTheme.categoryColors,
                margin: EdgeInsets.symmetric(horizontal: size.width * .04),
                padding: EdgeInsets.symmetric(horizontal: size.width * .025),
                child: Column(
                  spacing: size.height * .007,
                  children: [
                    /*informacion del usario*/
                    UserPhotoNameComponent(
                        image: data.avatar,
                        name: data.name,
                        createdAt: data.createdAt),
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
                        child: Stack(
                          children: [
                            SizedBox(
                              height: size.height,
                              width: size.width,
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
                            //categoria
                            BlurCategorieComponent(
                                categorie: view.talentModel.title)
                          ],
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
                          children: data.hobbies.take(4).map((hobby) {
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
                              child: GradientText(text: '#$hobby', maxLines: 1),
                            );
                          }).toList(),
                        ),
                      ),
                  ],
                ),
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
                        return FadeInComponent(
                          child: SizedBox(
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
          return const SliverToBoxAdapter(
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
                  itemCount: category.categories.data.length +
                      1, // +1 para "Ver todas"
                  padding: EdgeInsets.only(left: size.width * .04),
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  separatorBuilder: (context, index) =>
                      SizedBox(width: size.width * .03),
                  itemBuilder: (context, index) {
                    final isAllCategories = index == 0;

                    return InkWell(
                      onTap: () async {
                        if (isAllCategories) {
                          category.setisTapCategory(false);
                          category.setSelectCategory(-1, '');
                        } else {
                          final data = category.categories.data[index - 1];
                          category.setisTapCategory(true);
                          category.setSelectCategory(index, data.key);
                        }

                        await VibrationEffectService().vibrationEffect();
                      },
                      child: IntrinsicWidth(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.04, vertical: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                ButtonsTheme.borderRadius),
                            gradient: LinearGradient(
                              colors: isAllCategories &&
                                      category.selectCategory == -1
                                  ? [
                                      PaletteTheme.blueViolet,
                                      PaletteTheme.redColor,
                                    ]
                                  : [
                                      PaletteTheme.categoryColors,
                                      PaletteTheme.categoryColors,
                                    ],
                            ),
                            image: !isAllCategories &&
                                    category.isTapCategory &&
                                    category.selectCategory == index
                                ? DecorationImage(
                                    fit: BoxFit.cover,
                                    onError: (exception, stackTrace) =>
                                        AssetImage(ImagesPath.bannerBlack),
                                    image: NetworkImage(category
                                        .categories.data[index - 1].image),
                                  )
                                : null,
                          ),
                          child: Center(
                            child: Text(
                              isAllCategories
                                  ? "Ver todas"
                                  : category.categories.data[index - 1].title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(
                                    fontWeight: (isAllCategories &&
                                                category.selectCategory ==
                                                    -1) ||
                                            (!isAllCategories &&
                                                category.selectCategory ==
                                                    index)
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

class UserPhotoNameComponent extends StatelessWidget {
  final String image;
  final String name;
  final String createdAt;
  const UserPhotoNameComponent({
    super.key,
    required this.image,
    required this.name,
    required this.createdAt,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return /*informacion del usario*/
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
              NetworkImageComponent.getImageNetworkImage(url: image),
        ),
        /*nombre del usuario*/
        SizedBox(
          width: size.width * .4,
          child: Text(
            name,
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
            createdAt,
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
    );
  }
}

class BlurCategorieComponent extends StatelessWidget {
  final String categorie;
  final double? padding;
  const BlurCategorieComponent({
    super.key,
    required this.categorie,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: padding ?? size.height * 0.01,
        horizontal: padding ?? size.width * 0.02,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(size.width * 0.06),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
          child: IntrinsicWidth(
            child: Container(
              height: size.height * 0.03,
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.02), // Espaciado dinámico
              decoration: BoxDecoration(
                color: PaletteTheme.principal.withAlpha((0.07 * 255).toInt()),
                borderRadius: BorderRadius.circular(size.width * 0.06),
              ),
              child: Center(
                child: Text(
                  categorie,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
