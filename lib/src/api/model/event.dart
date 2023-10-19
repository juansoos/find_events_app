import 'dart:io';

import 'package:intl/intl.dart';

class Event {
  late String type;
  late int id;
  late String datetimeUtc;
  late Venue venue;
  late double score;
  late String createdAt;
  late String title;
  late List<Performers> performers;
  late String description;
  late String status;

  Event({
    required this.type,
    required this.id,
    required this.datetimeUtc,
    required this.venue,
    required this.score,
    required this.createdAt,
    required this.title,
    required this.description,
    required this.status,
    required this.performers,
  });

  Event.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    id = json['id'];
    datetimeUtc = DateFormat('dd MMM yyyy hh:mm a', Platform.localeName).format(
      DateTime.parse(json['datetime_utc']),
    );
    venue = Venue.fromJson(json['venue']);
    performers = <Performers>[];
    json['performers'].forEach((v) {
      return performers.add(Performers.fromJson(v));
    });
    score = json['score'];
    createdAt = json['created_at'];

    title = json['title'];
    description = json['description'];
    status = json['status'];
  }
}

class Venue {
  late String state;
  late String nameV2;
  late String postalCode;
  late String name;
  late double score;
  late String url;
  late Location location;
  late String address;
  late String country;
  late String city;
  late int id;

  Venue({
    required this.state,
    required this.nameV2,
    required this.postalCode,
    required this.name,
    required this.url,
    required this.score,
    required this.location,
    required this.address,
    required this.country,
    required this.city,
    required this.id,
  });

  Venue.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    nameV2 = json['name_v2'];
    postalCode = json['postal_code'];
    name = json['name'];
    url = json['url'];
    score = json['score'];
    location = Location.fromJson(json['location']);
    address = json['address'];
    country = json['country'];
    city = json['city'];
    id = json['id'];
  }
}

class Performers {
  late String name;
  late String? image;
  late Images? images;

  Performers.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    images = json['images'] != null ? Images.fromJson(json['images']) : null;
  }
}

class Images {
  String? huge;

  Images({this.huge});

  Images.fromJson(Map<String, dynamic> json) {
    huge = json['huge'];
  }
}

class Location {
  double? lat;
  double? lon;

  Location({this.lat, this.lon});

  Location.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lon = json['lon'];
  }
}
