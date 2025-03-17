class UserModel {
  int? id;


  UserModel(
      {this.id,
        });

  UserModel.fromJson(dynamic json) {
    id = json['id'];

  }

  Map<String, dynamic> toJson() {
    final val = <String, dynamic>{};
    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('id', id);

    return val;
  }
}