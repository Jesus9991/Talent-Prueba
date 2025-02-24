import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:talent_pitch/controllers/exports/exports.dart';
import 'package:talent_pitch/controllers/routes/main_routes.dart';

void main() {
  runApp(const MyProviderAPP());
}

class MyProviderAPP extends StatelessWidget {
  const MyProviderAPP({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        /*provider para cargar las categorias*/
        ChangeNotifierProvider(create: (context) => CategoriesListProvider()),
        ChangeNotifierProvider(create: (context) => AddReactionProvider()),
        ChangeNotifierProvider(create: (context) => PlaylistUserProvider()),
        /*provider para los datos del home*/
        ChangeNotifierProvider(create: (context) => HomeDataProvider()),
        ChangeNotifierProvider(create: (context) => HightPersonsHomeProvider()),
        ChangeNotifierProvider(
            create: (context) => MostViewedPortfoliosProvider()),
        ChangeNotifierProvider(
            create: (context) => ListMostViewTalentProvider()),
        ChangeNotifierProvider(create: (context) => NewTalentsProvider()),
        ChangeNotifierProvider(create: (context) => DiscoverVideosProvider()),
        ChangeNotifierProvider(create: (context) => SavePlaylistProvider()),

        /*reproduccion del video*/
        ChangeNotifierProvider(
            create: (context) => VideoReproductionProvider()),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Talent app',
      theme: MainTheme.darkTheme,
      // darkTheme: MainTheme.darkTheme,
      routes: MainRoutes.routes,
      initialRoute: MainRoutes.navBarRoute,
    );
  }
}
