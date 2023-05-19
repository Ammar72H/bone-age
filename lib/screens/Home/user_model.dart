class UserModel {
  UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.profilePicture,
    required this.phone,
  });
  late final int id;
  late final String username;
  late final String email;
  late final String firstName;
  late final String lastName;
  late final String profilePicture;
  late final String phone;

  UserModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    username = json['username'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    profilePicture = json['profile_picture'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['username'] = username;
    _data['email'] = email;
    _data['first_name'] = firstName;
    _data['last_name'] = lastName;
    _data['profile_picture'] = profilePicture;
    _data['phone'] = phone;
    return _data;
  }
}