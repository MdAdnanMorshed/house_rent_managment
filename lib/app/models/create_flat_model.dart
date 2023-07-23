
class CreateFlatModel {
   String? createFlatID;
   String? roleID;
   String? flatFloorId;
   String? flatFloor;
   String? flatSizeId;
   String? flatSize;
   String? flatNoId;
   String? flatNo;
   String? flatAmount;
   String? flatServiceBill;
   String? flatWaterBill;
   String? flatGasBill;
   dynamic createdAT;
   dynamic updateAt;


   CreateFlatModel.name();

  CreateFlatModel({
      required  this.createFlatID,
      required  this.roleID,
      required  this.flatFloorId,
      required  this.flatFloor,
     required  this.flatSizeId,
     required  this.flatSize,
     required this.flatNoId,
     required this.flatNo,
     required this.flatAmount,
     required this.flatServiceBill,
     required this.flatWaterBill,
     required this.flatGasBill,
     required  this.createdAT,
     required this.updateAt});

  CreateFlatModel.fromJson(Map<String, dynamic> json) {
     createFlatID = json['createFlatID'];
     roleID = json['roleID'];
     flatFloorId = json['flatFloorId'];
     flatFloor = json['flatFloor'];
     flatSizeId = json['flatSizeId'];
     flatSize = json['flatSize'];
     flatNoId = json['flatNoId'];
     flatNo = json['flatNo'];
     flatAmount = json['flatAmount'];

     flatServiceBill = json['flatServiceBill'];
     flatWaterBill = json['flatWaterBill'];
     flatGasBill = json['flatGasBill'];
     createdAT = json['createdAT'];
     updateAt = json['updateAt'];
   }

   Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = new Map<String, dynamic>();
      data['createFlatID'] = this.createFlatID;
      data['roleID'] = this.roleID;
      data['flatFloorId'] = this.flatFloorId;
      data['flatFloor'] = this.flatFloor;
      data['flatSizeId'] = this.flatSizeId;
      data['flatSize'] = this.flatSize;
      data['flatNoId'] = this.flatNoId;
      data['flatNo'] = this.flatNo;
      data['flatAmount'] = this.flatAmount;
      data['flatServiceBill'] = this.flatServiceBill;
      data['flatWaterBill'] = this.flatWaterBill;
      data['flatGasBill'] = this.flatGasBill;
      data['createdAT'] = this.createdAT;
      data['updateAt'] = this.updateAt;

      return data;
   }

}