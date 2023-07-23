
class PlayRoleModel {
   String? playRoleId;
   String? playRole;
   bool? playRoleStatus;

   PlayRoleModel({required this.playRoleId, required this.playRole,required this.playRoleStatus});

   PlayRoleModel.fromJson(Map<String, dynamic> json) {
      playRoleId = json['playRoleId'];
      playRole = json['playRole'];
      playRoleStatus = json['playRoleStatus'];
   }

   Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = new Map<String, dynamic>();
      data['playRoleId'] = this.playRoleId;
      data['playRole'] = this.playRole;
      data['playRoleStatus'] = this.playRoleStatus;
      return data;
   }

}