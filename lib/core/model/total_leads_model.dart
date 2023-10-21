class TotalLeads {
  String? status;
  String? message;
  List<Data>? data;

  TotalLeads({this.status, this.message, this.data});

  TotalLeads.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? leadId;
  String? dateTime;
  String? callType;
  String? description;
  String? status;
  String? displayStatus;
  String? seen;
  String? attendedUserId;
  String? assignedUserId;

  Data(
      {this.id,
        this.leadId,
        this.dateTime,
        this.callType,
        this.description,
        this.status,
        this.displayStatus,
        this.seen,
        this.attendedUserId,
        this.assignedUserId});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    leadId = json['lead_id'];
    dateTime = json['date_time'];
    callType = json['call_type'];
    description = json['description'];
    status = json['status'];
    displayStatus = json['display_status'];
    seen = json['seen'];
    attendedUserId = json['attended_user_id'];
    assignedUserId = json['assigned_user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['lead_id'] = this.leadId;
    data['date_time'] = this.dateTime;
    data['call_type'] = this.callType;
    data['description'] = this.description;
    data['status'] = this.status;
    data['display_status'] = this.displayStatus;
    data['seen'] = this.seen;
    data['attended_user_id'] = this.attendedUserId;
    data['assigned_user_id'] = this.assignedUserId;
    return data;
  }

}
