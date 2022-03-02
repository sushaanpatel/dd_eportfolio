// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:dd_eportfolio/main.dart';
import 'package:dd_eportfolio/screens/culture_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themep = Provider.of<ThemeP>(context);
    return Scaffold(
        appBar: AppBar(
          systemOverlayStyle: themep.isDarkMode
              ? SystemUiOverlayStyle.light
              : SystemUiOverlayStyle.dark,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                themep.isDarkMode
                    ? 'assets/icons/logo_dark.png'
                    : 'assets/icons/logo_white.png',
                width: MediaQuery.of(context).size.width * 0.26,
              ),
              ModeSwitch()
            ],
          ),
          iconTheme: IconThemeData(
              color: Theme.of(context).textTheme.bodyText1!.color, size: 20),
          centerTitle: true,
          shadowColor: Colors.transparent,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        body: HomeWidget());
  }
}

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        HomeCard("Hinduism", "assets/icons/hinduism.jpg", 0),
        HomeCard("Islam", "assets/icons/islam.png", 1),
        HomeCard("Judaism", "assets/icons/judaism.jpg", 3),
        HomeCard("Christianity", "assets/icons/christianity.jpg", 2),
        const SizedBox(height: 10),
      ],
    );
  }
}

class HomeCard extends StatelessWidget {
  final String _text;
  final String _image;
  final int id;
  HomeCard(this._text, this._image, this.id);
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GestureDetector(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => CulturePage(id: id))),
            child: Padding(
                padding: const EdgeInsets.fromLTRB(5, 1, 5, 4),
                child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 6,
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: AssetImage(_image), fit: BoxFit.cover)),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                              child: Text(_text,
                                  style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ))),
                        ))))));
  }
}

class ModeSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themep = Provider.of<ThemeP>(context);
    return GestureDetector(
        child: Image.asset(
          themep.isDarkMode ? 'assets/icons/sun.png' : 'assets/icons/moon.png',
          width: themep.isDarkMode ? 40 : 30,
          height: themep.isDarkMode ? 40 : 30,
        ),
        onTap: () {
          Provider.of<ThemeP>(context, listen: false)
              .toggleTheme(!themep.isDarkMode);
        });
  }
}
