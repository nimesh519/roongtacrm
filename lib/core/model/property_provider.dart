import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:crm/core/model/property.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PropertyDataProvider with ChangeNotifier {
  List<Property> _properties = [];

  List<Property> get properties => _properties;


 
   PropertyDataProvider() {
    _loadDataFromSharedPrefs();
  }

  Future<void> _loadDataFromSharedPrefs() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final propertyListJson = prefs.getStringList('properties') ?? [];
      _properties = propertyListJson
          .map((propertyJson) => Property.fromJson(json.decode(propertyJson)))
          .toList();
      notifyListeners();
    } catch (e) {
      // Handle any error that might occur during loading
     // print("Error loading data from shared preferences: $e");
    }
  } // Replace this with your actual list of properties

  List<String> get propertyNames =>
      _properties.map((property) => property.name).toSet().toList();
  List<String> get locationNames =>
      _properties.map((property) => property.locationName).toSet().toList();
  List<String> get propertyStatuses =>
      _properties.map((property) => property.propertyStatus).toSet().toList();
  List<String> get propertyTypeNames =>
      _properties.map((property) => property.propertyType).toSet().toList();
  List<String> get categoryTypes =>
      _properties.map((property) => property.categoryType).toSet().toList();

  String? _selectedPropertyName;
  String? _selectedLocationName;
  String? _selectedPropertyStatus;
  String? _selectedPropertyTypeName;
  String? _selectedCategoryType;

  String? get selectedPropertyName => _selectedPropertyName;
  String? get selectedLocationName => _selectedLocationName;
  String? get selectedPropertyStatus => _selectedPropertyStatus;
  String? get selectedPropertyTypeName => _selectedPropertyTypeName;
  String? get selectedCategoryType => _selectedCategoryType;

  void setSelectedPropertyName(String? value) {
    _selectedPropertyName = value;
    _selectedLocationName = null; // Reset related dropdowns
    _selectedPropertyStatus = null;
    _selectedPropertyTypeName = null;
    _selectedCategoryType = null;
    notifyListeners();
  }

  void setSelectedLocationName(String? value) {
    _selectedLocationName = value;
    notifyListeners();
  }

  void setSelectedPropertyStatus(String? value) {
    _selectedPropertyStatus = value;
    notifyListeners();
  }

  void setSelectedPropertyTypeName(String? value) {
    _selectedPropertyTypeName = value;
    notifyListeners();
  }

  void setSelectedCategoryType(String? value) {
    _selectedCategoryType = value;
    notifyListeners();
  }
}
