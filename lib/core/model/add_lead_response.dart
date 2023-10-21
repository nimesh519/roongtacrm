
class AddLeadResponse {


  String? status;
  String? message;

  AddLeadResponse({
    this.status,
    this.message,
  });
  AddLeadResponse.fromJson(Map<String, dynamic> json) {
    status = json['status']?.toString();
    message = json['message']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}
