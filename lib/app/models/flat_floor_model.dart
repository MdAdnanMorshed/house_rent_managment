
class FlatFloorModel {
   String? flatFloorId;
   String? flatFloor;
   bool? flatFloorStatus;

   FlatFloorModel({required this.flatFloorId, required this.flatFloor,required this.flatFloorStatus});

   FlatFloorModel.fromJson(Map<String, dynamic> json) {
      flatFloorId = json['flatFloorId'];
      flatFloor = json['flatFloor'];
      flatFloorStatus = json['flatFloorStatus'];
   }

   Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = new Map<String, dynamic>();
      data['flatFloorId'] = this.flatFloorId;
      data['flatFloor'] = this.flatFloor;
      data['flatFloorStatus'] = this.flatFloorStatus;
      return data;
   }

}