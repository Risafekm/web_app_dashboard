class UserModel {
  late String image;
  late String name;
  late String email;
  late String id;
  late String about;
  UserModel(
      {required this.image,
      required this.name,
      required this.email,
      required this.about,
      required this.id});

  UserModel.fromJson(Map<String, dynamic> json) {
    image = json['image'] ?? '';
    name = json['name'] ?? '';
    email = json['email'] ?? '';
    id = json['id'];
    about = json['about'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['image'] = image;
    data['name'] = name;
    data['email'] = email;
    data['id'] = id;
    data['about'] = about;
    return data;
  }
}
