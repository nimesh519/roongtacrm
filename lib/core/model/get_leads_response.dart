///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class GetLeadsResponseData {

  String? id;
  String? attendedUserId;
  String? assignedUserId;
  String? source;
  String? prospectLocation;
  String? preferredProject;
  String? propertyStatus;
  String? propertyType;
  String? name;
  String? email;
  String? phone;
  String? phone_2;
  String? status;
  String? comment;
  String? familyMember;
  String? mobileApp;
  String? insertDate;
  String? updateDate;
  String? empemail;

  GetLeadsResponseData({
    this.id,
    this.attendedUserId,
    this.assignedUserId,
    this.source,
    this.prospectLocation,
    this.preferredProject,
    this.propertyStatus,
    this.propertyType,
    this.name,
    this.email,
    this.phone,
    this.phone_2,
    this.status,
    this.comment,
    this.familyMember,
    this.mobileApp,
    this.insertDate,
    this.updateDate,
    this.empemail,
  });
  GetLeadsResponseData.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    attendedUserId = json['attended_user_id']?.toString();
    assignedUserId = json['assigned_user_id']?.toString();
    source = json['source']?.toString();
    prospectLocation = json['prospect_location']?.toString();
    preferredProject = json['preferred_project']?.toString();
    propertyStatus = json['property_status']?.toString();
    propertyType = json['property_type']?.toString();
    name = json['name']?.toString();
    email = json['email']?.toString();
    phone = json['phone']?.toString();
    phone_2 = json['phone_2']?.toString();
    status = json['status']?.toString();
    comment = json['comment']?.toString();
    familyMember = json['family_member']?.toString();
    mobileApp = json['mobile_app']?.toString();
    insertDate = json['insert_date']?.toString();
    updateDate = json['update_date']?.toString();
    empemail = json['empemail']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['attended_user_id'] = attendedUserId;
    data['assigned_user_id'] = assignedUserId;
    data['source'] = source;
    data['prospect_location'] = prospectLocation;
    data['preferred_project'] = preferredProject;
    data['property_status'] = propertyStatus;
    data['property_type'] = propertyType;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['phone_2'] = phone_2;
    data['status'] = status;
    data['comment'] = comment;
    data['family_member'] = familyMember;
    data['mobile_app'] = mobileApp;
    data['insert_date'] = insertDate;
    data['update_date'] = updateDate;
    data['empemail'] = empemail;
    return data;
  }
}

class GetLeadsResponse {

  String? status;
  String? message;
  List<GetLeadsResponseData?>? data;

  GetLeadsResponse({
    this.status,
    this.message,
    this.data,
  });
  GetLeadsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status']?.toString();
    message = json['message']?.toString();
  if (json['data'] != null) {
  final v = json['data'];
  final arr0 = <GetLeadsResponseData>[];
  v.forEach((v) {
  arr0.add(GetLeadsResponseData.fromJson(v));
  });
    data = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      final v = this.data;
      final arr0 = [];
  v!.forEach((v) {
  arr0.add(v!.toJson());
  });
      data['data'] = arr0;
    }
    return data;
  }
}
