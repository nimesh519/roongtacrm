// To parse this JSON data, do
//
//     final getPropertylocReq = getPropertylocReqFromJson(jsonString);

import 'dart:convert';

GetPropertylocReq getPropertylocReqFromJson(String str) => GetPropertylocReq.fromJson(json.decode(str));

String getPropertylocReqToJson(GetPropertylocReq data) => json.encode(data.toJson());

class GetPropertylocReq {
    String locationId;

    GetPropertylocReq({
        required this.locationId,
    });

    factory GetPropertylocReq.fromJson(Map<String, dynamic> json) => GetPropertylocReq(
        locationId: json["location_id"],
    );

    Map<String, dynamic> toJson() => {
        "location_id": locationId,
    };
}
