import 'package:flutter/material.dart';

/*
pantalla scroll page para vizualiza videos
*/
class DiscoverVideosScreen extends StatelessWidget {
  const DiscoverVideosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('DiscoverVideosScreen'),
      ),
      body: Center(
        child: Text(''),
      ),
    );
  }
}
