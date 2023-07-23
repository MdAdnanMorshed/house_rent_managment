
class FlatSizeModel {
   String? flatSizeId;
   String? flatSize;
   bool? flatSizeStatus;

   FlatSizeModel({required this.flatSizeId, required this.flatSize,required this.flatSizeStatus});

   FlatSizeModel.fromJson(Map<String, dynamic> json) {
      flatSizeId = json['flatSizeId'];
      flatSize = json['flatSize'];
      flatSizeStatus = json['flatSizeStatus'];
   }

   Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = new Map<String, dynamic>();
      data['flatSizeId'] = this.flatSizeId;
      data['flatSize'] = this.flatSize;
      data['flatSizeStatus'] = this.flatSizeStatus;
      return data;
   }

}