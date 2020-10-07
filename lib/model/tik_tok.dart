import 'package:meta/meta.dart';
import 'dart:convert';

class TikTok {
  TikTok({
    @required this.key,
    @required this.videoUrl,
    @required this.likes,
    @required this.comments,
    @required this.song,
    @required this.effect,
    @required this.user,
    @required this.shares,
    @required this.description,
  });

  final String key;
  final String description;
  final String videoUrl;
  final int likes;
  final int comments;
  final int shares;
  final Song song;
  final Effect effect;
  final User user;

  factory TikTok.fromJson(map) {
    return TikTok(
      key: map['key'] as String,
      description: map['description'] as String,
      videoUrl: map['videoUrl'] as String,
      likes: map['downloads'] as int,
      comments: map['comments'] as int,
      song: map['song'] as Song,
      effect: map['effect'] as Effect,
      user: map['user'] as User,
    );
  }

  Map<String, dynamic> toJson() {
    // ignore: unnecessary_cast
    return {
      'key': this.key,
      'description': this.description,
      'videoUrl': this.videoUrl,
      'downloads': this.likes,
      'comments': this.comments,
      'song': this.song,
      'effect': this.effect,
      'user': this.user,
    } as Map<String, dynamic>;
  }
}

class Effect {
  Effect({
    @required this.effectName,
    @required this.effectId,
  });

  final String effectName;
  final String effectId;

  factory Effect.fromJson(Map<String, dynamic> json) => Effect(
        effectName: json["effectName"] == null ? null : json["effectName"],
        effectId: json["effectId"] == null ? null : json["effectId"],
      );

  Map<String, dynamic> toJson() => {
        "effectName": effectName == null ? null : effectName,
        "effectId": effectId == null ? null : effectId,
      };
}

class Song {
  const Song({
    @required this.name,
    @required this.arstist,
    @required this.audioUrl,
    @required this.coverArtUrl,
  });

  final String name;
  final String arstist;
  final String audioUrl;
  final String coverArtUrl;

  factory Song.fromJson(Map<String, dynamic> json) => Song(
        name: json["name"] == null ? null : json["name"],
        arstist: json["arstist"] == null ? null : json["arstist"],
        audioUrl: json["audioUrl"] == null ? null : json["audioUrl"],
        coverArtUrl: json["coverArtUrl"] == null ? null : json["coverArtUrl"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "arstist": arstist == null ? null : arstist,
        "audioUrl": audioUrl == null ? null : audioUrl,
        "coverArtUrl": coverArtUrl == null ? null : coverArtUrl,
      };

  Song copyWith({
    String name,
    String arstist,
    String audioUrl,
    String coverArtUrl,
  }) {
    if ((name == null || identical(name, this.name)) &&
        (arstist == null || identical(arstist, this.arstist)) &&
        (audioUrl == null || identical(audioUrl, this.audioUrl)) &&
        (coverArtUrl == null || identical(coverArtUrl, this.coverArtUrl))) {
      return this;
    }

    return new Song(
      name: name ?? this.name,
      arstist: arstist ?? this.arstist,
      audioUrl: audioUrl ?? this.audioUrl,
      coverArtUrl: coverArtUrl ?? this.coverArtUrl,
    );
  }
}

class User {
  User({
    @required this.handle,
    @required this.imgUrl,
    @required this.userDetailsKey,
  });

  final String handle;
  final String imgUrl;
  final String userDetailsKey;

  factory User.fromJson(Map<String, dynamic> json) => User(
        handle: json["handle"] == null ? null : json["handle"],
        imgUrl: json["imgUrl"] == null ? null : json["imgUrl"],
        userDetailsKey:
            json["userDetailsKey"] == null ? null : json["userDetailsKey"],
      );

  Map<String, dynamic> toJson() => {
        "handle": handle == null ? null : handle,
        "imgUrl": imgUrl == null ? null : imgUrl,
        "userDetailsKey": userDetailsKey == null ? null : userDetailsKey,
      };
}
