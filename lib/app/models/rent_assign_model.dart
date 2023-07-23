class RentAssignModel{
  String? rentAssignID;
  String? flatNoID;
  String? flatRoomID;
  String? flatSizeID;
  String? rentName;
  String? rentPhone;
  String? rentAddress;
  String? jobAddress;
  String? jobInfo;
  String? advanceAmount;
  String? joiningDate;
  String? joiningTime;
  String? isCheckPolicy;
  String? profilePath;
  String? nidBackEnd;
  String? nidFontEnd;
  String? roleAdminID;
  String? roleRentOwnerID;
  String? createFlatID;
  String? dueAmount;
  String? status;
  dynamic createdAT;
  String? flatTypeID;
  String? rentDefaultPassword;
  dynamic updatedAt;


  RentAssignModel({

    required this.rentAssignID,
    required this.flatNoID,
    required this.flatRoomID,
    required this.flatSizeID,
    required this.rentName,
    required this.rentPhone,
    required this.rentAddress,
    required this.jobAddress,
    required this.jobInfo,
    required this.advanceAmount,
    required this.joiningDate,
    required this.joiningTime,
    required this.isCheckPolicy,
    required this.profilePath,
    required this.nidBackEnd,
    required this.nidFontEnd,
    required this.roleAdminID,
    required this.roleRentOwnerID,
    required this.createFlatID,
    required this.dueAmount,
    required this.status,
    required this.flatTypeID,
    required this.rentDefaultPassword,
    required this.createdAT,
    required this.updatedAt,
  });

  RentAssignModel.name({

      required this.rentAssignID,
      required this.flatNoID,
      required this.flatRoomID,
      required this.flatSizeID,
      required this.rentName,
      required this.rentPhone,
      required this.rentAddress,
      required this.jobAddress,
      required this.jobInfo,
      required this.advanceAmount,
      required this.joiningDate,
      required this.joiningTime,
      required this.isCheckPolicy,
      required this.profilePath,
      required this.nidBackEnd,
      required this.nidFontEnd,
      required this.roleAdminID,
      required this.roleRentOwnerID,
      required this.createFlatID,
      required this.dueAmount,
      required this.status,
      required this.flatTypeID,
      required this.rentDefaultPassword,
      required this.createdAT,
      required this.updatedAt,
  });


  RentAssignModel.fromJson(Map<String, dynamic> json) {


    rentAssignID=json['rentAssignID'];
    flatNoID=json['flatNoID'];
    flatRoomID=json['flatRoomID'];
    flatSizeID=json['flatSizeID'];
    rentName=json['rentName'];
    rentPhone=json['rentPhone'];
    rentAddress=json['rentAddress'];
    jobAddress=json['jobAddress'];
    jobInfo=json['jobInfo'];
    advanceAmount=json['advanceAmount'];
    joiningDate=json['joingDate'];
    joiningTime=json['joingTime'];
    isCheckPolicy=json['isCheckPolicy'];
    profilePath=json['profilePath'];
    nidBackEnd=json['nidBackEnd'];
    nidFontEnd=json['nidFontEnd'];
    roleAdminID=json['roleAdminID'];
    roleRentOwnerID=json['roleRentOwnerID'];
    createFlatID=json['createFlatID'];
    dueAmount=json['dueAmount'];
    status=json['status'];
    flatTypeID=json['flatTypeID'];
    rentDefaultPassword=json['rentDefaultPassword'];
    createdAT=json['createdAT'];
    updatedAt=json['updatedAt'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['rentAssignID']=this.rentAssignID;
    data['flatNoID']=this.flatNoID;
    data['flatRoomID']=this.flatRoomID;
    data['flatSizeID']=this.flatSizeID;
    data['rentName']=this.rentName;
    data['rentPhone']=this.rentPhone;
    data['rentAddress']=this.rentAddress;
    data['jobAddress']=this.jobAddress;
    data['jobInfo']=this.jobInfo;
    data['advanceAmount']=this.advanceAmount;
    data['joingDate']=this.joiningDate;
    data['joingTime']=this.joiningTime;
    data['isCheckPolicy']=this.isCheckPolicy;
    data['profilePath']=this.profilePath;
    data['nidBackEnd']=this.nidBackEnd;
    data['nidFontEnd']=this.nidFontEnd;
    data['roleAdminID']=this.roleAdminID;
    data['roleRentOwnerID']=this.roleRentOwnerID;
    data['createFlatID']=this.createFlatID;
    data['dueAmount']=this.dueAmount;
    data['status']=this.status;
    data['flatTypeID']=this.flatTypeID;
    data['rentDefaultPassword']=this.rentDefaultPassword;
    data['updatedAt']=this.updatedAt;
    return data;
  }


}