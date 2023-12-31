///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class FollowResponse {
/*
{
  "status": "true",
  "message": "Success"
} 
*/

  String? status;
  String? message;

  FollowResponse({
    this.status,
    this.message,
  });
  FollowResponse.fromJson(Map<String, dynamic> json) {
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
