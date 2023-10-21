class Property {
  String name;
  String locationName;
  String propertyStatus;
  String propertyType;
  String categoryType;

  Property({
    required this.name,
    required this.locationName,
    required this.propertyStatus,
    required this.propertyType,
    required this.categoryType,
  });

   factory Property.fromJson(Map<String, dynamic> json) {
    return Property(
      name: json['name'],
      locationName: json['locationName'],
      propertyStatus: json['propertyStatus'],
      propertyType: json['propertyType'],
      categoryType: json['categoryType'],
    );
  }
}
