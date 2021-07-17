import 'dart:convert';

Allimages allimagesFromJson(String str) => Allimages.fromJson(json.decode(str));

String allimagesToJson(Allimages data) => json.encode(data.toJson());

class Allimages {
  Allimages({
    this.id,
    this.title,
    this.subPaths,
  });

  String id;
  String title;
  List<SubPath> subPaths;

  factory Allimages.fromJson(Map<String, dynamic> json) => Allimages(
        id: json["id"],
        title: json["title"],
        subPaths: List<SubPath>.from(
            json["sub_paths"].map((x) => SubPath.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "sub_paths": List<dynamic>.from(subPaths.map((x) => x.toJson())),
      };
}

class SubPath {
  SubPath({
    this.id,
    this.title,
    this.image,
  });

  String id;
  String title;
  String image;

  factory SubPath.fromJson(Map<String, dynamic> json) => SubPath(
        id: json["id"],
        title: json["title"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
      };
}
