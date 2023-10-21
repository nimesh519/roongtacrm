///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class TotalCountResponseData {
/*
{
  "total_leads": 4,
  "total_lost_leads": 0,
  "total_followup_leads": 2,
  "total_todays_followup_leads": 1,
  "total_new_leads": 0,
  "total_won_leads": 0,
  "total_executive_leads": 0
} 
*/

  int? totalLeads;
  int? totalLostLeads;
  int? totalFollowupLeads;
  int? totalTodaysFollowupLeads;
  int? totalNewLeads;
  int? totalWonLeads;
  int? totalExecutiveLeads;

  TotalCountResponseData({
    this.totalLeads,
    this.totalLostLeads,
    this.totalFollowupLeads,
    this.totalTodaysFollowupLeads,
    this.totalNewLeads,
    this.totalWonLeads,
    this.totalExecutiveLeads,
  });
  TotalCountResponseData.fromJson(Map<String, dynamic> json) {
    totalLeads = json['total_leads']?.toInt();
    totalLostLeads = json['total_lost_leads']?.toInt();
    totalFollowupLeads = json['total_followup_leads']?.toInt();
    totalTodaysFollowupLeads = json['total_todays_followup_leads']?.toInt();
    totalNewLeads = json['total_new_leads']?.toInt();
    totalWonLeads = json['total_won_leads']?.toInt();
    totalExecutiveLeads = json['total_executive_leads']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['total_leads'] = totalLeads;
    data['total_lost_leads'] = totalLostLeads;
    data['total_followup_leads'] = totalFollowupLeads;
    data['total_todays_followup_leads'] = totalTodaysFollowupLeads;
    data['total_new_leads'] = totalNewLeads;
    data['total_won_leads'] = totalWonLeads;
    data['total_executive_leads'] = totalExecutiveLeads;
    return data;
  }
}

class TotalCountResponse {
/*
{
  "status": "true",
  "message": "Success",
  "data": {
    "total_leads": 4,
    "total_lost_leads": 0,
    "total_followup_leads": 2,
    "total_todays_followup_leads": 1,
    "total_new_leads": 0,
    "total_won_leads": 0,
    "total_executive_leads": 0
  }
} 
*/

  String? status;
  String? message;
  TotalCountResponseData? data;

  TotalCountResponse({
    this.status,
    this.message,
    this.data,
  });
  TotalCountResponse.fromJson(Map<String, dynamic> json) {
    status = json['status']?.toString();
    message = json['message']?.toString();
    data = (json['data'] != null) ? TotalCountResponseData.fromJson(json['data']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}