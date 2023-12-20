// ignore_for_file: public_member_api_docs, sort_constructors_first
// To parse this JSON data, do
//
//     final dhwani = dhwaniFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/foundation.dart';

Dhwani dhwaniFromJson(String str) => Dhwani.fromJson(json.decode(str));

String dhwaniToJson(Dhwani data) => json.encode(data.toJson());

class Dhwani {
  List<DhwaniElement> dhwani;

  Dhwani({
    required this.dhwani,
  });

  factory Dhwani.fromJson(Map<String, dynamic> json) => Dhwani(
        dhwani: List<DhwaniElement>.from(
            json["Dhwani"].map((x) => DhwaniElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Dhwani": List<dynamic>.from(dhwani.map((x) => x.toJson())),
      };
}

class DhwaniElement {
  String dhwaniName;
  String description;
  String coverImage;
  String dhwaniImage;
  List<DhwaniClass> dhwanis;

  DhwaniElement({
    required this.dhwaniName,
    required this.description,
    required this.coverImage,
    required this.dhwaniImage,
    required this.dhwanis,
  });

  factory DhwaniElement.fromJson(Map<String, dynamic> json) => DhwaniElement(
        dhwaniName: json["dhwaniName"],
        description: json["description"],
        coverImage: json["coverImage"],
        dhwaniImage: json["dhwaniImage"],
        dhwanis: List<DhwaniClass>.from(
            json["dhwanis"].map((x) => DhwaniClass.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "dhwaniName": dhwaniName,
        "description": description,
        "coverImage": coverImage,
        "dhwaniImage": dhwaniImage,
        "dhwanis": List<dynamic>.from(dhwanis.map((x) => x.toJson())),
      };
}

class DhwaniClass {
  String name;
  String description;
  String sound;
  List<Example> examples;

  DhwaniClass({
    required this.name,
    required this.description,
    required this.sound,
    required this.examples,
  });

  factory DhwaniClass.fromJson(Map<String, dynamic> json) => DhwaniClass(
        name: json["name"],
        description: json["description"],
        sound: json["sound"],
        examples: List<Example>.from(
            json["examples"].map((x) => Example.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "sound": sound,
        "examples": List<dynamic>.from(examples.map((x) => x.toJson())),
      };
}

enum Type { INITIAL, MEDIAL, FINAL }

class Example {
  final String name;
  final String imageId;
  final String soundId;
  final String id;
  //enum
  final Type type;
  Example({
    required this.name,
    required this.imageId,
    required this.soundId,
    required this.id,
    required this.type,
  });

  Example copyWith({
    String? name,
    String? imageId,
    String? soundId,
    String? id,
    Type? type,
  }) {
    return Example(
      name: name ?? this.name,
      imageId: imageId ?? this.imageId,
      soundId: soundId ?? this.soundId,
      id: id ?? this.id,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'imageId': imageId,
      'soundId': soundId,
      'id': id,
      'type': type.index,
    };
  }

  factory Example.fromMap(Map<String, dynamic> map) {
    return Example(
      name: map['name'] as String,
      imageId: map['img_id'] as String,
      soundId: map['sound_id'] as String,
      id: map['\$id'] as String,
      type: Type.values.firstWhere((element) => element.name == map['type']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Example.fromJson(String source) =>
      Example.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Example(name: $name, imageId: $imageId, soundId: $soundId, id: $id, type: $type)';
  }

  @override
  bool operator ==(covariant Example other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.imageId == imageId &&
        other.soundId == soundId &&
        other.id == id &&
        other.type == type;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        imageId.hashCode ^
        soundId.hashCode ^
        id.hashCode ^
        type.hashCode;
  }
}

class Sounds {
  final String id;
  final String name;
  final String coverImage;
  final String imageId;
  final String description;
  final List<String> alphabetIds;
  Sounds(
      {required this.id,
      required this.name,
      required this.coverImage,
      required this.imageId,
      required this.alphabetIds,
      required this.description});

  Sounds copyWith({
    String? id,
    String? name,
    String? coverImage,
    String? imageId,
    String? description,
    List<String>? alphabetIds,
  }) {
    return Sounds(
        id: id ?? this.id,
        name: name ?? this.name,
        coverImage: coverImage ?? this.coverImage,
        imageId: imageId ?? this.imageId,
        alphabetIds: alphabetIds ?? this.alphabetIds,
        description: description ?? this.description);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'coverImage': coverImage,
      'imageId': imageId,
      'alphabetIds': alphabetIds,
    };
  }

  factory Sounds.fromMap(Map<String, dynamic> map) {
    return Sounds(
      id: map['\$id'] as String,
      name: map['sound_type'] as String,
      coverImage: map['cover_imgId'] as String,
      imageId: map['img_id'] as String,
      description: map['description'] as String,
      alphabetIds: List<String>.from((map['alphabet_ids'])),
    );
  }

  String toJson() => json.encode(toMap());

  factory Sounds.fromJson(String source) =>
      Sounds.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Sounds(id: $id, name: $name, coverImage: $coverImage, imageId: $imageId, alphabetIds: $alphabetIds)';
  }

  @override
  bool operator ==(covariant Sounds other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.coverImage == coverImage &&
        other.imageId == imageId &&
        listEquals(other.alphabetIds, alphabetIds);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        coverImage.hashCode ^
        imageId.hashCode ^
        alphabetIds.hashCode;
  }
}

class Alphabets {
  final String id;
  final String name;
  final String desc;
  final String soundId;
  final List<String> exampleIds;
  Alphabets({
    required this.id,
    required this.name,
    required this.desc,
    required this.soundId,
    required this.exampleIds,
  });

  Alphabets copyWith({
    String? id,
    String? name,
    String? desc,
    String? soundId,
    List<String>? exampleIds,
  }) {
    return Alphabets(
      id: id ?? this.id,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      soundId: soundId ?? this.soundId,
      exampleIds: exampleIds ?? this.exampleIds,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'desc': desc,
      'soundId': soundId,
      'exampleIds': exampleIds,
    };
  }

  factory Alphabets.fromMap(Map<String, dynamic> map) {
    return Alphabets(
      id: map['\$id'] as String,
      name: map['name'] as String,
      desc: map['description'] as String,
      soundId: map['sound_id'] as String,
      exampleIds: List<String>.from((map['example_ids'] as List<String>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory Alphabets.fromJson(String source) =>
      Alphabets.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Alphabets(id: $id, name: $name, desc: $desc, soundId: $soundId, exampleIds: $exampleIds)';
  }

  @override
  bool operator ==(covariant Alphabets other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.desc == desc &&
        other.soundId == soundId &&
        listEquals(other.exampleIds, exampleIds);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        desc.hashCode ^
        soundId.hashCode ^
        exampleIds.hashCode;
  }
}
