// To parse this JSON data, do
//
//     final getpropertyresponse = getpropertyresponseFromJson(jsonString);

import 'dart:convert';

import 'package:crm/core/model/property.dart';

Getpropertyresponse getpropertyresponseFromJson(String str) => Getpropertyresponse.fromJson(json.decode(str));

String getpropertyresponseToJson(Getpropertyresponse data) => json.encode(data.toJson());

class Getpropertyresponse {
    String status;
    String message;
    Data data;

    Getpropertyresponse({
        required this.status,
        required this.message,
        required this.data,
    });

    factory Getpropertyresponse.fromJson(Map<String, dynamic> json) => Getpropertyresponse(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
    };

    List<Property> toPropertyList() {
    List<Property> properties = [];

    // Add naPlots
    properties.addAll(data.naPlots.map((naPlot) => Property(
          name: naPlot.name,
          locationName: naPlot.locationName,
          propertyStatus: naPlot.propertyStatus.toString(),
          propertyType: naPlot.propertyType.first.name,
          categoryType: 'naPlots',
        )));

    // Add residential
    properties.addAll(data.residential.map((residential) => Property(
          name: residential.name,
          locationName: residential.locationName,
          propertyStatus: residential.propertyStatus.toString(),
          propertyType: residential.propertyType.first.name,
          categoryType: 'residential',
        )));

    // Add commercial
    properties.addAll(data.commercial.map((commercial) => Property(
          name: commercial.name,
          locationName: commercial.locationName,
          propertyStatus: commercial.propertyStatus.toString(),
          propertyType: commercial.propertyType.first.name,
          categoryType: 'commercial',
        )));

    return properties;
  }
}

class Data {
    List<NaPlot> naPlots;
    List<Residential> residential;
    List<Commercial> commercial;

