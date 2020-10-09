import 'package:tik_tok_clone/const/firebase_const.dart';
import 'package:tik_tok_clone/model/tik_tok.dart';
import 'package:tik_tok_clone/util/util.dart';

const int knumberOfMockSongs = 2;
const int kNumberOfUserImg = 2;

extension xTikTok on TikTok {
  TikTok generate() {
    final randomDownloads = randomInt(upTo: 999);
    return TikTok(
        key: firebasePushKey(kTikTokPath),
        videoUrl: 'video${randomInt(upTo: 5)}.mov',
        likes: randomInt(upTo: 999),
        comments: (randomDownloads / 2).floor(),
        shares: (randomDownloads / 4).floor(),
        song: Song().generate(),
        effect: Effect(effectName: "Some Effect"),
        user: User().generate(),
        description: kLoremIpsum,
        hashTags: _getRandomListOfHashTags());
  }
}

extension xSong on Song {
  Song generate() {
    return _mockSongs[randomInt(upTo: _mockSongs.length)].copyWith(
      audioUrl: '${randomInt(upTo: knumberOfMockSongs)}',
      coverArtUrl: '${randomInt(upTo: knumberOfMockSongs)}',
    );
  }
}

extension xUser on User {
  User generate() {
    return User(
      imgUrl: '${_mockProfileUrl.getRandomElement()}',
      userDetailsKey: "2",
      handle: '${_mockUsernames.getRandomElement()}',
    );
  }
}

/// extension below is equvalent to
/// _mockHashTags[randomInt(upTo: _mockHashTags.length];
/// _mockHastags.getRandomElement()
extension _xString on List<String> {
  String getRandomElement() => this[randomInt(upTo: length)];
}

List<String> _getRandomListOfHashTags() {
  return List<String>.generate(
      randomInt(upTo: 5), (index) => _mockHashTags.getRandomElement());
}

const _mockHashTags = [
  '#funny',
  '#androidStudio',
  '#someone',
  '#bestvideo',
  '#chicken',
  '#sadwich',
  '#something',
  '#somethingElse',
  '#fly',
  '#cool',
  '#awesome',
  '#awesome',
  '#place',
  '#item',
  '#flutterisawesome',
  '#iloveflutter',
  '#ayheartflutter',
  '#caballo',
];

const _mockSongs = <Song>[
  const Song(
    name: "I love you flutter",
    arstist: "Jose",
    audioUrl: "0",
    coverArtUrl: "0",
  ),
  const Song(
    name: "I will kill your computer ",
    arstist: "Android Studio",
    audioUrl: "0",
    coverArtUrl: "0",
  ),
  const Song(
    name: "Hacking Nasa",
    arstist: "HTML",
    audioUrl: "0",
    coverArtUrl: "0",
  ),
  const Song(
    name: "Its been a hard days night",
    arstist: "The Beatles",
    audioUrl: "0",
    coverArtUrl: "0",
  ),
];

const _mockUsernames = <String>[
  'joselovesflutter',
  'thebeatlesaregreat',
  'stupidorange',
  'sillyface',
  'user12',
  'somethingsomething3',
  'dexter44',
  'marjish',
  'pawan',
  'reso',
  'emily',
  'adrian'
];

const _mockProfileUrl = <String>[
  'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/Pierre-Person.jpg/220px-Pierre-Person.jpg',
  'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80',
  'https://cdn.now.howstuffworks.com/media-content/0b7f4e9b-f59c-4024-9f06-b3dc12850ab7-1920-1080.jpg',
  'https://www.machinecurve.com/wp-content/uploads/2019/07/thispersondoesnotexist-1.jpg',
  'https://mindbodygreen-res.cloudinary.com/images/w_767,q_auto:eco,f_auto,fl_lossy/usr/RetocQT/sarah-fielding.jpg',
  'https://post.healthline.com/wp-content/uploads/sites/3/2020/01/326738_2200-732x549.jpg',
  'https://www.westernunion.com/content/dam/wu/jm/responsive/send-money-in-person-from-jamaica-resp.png',
  'https://images.glaciermedia.ca/polopoly_fs/1.24141930.1590598826!/fileImage/httpImage/image.jpg_gen/derivatives/landscape_804/ajw10164883-jpg.jpg',
];

const kLoremIpsum =
    'is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting';
