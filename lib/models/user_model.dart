import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  String title;
  String firstName;
  String lastName;
  String largePicture;
  String mediumPicture;
  String thumbnailPicture;

  User({
    required this.title,
    required this.firstName,
    required this.lastName,
    required this.largePicture,
    required this.mediumPicture,
    required this.thumbnailPicture,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    title: json["name"]["title"],
    firstName: json["name"]["first"],
    lastName: json["name"]["last"],
    largePicture: json["picture"]["large"],
    mediumPicture: json["picture"]["medium"],
    thumbnailPicture: json["picture"]["thumbnail"],
  );

  Map<String, dynamic> toJson() => {
    "name": {"title": title, "first": firstName, "last": lastName},
    "picture": {
      "large": largePicture,
      "medium": mediumPicture,
      "thumbnail": thumbnailPicture,
    },
  };
}
