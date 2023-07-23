
class FlatNoModel {
   String? flatNoId;
   String? flatNo;
   bool? flatNoStatus;

   FlatNoModel({required this.flatNoId, required this.flatNo,required this.flatNoStatus});

   FlatNoModel.fromJson(Map<String, dynamic> json) {
      flatNoId = json['flatNoId'];
      flatNo = json['flatNo'];
      flatNoStatus = json['flatNoStatus'];
   }

   Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = new Map<String, dynamic>();
      data['flatNoId'] = this.flatNoId;
      data['flatNo'] = this.flatNo;
      data['flatNoStatus'] = this.flatNoStatus;
      return data;
   }

}