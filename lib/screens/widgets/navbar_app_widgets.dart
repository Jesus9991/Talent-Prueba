import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:talent_pitch/controllers/exports/exports.dart';
import 'package:talent_pitch/screens/views/home/discover_videos_screen.dart';
import 'package:talent_pitch/screens/views/home/home_screen.dart';
import 'package:talent_pitch/screens/views/home/profile_user_screen.dart';

/*
nav bar de navegación para el home de la app
*/
class NavBarAppWidgets extends StatefulWidget {
  const NavBarAppWidgets({super.key});

  @override
  State<NavBarAppWidgets> createState() => _NavBarAppWidgetsState();
}

class _NavBarAppWidgetsState extends State<NavBarAppWidgets> {
  int indexSelectScreen = 0;

  List<Widget> screenApp = [
    const HomeScreen(),
    const DiscoverVideosScreen(),
    const ProfileUserScreen(),
  ];

  void onTapped(int index) {
    setState(() {
      indexSelectScreen = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: BottomNavigationBar(
            elevation: 0,
            currentIndex: indexSelectScreen,
            backgroundColor:
                PaletteTheme.secondary.withAlpha((0.6 * 255).toInt()),
            // Theme.of(context).primaryColor.withAlpha((0.6 * 255).toInt()),
            // selectedItemColor: PaletteTheme.deepFucsia,
            unselectedItemColor: PaletteTheme.grey,
            iconSize: 25,
            selectedFontSize: 0,
            unselectedFontSize: 0,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            enableFeedback: false,
            type: BottomNavigationBarType.fixed,
            onTap: (value) async {
              onTapped(value);
              await VibrationEffectService().vibrationEffect();
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Iconsax.home_2_outline, size: 25),
                activeIcon: GradientIcon(icon: Iconsax.home_2_bold),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Iconsax.discover_outline, size: 25),
                activeIcon: GradientIcon(icon: Iconsax.discover_1_bold),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Iconsax.profile_2user_outline, size: 25),
                activeIcon: GradientIcon(icon: Iconsax.profile_2user_bold),
                label: '',
              ),
            ],
          ),
        ),
      ),
      body: screenApp[indexSelectScreen],
    );
  }
}
