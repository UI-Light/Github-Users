class User {
  final String name;
  final String location;
  final String profilePic;
  final String url;

  User(
      {required this.name,
      required this.location,
      required this.profilePic,
      required this.url});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        name: json["login"],
        location: "Unavailable",
        profilePic: json["avatar_url"],
        url: json["html_url"]);
  }
}
