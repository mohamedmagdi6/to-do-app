class UserModel {
  String id;
  String userName;
  String phone;

  UserModel({
    this.id = '',
    required this.phone,
    required this.userName,
  });

  UserModel.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          userName: json['userName'],
          phone: json['phone'],
        );

  Map<String, dynamic> toJson() {
    return {'id': id, 'userName': userName, 'phone': phone};
  }
}
