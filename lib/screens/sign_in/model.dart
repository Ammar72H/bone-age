class LoginModel {
  dynamic token;
  int? user_id;
  String? email;
  String? username;
  String? photo;

  LoginModel({this.token, this.email, this.user_id,this.username,this.photo});

  LoginModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user_id = json['user_id'];
    email = json['email'];
    username = json['username'];
    photo = json['profile_picture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['user_id'] = this.user_id;
    data['email'] = this.email;
    data['username'] = this.username;
    data['profile_picture'] = this.photo;
    return data;
  }
}
