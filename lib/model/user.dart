class User {
  final String id;
  final String name;
  final String picture;
  final String title;
  final String text;

  User({this.id, this.name, this.picture, this.title, this.text});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        name: json['name'],
        picture: json['picture'],
        title: json['title'],
        text: json['text']);
  }
}
