// To parse this JSON data, do
//
//     final propByLocResponse = propByLocResponseFromJson(jsonString);

import 'dart:convert';

PropByLocResponse propByLocResponseFromJson(String str) => PropByLocResponse.fromJson(json.decode(str));

String propByLocResponseToJson(PropByLocResponse data) => json.encode(data.toJson());

class PropByLocResponse {
    String status;
    String message;
    List<Datum> data;

    PropByLocResponse({
        required this.status,
        required this.message,
        required this.data,
    });

    factory PropByLocResponse.fromJson(Map<String, dynamic> json) => PropByLocResponse(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    String id;
    String categoryId;
    String slug;
    String locationId;
    String name;
    String address;
    List<PropertyType> propertyType;
    String description;
    List<PropertyType?> amenities;
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
    String propertyStatus;
    String status;
    String seoTitle;
    String seoKeywords;
    String seoDescription;
    dynamic extraComments;
    String locationName;
    String videoLink;
    String newMapLink;
    String shareUrl;

    Datum({
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

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        categoryId: json["category_id"],
        slug: json["slug"],
        locationId: json["location_id"],
        name: json["name"],
        address: json["address"],
        propertyType: List<PropertyType>.from(json["property_type"].map((x) => PropertyType.fromJson(x))),
        description: json["description"],
        amenities: List<PropertyType?>.from(json["amenities"].map((x) => x == null ? null : PropertyType.fromJson(x))),
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
        propertyStatus: json["property_status"],
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
        "property_status": propertyStatus,
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

class PropertyType {
    String id;
    String name;
    String status;
    String? slug;

    PropertyType({
        required this.id,
        required this.name,
        required this.status,
        this.slug,
    });

    factory PropertyType.fromJson(Map<String, dynamic> json) => PropertyType(
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
