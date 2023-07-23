
class UserAccountModel {
   String? userID;
   String? playRoleId;
   String? playRoleName;
   String? userMail;
   String? userPassword;

   UserAccountModel({required this.userID,required this.playRoleName,required this.playRoleId, required this.userMail,required this.userPassword});

   UserAccountModel.fromJson(Map<String, dynamic> json) {
      userID = json['userID'];
      playRoleId = json['playRoleId'];
      playRoleName = json['playRoleName'];
      userMail = json['userMail'];
      userPassword = json['userPassword'];
   }

   Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = new Map<String, dynamic>();
      data['userID'] = this.userID;
      data['playRoleId'] = this.playRoleId;
      data['playRoleName'] = this.playRoleName;
      data['userMail'] = this.userMail;
      data['userPassword'] = this.userPassword;
      return data;
   }
}