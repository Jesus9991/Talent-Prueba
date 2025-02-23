/*
url de la base de datos
*/
class UrlApiPath {
  /*url del api */
  static String urlHttp = 'https://data2.talentpitch.co/api';
}

class PathApi {
  static String homePath = '/homeservice/categories-static-home';
  /*listas de destacdo en el home */
/*lista de categorias*/
  static String listCategories = '/homeservice/categories-static-home';

  static String hightlightPath =
      '/homeservice/categories/d/talentees/top_pitches/unique/null/';
  /*mas vistos*/
  static String mostViewed =
      '/homeservice/categories/d/talentees/most_viewed_talent/video/null/';
  /*dtalento destacado mas visto */
  static String portafoliMostView =
      '/homeservice/categories/d/talentees/top_pitches_viewed/card_top/null/';
  /*nuevo talento destacado*/
  static String newTalent =
      '/homeservice/categories/d/talentees/most_new_talent/video/null/';
}
