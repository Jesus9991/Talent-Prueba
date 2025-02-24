import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';
import 'package:talent_pitch/controllers/exports/exports.dart';
import 'package:talent_pitch/controllers/exports/exports_screen.dart';

class VideosFromPlaylistScreen extends StatefulWidget {
  final SavePlaylistProvider provider;
  final int id;
  const VideosFromPlaylistScreen({
    super.key,
    required this.provider,
    required this.id,
  });

  @override
  State<VideosFromPlaylistScreen> createState() =>
      _VideosFromPlaylistScreenState();
}

class _VideosFromPlaylistScreenState extends State<VideosFromPlaylistScreen> {
  List<PortfolioForVideosModels> playlist = [];
  @override
  void initState() {
    super.initState();
    changeValues();
  }

  bool isLoading = true;

  changeValues() async {
    playlist = await widget.provider.getVideosFromPlaylist(widget.id);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text(''),
        ),
        body: Consumer<SavePlaylistProvider>(
          builder: (context, value, child) {
            return ListView.separated(
              itemCount: playlist.length,
              separatorBuilder: (context, index) =>
                  SizedBox(height: size.height * .02),
              itemBuilder: (context, index) {
                final data = playlist[index];
                return Container(
                  height: size.height * .27,
                  width: size.width,
                  margin: EdgeInsets.symmetric(horizontal: size.width * .04),
                  padding: EdgeInsets.symmetric(horizontal: size.width * .025),
                  child: FadeInComponent(
                    child: Column(
                      spacing: size.height * .01,
                      children: [
                        //banner
                        InkWell(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PersonDetailsScreen(
                                id: data.id,
                                name: data.name,
                                image: data.avatar,
                                nickName: data.slug,
                                shared: 0,
                                review: 0,
                                about: '',
                                career: '',
                                instagram: '',
                                facebook: '',
                                languages: '',
                                tools: '',
                                position: '',
                                skills: '',
                                knowledge: '',
                                hobbies: [],
                                resumeImage: '',
                                videoUrl: data.videoUrl,
                              ),
                            ),
                          ),
                          child: Stack(
                            children: [
                              Container(
                                height: size.height * .2,
                                width: size.width,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImageComponent
                                          .getImageNetworkImage(
                                              url: data.avatar)),
                                  borderRadius: BorderRadius.circular(
                                      ButtonsTheme.borderCards),
                                ),
                                child: IconBlurComponents(
                                  icon: Iconsax.play_outline,
                                ),
                                // child: ,
                              ),
                            ],
                          ),
                        ),
                        //informacion
                        UserPhotoNameComponent(
                          image: data.avatar,
                          name: data.name,
                          createdAt: '',
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ));
  }
}

//SavePlaylistProvider
