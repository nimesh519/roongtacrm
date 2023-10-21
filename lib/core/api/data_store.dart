import 'dart:convert';

import 'package:crm/core/model/get_leads_response.dart';
import 'package:crm/core/model/property.dart';
import 'package:crm/core/utils/property_to.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataStore{
 
 static void saveUserLoginState(bool isLoggedIn) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('is_logged_in', isLoggedIn);
}

static void saveUserID(String userId) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('user_id', userId);
}

static  Future<bool> getUserLoginState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('is_logged_in') ?? false;
    return isLoggedIn;
  }

static  Future<String> getUserID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String isLoggedIn = prefs.getString('user_id') ??"";
    return isLoggedIn;
  }

  

 static Future<void> savePropertiesToSharedPrefs(List<Property> properties) async {
  final prefs = await SharedPreferences.getInstance();
  final propertyListJson = properties.map((property) => PropertyTo().propertyToJson(property)).toList();
  await prefs.setStringList('properties', propertyListJson);
}

static Future<List<Property>> getPropertiesFromSharedPrefs() async {
  final prefs = await SharedPreferences.getInstance();
  final propertyListJson = prefs.getStringList('properties') ?? [];
  return propertyListJson.map((propertyJson) => PropertyTo().propertyFromJson(propertyJson)).toList();
}



static Future<void> saveLeadsResponseToSharedPreferences(String jsonString) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('leadsResponse', jsonString);
}

static Future<GetLeadsResponse?> getLeadsResponseFromSharedPreferences() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? jsonString = prefs.getString('leadsResponse');

  if (jsonString != null) {
    // If the JSON string exists, decode it and return the GetLeadsResponse object
    Map<String, dynamic> jsonData = jsonDecode(jsonString);
    return GetLeadsResponse.fromJson(jsonData);
  } else {
    // If the JSON string doesn't exist, return null
    return null;
  }
}

static void clearSharedPreferences() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.clear(); // This will clear all data stored in SharedPreferences
}


}