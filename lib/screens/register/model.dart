class RegisterModel {
  RegisterModel({
    required this.id,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.profilePicture,
    required this.phone,
    required this.token,
  });
  int? id;
  String? username;
  String? email;
  String? firstName;
  String? lastName;
  String? profilePicture;
  String? phone;
  String? token;

  RegisterModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    username = json['username'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    profilePicture = json['profile_picture'];
    phone = json['phone'];
    token = json['token'];
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
    _data['token'] = token;
    return _data;
  }
}