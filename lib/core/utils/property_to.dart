
import 'dart:convert';

import 'package:crm/core/model/property.dart';

class PropertyTo {

  String propertyToJson(Property property) {
  final propertyMap = {
    "name": property.name,
    "locationName": property.locationName,
    "propertyStatus": property.propertyStatus,
    "propertyType": property.propertyType,
    "categoryType": property.categoryType,
  };
  return json.encode(propertyMap);
}

Property propertyFromJson(String propertyJson) {
  final propertyMap = json.decode(propertyJson) as Map<String, dynamic>;
  return Property(
    name: propertyMap["name"],
    locationName: propertyMap["locationName"],
    propertyStatus: propertyMap["propertyStatus"],
    propertyType: propertyMap["propertyType"],
    categoryType: propertyMap["categoryType"],
  );
}

  
}