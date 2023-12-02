class UserModel {
  late String image;
  late String name;

  UserModel({
    required this.image,
    required this.name,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    image = json['image'] ?? '';
    name = json['name'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['image'] = image;
    data['name'] = name;
    return data;
  }
}
