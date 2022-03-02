class ReligionInfo {
  final String title;
  final String description;
  ReligionInfo({required this.title, required this.description});
}

class Song {
  final String title;
  final String image;
  final String url;
  final String description;
  Song(
      {required this.title,
      required this.image,
      required this.url,
      required this.description});
}

class Religion {
  final String name;
  final List<ReligionInfo> info;
  final List<Song> songs;
  Religion({required this.name, required this.songs, required this.info});
}

class ReligionDb {
  static List<Religion> religions = [
    Religion(name: 'Hinduism', info: [
      ReligionInfo(
          title: 'Hinduism',
          description:
              """Hinduism is an Indian religion and dharma, or way of life. It is the world's third-largest religion, with over 1.2 billion followers, or 15-16% of the global population, known as Hindus."""),
      ReligionInfo(
          title: 'Origin',
          description:
              """The history of Hinduism covers a wide variety of related religious traditions native to the Indian subcontinent. Its history overlaps or coincides with the development of religion in the Indian subcontinent since the Iron Age, with some of its traditions tracing back to prehistoric religions such as those of the Bronze Age Indus Valley Civilization. It has thus been called the "oldest religion" in the world.""")
    ], songs: [
      Song(
          title: 'Maha Lakshmi Maa Bhajan',
          image:
              'https://www.bhaktiphotos.com/wp-content/uploads/2018/04/Maharani-Goddess-Lakshmi-Mata-Download-Photo.jpg',
          url:
              'https://drive.google.com/uc?export=mp3&id=1FjPso39N3myJ3EUMUDZsKxNGWAGt7KUX',
          description:
              "Lakshmi, also known as Shri is one of the principal goddesses in Hinduism. She is the goddess of wealth, fortune, power, beauty and prosperity, Lakshmi is depicted in Indian art as an elegantly dressed, prosperity-showering golden-coloured woman standing, while holding a lotus in her hand, symbolizing fortune, self-knowledge, and spiritual liberation. The holy song is a praise for Maha Laxmi usally sung around the time of Diwali"),
      Song(
          title: 'Saraswati Maa Bhajan',
          image:
              'https://i.pinimg.com/736x/43/fd/45/43fd45356c6503e996b4df5ae4b5a495.jpg',
          url:
              'https://drive.google.com/uc?export=mp3&id=1FjPso39N3myJ3EUMUDZsKxNGWAGt7KUX',
          description:
              "Lakshmi, also known as Shri is one of the principal goddesses in Hinduism. She is the goddess of wealth, fortune, power, beauty and prosperity, Lakshmi is depicted in Indian art as an elegantly dressed, prosperity-showering golden-coloured woman standing, while holding a lotus in her hand, symbolizing fortune, self-knowledge, and spiritual liberation. The holy song is a praise for Maha Laxmi usally sung around the time of Diwali"),
    ]),
    Religion(name: 'Islam', songs: [
      Song(
          title: 'y',
          image:
              'https://i1.sndcdn.com/artworks-hRsOQyJbIXRo2c9R-V3JH1Q-t500x500.jpg',
          url: 'y',
          description:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quam velit, vulputate eu pharetra'),
    ], info: [
      ReligionInfo(
          title: 'Islam',
          description:
              """Islam is an Abrahamic monotheistic religion teaching that Muhammad is a messenger of God. It is the world's second-largest religion with 1.9 billion followers or 24.9% of the world's population, known as Muslims. Islam teaches that God is merciful, all-powerful, and unique, and has guided humanity through prophets, revealed scriptures, and natural signs. The primary scriptures of Islam are the Quran, believed to be the verbatim word of God, as well as the teachings and practices """),
      ReligionInfo(
          title: 'Origin',
          description:
              """The history of Islam concerns the political, social, economic, and cultural developments of Islamic civilization. Most historians believe that Islam originated in Mecca and Medina at the start of the 7th century CE. Muslims regard Islam as a return to the original faith of the Abrahamic prophets, such as Adam, Noah, Abraham, Moses, David, Solomon, and Jesus, with the submission to the will of God."""),
    ]),
    Religion(name: 'Christianity', songs: [
      Song(
          title: 'z',
          image:
              'https://i1.sndcdn.com/artworks-hRsOQyJbIXRo2c9R-V3JH1Q-t500x500.jpg',
          url: 'z',
          description:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla quam velit, vulputate eu pharetra'),
    ], info: [
      ReligionInfo(
          title: 'Christianity',
          description:
              """Christianity is an Abrahamic monotheistic religion based on the life and teachings of Jesus of Nazareth. It is the world's largest religion, with about 2.5 billion followers. Its adherents, known as Christians, make up a majority of the population in 157 countries and territories, and believe that Jesus is the Son of God, whose coming as the messiah was prophesied in the Hebrew Bible (called the Old Testament in Christianity) and chronicled in the New Testament."""),
      ReligionInfo(
          title: 'Origin',
          description:
              """The history of Christianity concerns the Christian religion, Christian countries, and the Christians with their various denominations, from the 1st century to the present. Christianity originated with the ministry of Jesus, a Jewish teacher and healer who proclaimed the imminent kingdom of God and was crucified circa AD 30-33 in Jerusalem in the Roman province of Judea. His followers believe that, according to the Gospels, he was the Son of God and that he died for the forgiveness of sins and was raised from the dead and exalted by God, and will return soon at the inception of God's kingdom."""),
    ]),
    Religion(name: 'Judaism', songs: [
      Song(
          title: 'a',
          image:
              'https://i1.sndcdn.com/artworks-hRsOQyJbIXRo2c9R-V3JH1Q-t500x500.jpg',
          url: 'a',
          description: 'x'),
    ], info: [
      ReligionInfo(
          title: 'Judaism',
          description:
              """Judaism is an Abrahamic, monotheistic, and ethnic religion comprising the collective religious, cultural, and legal tradition and civilization of the Jewish people. It has its roots as an organized religion in the Middle East during the Bronze Age. Modern Judaism evolved from Yahwism, the religion of ancient Israel and Judah, by around 500 BCE, and is thus considered to be one of the oldest monotheistic religions. Judaism is considered by religious Jews to be the expression of the covenant that God established with the Israelites, their ancestors. It encompasses a wide body of texts, practices, theological positions, and forms of organization."""),
      ReligionInfo(
          title: 'Origin',
          description:
              """The origins of Judaism according to the traditions of the Jews and the teachings of Judaism are described and explained in the Torah that regards Abraham the Hebrew as the first "Jew", and hence of Judaism as a monotheistic religion, and then through his descendants, namely Jacob and the Children of Israel, as the originators of the Jewish people following the Exodus and of their religion as given in the Torah, traditionally based on the 613 commandments, that the Hebrews/Israelites/Jews were commanded by God to believe in, observe and practice as instructed in the Torah."""),
    ])
  ];

  static Religion getOne(int id) {
    return religions[id];
  }
}
