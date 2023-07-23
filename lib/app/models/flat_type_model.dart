
class FlatTypeModel {
   String? flatTypeId;
   String? flatType;
   bool? flatTypeStatus;

   FlatTypeModel({required this.flatTypeId, required this.flatType,required this.flatTypeStatus});

   FlatTypeModel.fromJson(Map<String, dynamic> json) {
      flatTypeId = json['flatTypeId'];
      flatType = json['flatType'];
      flatTypeStatus = json['flatTypeStatus'];
   }

   Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = new Map<String, dynamic>();
      data['flatTypeId'] = this.flatTypeId;
      data['flatType'] = this.flatType;
      data['flatTypeStatus'] = this.flatTypeStatus;
      return data;
   }

}