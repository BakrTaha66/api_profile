class UserModel {
  String? name;
  String? job;

  UserModel({this.name, this.job});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};

    data['name'] = name;
    data['job'] = job;

    return data;
  }
}
