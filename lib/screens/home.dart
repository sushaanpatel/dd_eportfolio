import 'package:dd_eportfolio/main.dart';
import 'package:dd_eportfolio/screens/culture_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Home',
                      style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).textTheme.bodyText1!.color)),
                  ModeSwitch()
                ],
              ),
              iconTheme: IconThemeData(
                  color: Theme.of(context).textTheme.bodyText1!.color,
                  size: 30),
              centerTitle: true,
              shadowColor: Colors.transparent,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent),
            ),
            body: HomeWidget()));
  }
}

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            HomeCard("Hinduism", "assets/icons/hinduism.jpg", 0),
            HomeCard("Islam", "assets/icons/islam.jpg", 1),
          ],
        ),
        Row(
          children: [
            HomeCard("Judaism", "assets/icons/judaism.jpg", 3),
            HomeCard("Christianity", "assets/icons/christianity.jpg", 2)
          ],
        )
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
                padding: const EdgeInsets.fromLTRB(5, 1, 0, 1),
                child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 2,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.43,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage(_image), fit: BoxFit.cover)),
                      child: Center(
                          child: Text(_text,
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ))),
                    )))));
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

/*ElevatedButton(
                      onPressed: () => showModalBottomSheet(
                          elevation: 4,
                          isDismissible: true,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          context: context,
                          builder: (context) {
                            return Column(children: [
                              Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Image.asset(
                                    'assets/icons/bar.png',
                                    width: 100,
                                  )),
                              Text(_text,
                                  style: GoogleFonts.poppins(
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold))
                            ]);
                            // return ;
                          }),
                      child: Text(
                        _text,
                        style: GoogleFonts.poppins(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color:
                                Theme.of(context).textTheme.bodyText1!.color),
                      ),
                    ), */
