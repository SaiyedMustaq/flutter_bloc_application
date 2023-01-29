// To parse this JSON data, do
//
//     final modelLoginResponse = modelLoginResponseFromJson(jsonString);

import 'dart:convert';

ModelLoginResponse modelLoginResponseFromJson(String str) =>
    ModelLoginResponse.fromJson(json.decode(str));

String modelLoginResponseToJson(ModelLoginResponse data) =>
    json.encode(data.toJson());

class ModelLoginResponse {
  int? status;
  String? message;
  Result? result;

  ModelLoginResponse({this.status, this.message, this.result});

  ModelLoginResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    result =
        (json['result'] != null ? new Result.fromJson(json['result']) : null);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    return data;
  }
}

class Result {
  int? id;
  int? role;
  String? name;
  String? email;
  String? photo;
  int? isCompleteProfile;
  String? token;
  String? photoUrl;
  //SolicitorDetail? solicitorDetail;

  Result({
    this.id,
    this.role,
    this.name,
    this.email,
    this.photo,
    this.isCompleteProfile,
    this.token,
    this.photoUrl,
    // this.solicitorDetail,
  });

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    role = json['role'];
    name = json['name'];
    email = json['email'];
    photo = json['photo'];
    isCompleteProfile = json['is_complete_profile'];
    token = json['token'];
    photoUrl = json['photo_url'];
    // if (json['solicitor_detail'] != null) {
    //   solicitorDetail = new SolicitorDetail!.fromJson(json['solicitor_detail']);
    // } else {
    //   solicitorDetail = null;
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['role'] = this.role;
    data['name'] = this.name;
    data['email'] = this.email;
    data['photo'] = this.photo;
    data['is_complete_profile'] = this.isCompleteProfile;
    data['token'] = this.token;
    data['photo_url'] = this.photoUrl;
    // if (this.solicitorDetail != null) {
    //   data['solicitor_detail'] = this.solicitorDetail!.toJson();
    // }
    return data;
  }
}

// class SolicitorDetail {
//   int id;
//   String introduction;
//   num totalExperience;
//   String rollNumber;
//   int consultationFeesInitial;
//   int consultationFeesAfter;
//   String quillUsername;
//   AreasOfLaw areasOfLaw;
//   AreasOfLaw jurisdiction;
//   AreasOfLaw legalProfessionalStatus;
//   List<CommunicationModes> communicationModes;

//   SolicitorDetail(
//       {this.id,
//       this.introduction,
//       this.totalExperience,
//       this.rollNumber,
//       this.consultationFeesInitial,
//       this.consultationFeesAfter,
//       this.quillUsername,
//       this.areasOfLaw,
//       this.jurisdiction,
//       this.legalProfessionalStatus,
//       this.communicationModes});

//   SolicitorDetail.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     introduction = json['introduction'];
//     totalExperience = json['total_experience'];
//     rollNumber = json['roll_number'];
//     consultationFeesInitial = json['consultation_fees_initial'];
//     consultationFeesAfter = json['consultation_fees_after'];
//     quillUsername = json['quill_username'];
//     areasOfLaw = json['areas_of_law'] != null
//         ? new AreasOfLaw.fromJson(json['areas_of_law'])
//         : null;
//     jurisdiction = json['jurisdiction'] != null
//         ? new AreasOfLaw.fromJson(json['jurisdiction'])
//         : null;
//     legalProfessionalStatus = json['legal_professional_status'] != null
//         ? new AreasOfLaw.fromJson(json['legal_professional_status'])
//         : null;
//     if (json['communication_modes'] != null) {
//       communicationModes = new List<CommunicationModes>();
//       json['communication_modes'].forEach((v) {
//         communicationModes.add(new CommunicationModes.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['introduction'] = this.introduction;
//     data['total_experience'] = this.totalExperience;
//     data['roll_number'] = this.rollNumber;
//     data['consultation_fees_initial'] = this.consultationFeesInitial;
//     data['consultation_fees_after'] = this.consultationFeesAfter;
//     data['quill_username'] = this.quillUsername;
//     if (this.areasOfLaw != null) {
//       data['areas_of_law'] = this.areasOfLaw.toJson();
//     }
//     if (this.jurisdiction != null) {
//       data['jurisdiction'] = this.jurisdiction.toJson();
//     }
//     if (this.legalProfessionalStatus != null) {
//       data['legal_professional_status'] = this.legalProfessionalStatus.toJson();
//     }
//     if (this.communicationModes != null) {
//       data['communication_modes'] =
//           this.communicationModes.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class AreasOfLaw {
//   int id;
//   String name;

//   AreasOfLaw({this.id, this.name});

//   AreasOfLaw.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     return data;
//   }
// }

// class CommunicationModes {
//   int id;
//   String name;
//   String icon;
//   int laravelThroughKey;
//   String iconUrl;

//   CommunicationModes(
//       {this.id, this.name, this.icon, this.laravelThroughKey, this.iconUrl});

//   CommunicationModes.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     icon = json['icon'];
//     laravelThroughKey = json['laravel_through_key'];
//     iconUrl = json['icon_url'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['icon'] = this.icon;
//     data['laravel_through_key'] = this.laravelThroughKey;
//     data['icon_url'] = this.iconUrl;
//     return data;
//   }
// }
