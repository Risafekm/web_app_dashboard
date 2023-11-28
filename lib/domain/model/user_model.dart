class UserModel {
  late String image;
  late String name;
  late String email;
  UserModel({required this.image, required this.name, required this.email});

  UserModel.fromJson(Map<String, dynamic> json) {
    image = json['image'] ?? '';
    name = json['name'] ?? '';
    email = json['email'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['image'] = image;
    data['name'] = name;
    data['email'] = email;
    return data;
  }
}
