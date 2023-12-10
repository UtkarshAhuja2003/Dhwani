import 'dart:convert';

Dhwani dhwaniFromJson(String str) => Dhwani.fromJson(json.decode(str));

String dhwaniToJson(Dhwani data) => json.encode(data.toJson());

class Dhwani {
    List<DhwaniElement> dhwani;

    Dhwani({
        required this.dhwani,
    });

    factory Dhwani.fromJson(Map<String, dynamic> json) => Dhwani(
        dhwani: List<DhwaniElement>.from(json["Dhwani"].map((x) => DhwaniElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Dhwani": List<dynamic>.from(dhwani.map((x) => x.toJson())),
    };
}

class DhwaniElement {
    String dhwaniName;
    String description;
    String source;
    List<DhwaniClass> dhwanis;

    DhwaniElement({
        required this.dhwaniName,
        required this.description,
        required this.source,
        required this.dhwanis,
    });

    factory DhwaniElement.fromJson(Map<String, dynamic> json) => DhwaniElement(
        dhwaniName: json["dhwaniName"],
        description: json["description"],
        source: json["source"],
        dhwanis: List<DhwaniClass>.from(json["dhwanis"].map((x) => DhwaniClass.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "dhwaniName": dhwaniName,
        "description": description,
        "source": source,
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
        examples: List<Example>.from(json["examples"].map((x) => Example.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "sound": sound,
        "examples": List<dynamic>.from(examples.map((x) => x.toJson())),
    };
}

class Example {
    String name;
    String image;
    String sound;

    Example({
        required this.name,
        required this.image,
        required this.sound,
    });

    factory Example.fromJson(Map<String, dynamic> json) => Example(
        name: json["name"],
        image: json["image"],
        sound: json["sound"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "sound": sound,
    };
}
