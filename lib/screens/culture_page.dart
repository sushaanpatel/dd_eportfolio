import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dd_eportfolio/models/model.dart';
import 'package:dd_eportfolio/models/player.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

List<List<Color>> scolors = const [
  [Color(0xffffe600), Color(0xffff7c22)],
  [Color(0xff46a900), Color(0xff307500)],
  [Color(0xffffd700), Color(0xffcdad00)],
  [Color(0xff619edc), Color(0xff2c78c4)],
];

class CulturePage extends StatelessWidget {
  final int id;
  CulturePage({required this.id});
  @override
  Widget build(BuildContext context) {
    var r = ReligionDb.getOne(id);
    return Scaffold(
        appBar: AppBar(
          shadowColor: Colors.transparent,
          iconTheme: IconThemeData(color: scolors[id][1], size: 50),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text(
            r.name,
            style: GoogleFonts.poppins(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).textTheme.bodyText1!.color,
            ),
          ),
        ),
        // bottomNavigationBar: SongWidget(
        //     name: 'Dark Side of the Moon',
        //     image:
        //         'https://i1.sndcdn.com/artworks-hRsOQyJbIXRo2c9R-V3JH1Q-t500x500.jpg',
        //     url:
        //         'https://drive.google.com/uc?export=mp3&id=1dPyyf-mRoeMYMoafKLuXZo0b91dKvgd_',
        //     description: 'hhjhsdjfsjjsfdhjhjhdfhdjffdhjhjhjfdffjhjh',
        //     bar: true),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...r.info.map((e) => InfoWidget(
                    title: e.title,
                    info: e.description,
                  )),
              const SizedBox(height: 20),
              ...r.songs.map((e) => SongWidget(
                    id: id,
                    name: e.title,
                    image: e.image,
                    description: e.description,
                    url: e.url,
                    bar: false,
                  )),
            ],
          ),
        )));
  }
}

class InfoWidget extends StatelessWidget {
  final String title;
  final String info;
  InfoWidget({required this.title, required this.info});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
          child: Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 30,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
          child: Text(
            info,
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}

class SongWidget extends StatelessWidget {
  final int id;
  final String name;
  final String image;
  final String description;
  final String url;
  final bool bar;
  SongWidget(
      {required this.id,
      required this.name,
      required this.image,
      required this.description,
      required this.url,
      required this.bar});
  @override
  Widget build(BuildContext context) {
    double wheight;
    double iheight;
    double fsize;
    double isize;
    if (bar) {
      wheight = 0.08;
      iheight = 0.12;
      fsize = 16;
      isize = 25;
    } else {
      wheight = 0.1;
      iheight = 0.18;
      fsize = 20;
      isize = 35;
    }
    return BottomModalWidget(
        name: name,
        image: image,
        url: url,
        description: description,
        child: Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
                height: MediaQuery.of(context).size.height * wheight,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    gradient: LinearGradient(
                        begin: Alignment.bottomRight, colors: scolors[id])),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: FadeInImage.assetNetwork(
                                placeholder: 'assets/icons/placeholder.gif',
                                image: image,
                                width:
                                    MediaQuery.of(context).size.width * iheight,
                              ))),
                      Text(name,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: GoogleFonts.poppins(
                              fontSize: fsize,
                              fontWeight: FontWeight.w500,
                              color: Colors.white)),
                      Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: BottomModalWidget(
                              description: description,
                              image: image,
                              name: name,
                              url: url,
                              child: IconButton(
                                onPressed: () => {
                                  Player.play(url),
                                },
                                splashRadius: 4.0,
                                splashColor: Colors.white,
                                icon: const Icon(Icons.play_arrow),
                                iconSize: isize,
                                color: Colors.white,
                              )))
                    ]))));
  }
}

class BottomModalWidget extends StatelessWidget {
  final String name;
  final String image;
  final String url;
  final String description;
  final Widget child;
  BottomModalWidget(
      {required this.child,
      required this.name,
      required this.description,
      required this.image,
      required this.url});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: child,
      onTap: () => {
        Player.play(url),
        showBarModalBottomSheet(
            elevation: 4,
            isDismissible: true,
            enableDrag: true,
            bounce: true,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            context: context,
            builder: (context) {
              return SingleChildScrollView(
                  child: Column(children: [
                Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: FadeInImage.assetNetwork(
                          placeholder: 'assets/icons/placeholder.gif',
                          image: image,
                          width: MediaQuery.of(context).size.width * 0.6,
                        ))),
                Text(name,
                    style: GoogleFonts.poppins(
                        fontSize: 30, fontWeight: FontWeight.bold)),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () => Player.resume(),
                        icon: const Icon(Icons.play_circle_outlined),
                        iconSize: 35),
                    IconButton(
                        onPressed: () => Player.pause(),
                        icon: const Icon(Icons.pause_circle_outline),
                        iconSize: 35),
                    IconButton(
                        onPressed: () => Player.stop(),
                        icon: const Icon(Icons.stop_circle_outlined),
                        iconSize: 35),
                  ],
                ),
                const SizedBox(height: 10),
                Padding(
                    padding:
                        const EdgeInsets.only(right: 15, left: 15, bottom: 10),
                    child: Text(description,
                        style: GoogleFonts.poppins(
                            fontSize: 20, fontWeight: FontWeight.w500))),
              ]));
            })
      },
    );
  }
}
