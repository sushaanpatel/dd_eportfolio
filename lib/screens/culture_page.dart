// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dd_eportfolio/models/model.dart';
import 'package:dd_eportfolio/models/player.dart';
import 'package:dd_eportfolio/main.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _showNotification(song) async {
  AndroidNotificationDetails androidPlatformChannelSpecifics =
      const AndroidNotificationDetails(
    '0',
    'Music Player Notification',
    channelDescription: 'Notification for Music Player',
    importance: Importance.max,
    priority: Priority.high,
    icon: '@mipmap/music',
    styleInformation:
        MediaStyleInformation(htmlFormatContent: true, htmlFormatTitle: true),
    ticker: 'ticker',
  );
  NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);
  await flutterLocalNotificationsPlugin.show(
      0,
      '<b>Hymn is playing audio</b>',
      """
      <b>$song is playing</b>
      """,
      platformChannelSpecifics,
      payload: 'item x');
}

List<List<Color>> scolors = const [
  [Color(0xffffe600), Color(0xffff7c22)],
  [Color(0xff5bdd00), Color(0xff307500)],
  [Color(0xffffef99), Color(0xffcdad00)],
  [Color(0xff619edc), Color(0xff1e5286)],
];

class CulturePage extends StatelessWidget {
  final int id;
  CulturePage({required this.id});
  @override
  Widget build(BuildContext context) {
    var r = ReligionDb.getOne(id);
    final themep = Provider.of<ThemeP>(context);
    return Scaffold(
        appBar: AppBar(
          systemOverlayStyle: themep.isDarkMode
              ? SystemUiOverlayStyle.light
              : SystemUiOverlayStyle.dark,
          shadowColor: Colors.transparent,
          iconTheme: IconThemeData(color: scolors[id][1], size: 30),
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
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...r.info.map((e) => InfoWidget(
                    title: e.title,
                    info: e.description,
                    id: id,
                  )),
              const SizedBox(height: 20),
              ...r.songs.map((e) => SongWidget(
                    id: id,
                    name: e.title,
                    image: e.image,
                    description: e.description,
                    url: e.url,
                  )),
              const SizedBox(height: 20),
            ],
          ),
        ));
  }
}

class InfoWidget extends StatelessWidget {
  final String title;
  final String info;
  final int id;
  InfoWidget({required this.title, required this.info, required this.id});
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: Divider(
            thickness: 1,
            color: scolors[id][0],
          ),
        ),
        Padding(
            padding: const EdgeInsets.fromLTRB(30, 4, 30, 10),
            child: Text(info,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                )))
      ]),
    );
  }
}

class SongWidget extends StatelessWidget {
  final int id;
  final String name;
  final String image;
  final String description;
  final String url;
  SongWidget(
      {required this.id,
      required this.name,
      required this.image,
      required this.description,
      required this.url});
  @override
  Widget build(BuildContext context) {
    return BottomModalWidget(
        name: name,
        image: image,
        url: url,
        description: description,
        child: Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
                height: MediaQuery.of(context).size.height * 0.1,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.center,
                        colors: scolors[id])),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Padding(
                      padding: const EdgeInsets.only(left: 8, right: 6),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: FadeInImage.assetNetwork(
                            placeholder: 'assets/icons/placeholder_sq.gif',
                            image: image,
                            width: MediaQuery.of(context).size.width * 0.17,
                          ))),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.47,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(name,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.white)),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () => {
                            Player.play(url),
                            _showNotification(name),
                            print("played: ${Player.mstate}")
                          },
                          splashRadius: 4.0,
                          splashColor: Colors.white,
                          icon: const Icon(Icons.play_arrow),
                          iconSize: 35,
                          color: Colors.white,
                        ),
                        Padding(
                            padding: const EdgeInsets.only(right: 0),
                            child: IconButton(
                              onPressed: () => {
                                Player.pause(),
                                flutterLocalNotificationsPlugin.cancel(0)
                              },
                              splashRadius: 4.0,
                              splashColor: Colors.white,
                              icon: const Icon(Icons.pause_rounded),
                              iconSize: 35,
                              color: Colors.white,
                            )),
                      ],
                    ),
                  )
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
                          width: MediaQuery.of(context).size.width * 0.7,
                        ))),
                Text(name,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontSize: 25, fontWeight: FontWeight.bold)),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () => {
                              Player.resume(),
                              _showNotification(name),
                              print("resumed ${Player.mstate}")
                            },
                        icon: const Icon(Icons.play_arrow_rounded),
                        iconSize: 35),
                    IconButton(
                        onPressed: () => {
                              Player.pause(),
                              flutterLocalNotificationsPlugin.cancel(0),
                              print("paused ${Player.mstate}")
                            },
                        icon: const Icon(Icons.pause_rounded),
                        iconSize: 35),
                  ],
                ),
                const SizedBox(height: 10),
                Padding(
                    padding:
                        const EdgeInsets.only(right: 15, left: 15, bottom: 10),
                    child: Text(description,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            fontSize: 18, fontWeight: FontWeight.w500))),
                const SizedBox(height: 20)
              ]));
            }),
        _showNotification(name)
      },
    );
  }
}
