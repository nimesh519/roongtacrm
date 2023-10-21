class TodaysLead {
  String? status;
  String? message;
  Data? data;

  TodaysLead({this.status, this.message, this.data});

  TodaysLead.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
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
  String? phone2;
  String? status;
  String? comment;
  String? familyMember;
  String? mobileApp;
  String? insertDate;
  String? updateDate;
  String? empemail;
  String? lostCallReason;

  Data(
      {this.id,
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
        this.phone2,
        this.status,
        this.comment,
        this.familyMember,
        this.mobileApp,
        this.insertDate,
        this.updateDate,
        this.empemail,
        this.lostCallReason});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    attendedUserId = json['attended_user_id'];
    assignedUserId = json['assigned_user_id'];
    source = json['source'];
    prospectLocation = json['prospect_location'];
    preferredProject = json['preferred_project'];
    propertyStatus = json['property_status'];
    propertyType = json['property_type'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    phone2 = json['phone_2'];
    status = json['status'];
    comment = json['comment'];
    familyMember = json['family_member'];
    mobileApp = json['mobile_app'];
    insertDate = json['insert_date'];
    updateDate = json['update_date'];
    empemail = json['empemail'];
    lostCallReason = json['lost_call_reason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['attended_user_id'] = this.attendedUserId;
    data['assigned_user_id'] = this.assignedUserId;
    data['source'] = this.source;
    data['prospect_location'] = this.prospectLocation;
    data['preferred_project'] = this.preferredProject;
    data['property_status'] = this.propertyStatus;
    data['property_type'] = this.propertyType;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['phone_2'] = this.phone2;
    data['status'] = this.status;
    data['comment'] = this.comment;
    data['family_member'] = this.familyMember;
    data['mobile_app'] = this.mobileApp;
    data['insert_date'] = this.insertDate;
    data['update_date'] = this.updateDate;
    data['empemail'] = this.empemail;
    data['lost_call_reason'] = this.lostCallReason;
    return data;
  }
}
