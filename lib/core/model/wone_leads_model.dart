class WonLedsModel {
  String? status;
  String? message;
  List<Data>? data;

  WonLedsModel({this.status, this.message, this.data});

  WonLedsModel.fromJson(Map<String, dynamic> json) {
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
  String? attendedUserId;
  Null? assignedUserId;
  Null? source;
  Null? prospectLocation;
  Null? preferredProject;
  Null? propertyStatus;
  Null? propertyType;
  Null? propertyCategory;
  String? name;
  Null? email;
  String? phone;
  Null? phone2;
  String? callid;
  String? starttime;
  String? endtime;
  String? filename;
  String? calid;
  String? pulse;
  String? mcubeSource;
  String? custfeedback;
  String? exefeedback;
  String? dialstatus;
  String? callerbusiness;
  String? callername;
  String? remark;
  String? calleraddress;
  String? callerEmail;
  String? rate;
  String? empnumber;
  String? eid;
  String? empid;
  String? gid;
  String? empemail;
  String? regoin;
  String? leadType;
  String? status;
  String? lostCallDesc;
  String? lostCallReason;
  Null? comment;
  Null? familyMember;
  Null? bdate;
  Null? adate;
  Null? mobileApp;
  String? isMsgSend;
  String? insertDate;
  String? updateDate;

  Data(
      {this.id,
        this.attendedUserId,
        this.assignedUserId,
        this.source,
        this.prospectLocation,
        this.preferredProject,
        this.propertyStatus,
        this.propertyType,
        this.propertyCategory,
        this.name,
        this.email,
        this.phone,
        this.phone2,
        this.callid,
        this.starttime,
        this.endtime,
        this.filename,
        this.calid,
        this.pulse,
        this.mcubeSource,
        this.custfeedback,
        this.exefeedback,
        this.dialstatus,
        this.callerbusiness,
        this.callername,
        this.remark,
        this.calleraddress,
        this.callerEmail,
        this.rate,
        this.empnumber,
        this.eid,
        this.empid,
        this.gid,
        this.empemail,
        this.regoin,
        this.leadType,
        this.status,
        this.lostCallDesc,
        this.lostCallReason,
        this.comment,
        this.familyMember,
        this.bdate,
        this.adate,
        this.mobileApp,
        this.isMsgSend,
        this.insertDate,
        this.updateDate});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    attendedUserId = json['attended_user_id'];
    assignedUserId = json['assigned_user_id'];
    source = json['source'];
    prospectLocation = json['prospect_location'];
    preferredProject = json['preferred_project'];
    propertyStatus = json['property_status'];
    propertyType = json['property_type'];
    propertyCategory = json['property_category'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    phone2 = json['phone_2'];
    callid = json['callid'];
    starttime = json['starttime'];
    endtime = json['endtime'];
    filename = json['filename'];
    calid = json['calid'];
    pulse = json['pulse'];
    mcubeSource = json['mcube_source'];
    custfeedback = json['custfeedback'];
    exefeedback = json['exefeedback'];
    dialstatus = json['dialstatus'];
    callerbusiness = json['callerbusiness'];
    callername = json['callername'];
    remark = json['remark'];
    calleraddress = json['calleraddress'];
    callerEmail = json['caller_email'];
    rate = json['rate'];
    empnumber = json['empnumber'];
    eid = json['eid'];
    empid = json['empid'];
    gid = json['gid'];
    empemail = json['empemail'];
    regoin = json['regoin'];
    leadType = json['lead_type'];
    status = json['status'];
    lostCallDesc = json['lost_call_desc'];
    lostCallReason = json['lost_call_reason'];
    comment = json['comment'];
    familyMember = json['family_member'];
    bdate = json['bdate'];
    adate = json['adate'];
    mobileApp = json['mobile_app'];
    isMsgSend = json['is_msg_send'];
    insertDate = json['insert_date'];
    updateDate = json['update_date'];
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
    data['property_category'] = this.propertyCategory;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['phone_2'] = this.phone2;
    data['callid'] = this.callid;
    data['starttime'] = this.starttime;
    data['endtime'] = this.endtime;
    data['filename'] = this.filename;
    data['calid'] = this.calid;
    data['pulse'] = this.pulse;
    data['mcube_source'] = this.mcubeSource;
    data['custfeedback'] = this.custfeedback;
    data['exefeedback'] = this.exefeedback;
    data['dialstatus'] = this.dialstatus;
    data['callerbusiness'] = this.callerbusiness;
    data['callername'] = this.callername;
    data['remark'] = this.remark;
    data['calleraddress'] = this.calleraddress;
    data['caller_email'] = this.callerEmail;
    data['rate'] = this.rate;
    data['empnumber'] = this.empnumber;
    data['eid'] = this.eid;
    data['empid'] = this.empid;
    data['gid'] = this.gid;
    data['empemail'] = this.empemail;
    data['regoin'] = this.regoin;
    data['lead_type'] = this.leadType;
    data['status'] = this.status;
    data['lost_call_desc'] = this.lostCallDesc;
    data['lost_call_reason'] = this.lostCallReason;
    data['comment'] = this.comment;
    data['family_member'] = this.familyMember;
    data['bdate'] = this.bdate;
    data['adate'] = this.adate;
    data['mobile_app'] = this.mobileApp;
    data['is_msg_send'] = this.isMsgSend;
    data['insert_date'] = this.insertDate;
    data['update_date'] = this.updateDate;
    return data;
  }
}