    Data({
        required this.naPlots,
        required this.residential,
        required this.commercial,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        naPlots: List<NaPlot>.from(json["na_plots"].map((x) => NaPlot.fromJson(x))),
        residential: List<Residential>.from(json["residential"].map((x) => Residential.fromJson(x))),
        commercial: List<Commercial>.from(json["commercial"].map((x) => Commercial.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "na_plots": List<dynamic>.from(naPlots.map((x) => x.toJson())),
        "residential": List<dynamic>.from(residential.map((x) => x.toJson())),
        "commercial": List<dynamic>.from(commercial.map((x) => x.toJson())),
    };
}

class Commercial {
    String id;
    String categoryId;
    String slug;
    String locationId;
    String name;
    String address;
    List<Amenity> propertyType;
    String description;
    List<Amenity> amenities;
    String rating;
    String serviceRating;
    String amenityRating;
    String valueRating;
    String mapLink;
    String? video;
    String logo;
    List<String> images;
    List<String> gallery;
    String featured;
    String offer;
    String? offerText;
    String? offerImage;
    String? broucher;
    PropertyStatus propertyStatus;
    String status;
    String seoTitle;
    String seoKeywords;
    String seoDescription;
    dynamic extraComments;
    String locationName;
    String videoLink;
    String newMapLink;
    String shareUrl;

    Commercial({
        required this.id,
        required this.categoryId,
        required this.slug,
        required this.locationId,
        required this.name,
        required this.address,
        required this.propertyType,
        required this.description,
        required this.amenities,
        required this.rating,
        required this.serviceRating,
        required this.amenityRating,
        required this.valueRating,
        required this.mapLink,
        this.video,
        required this.logo,
        required this.images,
        required this.gallery,
        required this.featured,
        required this.offer,
        this.offerText,
        this.offerImage,
        this.broucher,
        required this.propertyStatus,
        required this.status,
        required this.seoTitle,
        required this.seoKeywords,
        required this.seoDescription,
        this.extraComments,
        required this.locationName,
        required this.videoLink,
        required this.newMapLink,
        required this.shareUrl,
    });

    factory Commercial.fromJson(Map<String, dynamic> json) => Commercial(
        id: json["id"],
        categoryId: json["category_id"],
        slug: json["slug"],
        locationId: json["location_id"],
        name: json["name"],
        address: json["address"],
        propertyType: List<Amenity>.from(json["property_type"].map((x) => Amenity.fromJson(x))),
        description: json["description"],
        amenities: List<Amenity>.from(json["amenities"].map((x) => Amenity.fromJson(x))),
        rating: json["rating"],
        serviceRating: json["service_rating"],
        amenityRating: json["amenity_rating"],
        valueRating: json["value_rating"],
        mapLink: json["map_link"],
        video: json["video"],
        logo: json["logo"],
        images: List<String>.from(json["images"].map((x) => x)),
        gallery: List<String>.from(json["gallery"].map((x) => x)),
        featured: json["featured"],
        offer: json["offer"],
        offerText: json["offer_text"],
        offerImage: json["offer_image"],
        broucher: json["broucher"],
        propertyStatus: propertyStatusValues.map[json["property_status"]]!,
        status: json["status"],
        seoTitle: json["seo_title"],
        seoKeywords: json["seo_keywords"],
        seoDescription: json["seo_description"],
        extraComments: json["extra_comments"],
        locationName: json["location_name"],
        videoLink: json["video_link"],
        newMapLink: json["new_map_link"],
        shareUrl: json["share_url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": categoryId,
        "slug": slug,
        "location_id": locationId,
        "name": name,
        "address": address,
        "property_type": List<dynamic>.from(propertyType.map((x) => x.toJson())),
        "description": description,
        "amenities": List<dynamic>.from(amenities.map((x) => x.toJson())),
        "rating": rating,
        "service_rating": serviceRating,
        "amenity_rating": amenityRating,
        "value_rating": valueRating,
        "map_link": mapLink,
        "video": video,
        "logo": logo,
        "images": List<dynamic>.from(images.map((x) => x)),
        "gallery": List<dynamic>.from(gallery.map((x) => x)),
        "featured": featured,
        "offer": offer,
        "offer_text": offerText,
        "offer_image": offerImage,
        "broucher": broucher,
        "property_status": propertyStatusValues.reverse[propertyStatus],
        "status": status,
        "seo_title": seoTitle,
        "seo_keywords": seoKeywords,
        "seo_description": seoDescription,
        "extra_comments": extraComments,
        "location_name": locationName,
        "video_link": videoLink,
        "new_map_link": newMapLink,
        "share_url": shareUrl,
    };
}

class Amenity {
    String id;
    String name;
    String status;
    String? slug;

    Amenity({
        required this.id,
        required this.name,
        required this.status,
        this.slug,
    });

    factory Amenity.fromJson(Map<String, dynamic> json) => Amenity(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        slug: json["slug"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
        "slug": slug,
    };
}

enum PropertyStatus {
    ONGOING_PROJECTS,
    READY_POSSESSION
}

final propertyStatusValues = EnumValues({
    "Ongoing Projects": PropertyStatus.ONGOING_PROJECTS,
    "Ready Possession": PropertyStatus.READY_POSSESSION
});

class NaPlot {
    String id;
    String categoryId;
    String slug;
    String locationId;
    String name;
    String address;
    List<Amenity> propertyType;
    String description;
    List<dynamic> amenities;
    String rating;
    String serviceRating;
    String amenityRating;
    String valueRating;
    dynamic mapLink;
    dynamic video;
    String logo;
    List<String> images;
    List<dynamic> gallery;
    String featured;
    String offer;
    dynamic offerText;
    dynamic offerImage;
    String broucher;
    PropertyStatus propertyStatus;
    String status;
    String seoTitle;
    String seoKeywords;
    String seoDescription;
    dynamic extraComments;
    String locationName;
    String videoLink;
    String newMapLink;
    String shareUrl;

    NaPlot({
        required this.id,
        required this.categoryId,
        required this.slug,
        required this.locationId,
        required this.name,
        required this.address,
        required this.propertyType,
        required this.description,
        required this.amenities,
        required this.rating,
        required this.serviceRating,
        required this.amenityRating,
        required this.valueRating,
        this.mapLink,
        this.video,
        required this.logo,
        required this.images,
        required this.gallery,
        required this.featured,
        required this.offer,
        this.offerText,
        this.offerImage,
        required this.broucher,
        required this.propertyStatus,
        required this.status,
        required this.seoTitle,
        required this.seoKeywords,
        required this.seoDescription,
        this.extraComments,
        required this.locationName,
        required this.videoLink,
        required this.newMapLink,
        required this.shareUrl,
    });

    factory NaPlot.fromJson(Map<String, dynamic> json) => NaPlot(
        id: json["id"],
        categoryId: json["category_id"],
        slug: json["slug"],
        locationId: json["location_id"],
        name: json["name"],
        address: json["address"],
        propertyType: List<Amenity>.from(json["property_type"].map((x) => Amenity.fromJson(x))),
        description: json["description"],
        amenities: List<dynamic>.from(json["amenities"].map((x) => x)),
        rating: json["rating"],
        serviceRating: json["service_rating"],
        amenityRating: json["amenity_rating"],
        valueRating: json["value_rating"],
        mapLink: json["map_link"],
        video: json["video"],
        logo: json["logo"],
        images: List<String>.from(json["images"].map((x) => x)),
        gallery: List<dynamic>.from(json["gallery"].map((x) => x)),
        featured: json["featured"],
        offer: json["offer"],
        offerText: json["offer_text"],
        offerImage: json["offer_image"],
        broucher: json["broucher"],
        propertyStatus: propertyStatusValues.map[json["property_status"]]!,
        status: json["status"],
        seoTitle: json["seo_title"],
        seoKeywords: json["seo_keywords"],
        seoDescription: json["seo_description"],
        extraComments: json["extra_comments"],
        locationName: json["location_name"],
        videoLink: json["video_link"],
        newMapLink: json["new_map_link"],
        shareUrl: json["share_url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": categoryId,
        "slug": slug,
        "location_id": locationId,
        "name": name,
        "address": address,
        "property_type": List<dynamic>.from(propertyType.map((x) => x.toJson())),
        "description": description,
        "amenities": List<dynamic>.from(amenities.map((x) => x)),
        "rating": rating,
        "service_rating": serviceRating,
        "amenity_rating": amenityRating,
        "value_rating": valueRating,
        "map_link": mapLink,
        "video": video,
        "logo": logo,
        "images": List<dynamic>.from(images.map((x) => x)),
        "gallery": List<dynamic>.from(gallery.map((x) => x)),
        "featured": featured,
        "offer": offer,
        "offer_text": offerText,
        "offer_image": offerImage,
        "broucher": broucher,
        "property_status": propertyStatusValues.reverse[propertyStatus],
        "status": status,
        "seo_title": seoTitle,
        "seo_keywords": seoKeywords,
        "seo_description": seoDescription,
        "extra_comments": extraComments,
        "location_name": locationName,
        "video_link": videoLink,
        "new_map_link": newMapLink,
        "share_url": shareUrl,
    };
}

class Residential {
    String id;
    String categoryId;
    String slug;
    String locationId;
    String name;
    String address;
    List<Amenity> propertyType;
    String description;
    List<Amenity?> amenities;
    String rating;
    String serviceRating;
    String amenityRating;
    String valueRating;
    String? mapLink;
    String? video;
    String logo;
    List<String> images;
    List<String> gallery;
    String featured;
    String offer;
    String? offerText;
    String? offerImage;
    String? broucher;
    PropertyStatus propertyStatus;
    String status;
    String seoTitle;
    String seoKeywords;
    String seoDescription;
    dynamic extraComments;
    String locationName;
    String videoLink;
    String newMapLink;
    String shareUrl;

    Residential({
        required this.id,
        required this.categoryId,
        required this.slug,
        required this.locationId,
        required this.name,
        required this.address,
        required this.propertyType,
        required this.description,
        required this.amenities,
        required this.rating,
        required this.serviceRating,
        required this.amenityRating,
        required this.valueRating,
        this.mapLink,
        this.video,
        required this.logo,
        required this.images,
        required this.gallery,
        required this.featured,
        required this.offer,
        this.offerText,
        this.offerImage,
        this.broucher,
        required this.propertyStatus,
        required this.status,
        required this.seoTitle,
        required this.seoKeywords,
        required this.seoDescription,
        this.extraComments,
        required this.locationName,
        required this.videoLink,
        required this.newMapLink,
        required this.shareUrl,
    });

    factory Residential.fromJson(Map<String, dynamic> json) => Residential(
        id: json["id"],
        categoryId: json["category_id"],
        slug: json["slug"],
        locationId: json["location_id"],
        name: json["name"],
        address: json["address"],
        propertyType: List<Amenity>.from(json["property_type"].map((x) => Amenity.fromJson(x))),
        description: json["description"],
        amenities: List<Amenity?>.from(json["amenities"].map((x) => x == null ? null : Amenity.fromJson(x))),
        rating: json["rating"],
        serviceRating: json["service_rating"],
        amenityRating: json["amenity_rating"],
        valueRating: json["value_rating"],
        mapLink: json["map_link"],
        video: json["video"],
        logo: json["logo"],
        images: List<String>.from(json["images"].map((x) => x)),
        gallery: List<String>.from(json["gallery"].map((x) => x)),
        featured: json["featured"],
        offer: json["offer"],
        offerText: json["offer_text"],
        offerImage: json["offer_image"],
        broucher: json["broucher"],
        propertyStatus: propertyStatusValues.map[json["property_status"]]!,
        status: json["status"],
        seoTitle: json["seo_title"],
        seoKeywords: json["seo_keywords"],
        seoDescription: json["seo_description"],
        extraComments: json["extra_comments"],
        locationName: json["location_name"],
        videoLink: json["video_link"],
        newMapLink: json["new_map_link"],
        shareUrl: json["share_url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": categoryId,
        "slug": slug,
        "location_id": locationId,
        "name": name,
        "address": address,
        "property_type": List<dynamic>.from(propertyType.map((x) => x.toJson())),
        "description": description,
        "amenities": List<dynamic>.from(amenities.map((x) => x?.toJson())),
        "rating": rating,
        "service_rating": serviceRating,
        "amenity_rating": amenityRating,
        "value_rating": valueRating,
        "map_link": mapLink,
        "video": video,
        "logo": logo,
        "images": List<dynamic>.from(images.map((x) => x)),
        "gallery": List<dynamic>.from(gallery.map((x) => x)),
        "featured": featured,
        "offer": offer,
        "offer_text": offerText,
        "offer_image": offerImage,
        "broucher": broucher,
        "property_status": propertyStatusValues.reverse[propertyStatus],
        "status": status,
        "seo_title": seoTitle,
        "seo_keywords": seoKeywords,
        "seo_description": seoDescription,
        "extra_comments": extraComments,
        "location_name": locationName,
        "video_link": videoLink,
        "new_map_link": newMapLink,
        "share_url": shareUrl,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
