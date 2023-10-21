class LoginResponse {
  String? status;
  String? message;
  Data? data;
  String? userType;

  LoginResponse({this.status, this.message, this.data, this.userType});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    userType = json['user_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['user_type'] = userType;
    return data;
  }
}

class Data {
  String? id;
  String? userId;
  String? propertyId;
  String? firstName;
  String? lastName;
  String? middleName;
  String? email;
  String? password;
  String? phone;
  String? address;
  String? zipcode;
  String? profilePicture;
  String? lastLogin;
  String? insertDate;
  String? updateDate;
  String? status;

  Data(
      {this.id,
      this.userId,
      this.propertyId,
      this.firstName,
      this.lastName,
      this.middleName,
      this.email,
      this.password,
      this.phone,
      this.address,
      this.zipcode,
      this.profilePicture,
      this.lastLogin,
      this.insertDate,
      this.updateDate,
      this.status});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    propertyId = json['property_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    middleName = json['middle_name'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    address = json['address'];
    zipcode = json['zipcode'];
    profilePicture = json['profile_picture'];
    lastLogin = json['last_login'];
    insertDate = json['insert_date'];
    updateDate = json['update_date'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['property_id'] = propertyId;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['middle_name'] = middleName;
    data['email'] = email;
    data['password'] = password;
    data['phone'] = phone;
    data['address'] = address;
    data['zipcode'] = zipcode;
    data['profile_picture'] = profilePicture;
    data['last_login'] = lastLogin;
    data['insert_date'] = insertDate;
    data['update_date'] = updateDate;
    data['status'] = status;
    return data;
  }
}
