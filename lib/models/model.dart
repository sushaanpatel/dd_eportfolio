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
    Religion(name: 'Hinduism', songs: [
      Song(
          title: 'Dark Side of the Moon',
          image:
              'https://i1.sndcdn.com/artworks-hRsOQyJbIXRo2c9R-V3JH1Q-t500x500.jpg',
          url:
              'https://drive.google.com/uc?export=mp3&id=1dPyyf-mRoeMYMoafKLuXZo0b91dKvgd_',
          description: 'hhjhsdjfsjjsfdhjhjhdfhdjffdhjhjhjfdffjhjh'),
      Song(
          title: 'a',
          image:
              'https://i1.sndcdn.com/artworks-hRsOQyJbIXRo2c9R-V3JH1Q-t500x500.jpg',
          url:
              'https://drive.google.com/uc?export=mp3&id=1dPyyf-mRoeMYMoafKLuXZo0b91dKvgd_',
          description:
              'jjkdjkfsjkfjdksjfskjfkjksjkjskfjdksfjskdjfksdfjskjfkdsfjkdsfjskdfjsdkf')
    ], info: [
      ReligionInfo(title: 'x', description: 'x'),
      ReligionInfo(title: 'y', description: 'y'),
      ReligionInfo(title: 'z', description: 'z')
    ]),
    Religion(name: 'Islam', songs: [
      Song(
          title: 'y',
          image:
              'https://i1.sndcdn.com/artworks-hRsOQyJbIXRo2c9R-V3JH1Q-t500x500.jpg',
          url: 'y',
          description: 'x'),
    ], info: [
      ReligionInfo(title: 'x', description: 'x'),
      ReligionInfo(title: 'y', description: 'y'),
      ReligionInfo(title: 'z', description: 'z')
    ]),
    Religion(name: 'Christianity', songs: [
      Song(
          title: 'z',
          image:
              'https://i1.sndcdn.com/artworks-hRsOQyJbIXRo2c9R-V3JH1Q-t500x500.jpg',
          url: 'z',
          description: 'x'),
    ], info: [
      ReligionInfo(title: 'x', description: 'x'),
      ReligionInfo(title: 'y', description: 'y'),
      ReligionInfo(title: 'z', description: 'z')
    ]),
    Religion(name: 'Judaism', songs: [
      Song(
          title: 'a',
          image:
              'https://i1.sndcdn.com/artworks-hRsOQyJbIXRo2c9R-V3JH1Q-t500x500.jpg',
          url: 'a',
          description: 'x'),
    ], info: [
      ReligionInfo(title: 'x', description: 'x'),
      ReligionInfo(title: 'y', description: 'y'),
      ReligionInfo(title: 'z', description: 'z')
    ])
  ];

  static Religion getOne(int id) {
    return religions[id];
  }
}
