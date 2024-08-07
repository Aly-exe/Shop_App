class UserModel {
  int? id; 
  String? name;
  String? email;
  String? phone;
  String? image;
  int? points;
  int? credit;
  String? token;
  UserModel(
      {this.id,
        this.name,
      this.email,
      this.phone,
      this.image,
      this.credit,
      this.points,
      this.token});
  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    points = json['points'];
    credit = json['credit'];
    token = json['token'];
  }
}
