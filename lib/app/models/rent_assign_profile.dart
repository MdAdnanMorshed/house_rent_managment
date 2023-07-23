class RentAssignProfileModel {
  String? id;
  String? rentName;
  String? password;
  String? mail;
  String? flatId;
  String? flatAssignID;
  String? phone;
  String? bloc;

  RentAssignProfileModel(
      {this.id,
        this.rentName,
        this.password,
        this.mail,
        this.flatId,
        this.flatAssignID,
        this.phone,
        this.bloc});

  RentAssignProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rentName = json['rentName'];
    password = json['password'];
    mail = json['mail'];
    flatId = json['flatId'];
    flatAssignID = json['flatAssignID'];
    phone = json['phone'];
    bloc = json['bloc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['rentName'] = this.rentName;
    data['password'] = this.password;
    data['mail'] = this.mail;
    data['flatId'] = this.flatId;
    data['flatAssignID'] = this.flatAssignID;
    data['phone'] = this.phone;
    data['bloc'] = this.bloc;
    return data;
  }
}