import 'dart:convert';

import 'package:hive/hive.dart';

part 'news.g.dart';

/*@HiveType(typeId: 0)
class News {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final String country;
  @HiveField(4)
  final String url;

  News({
    required this.id,
    required this.name,
    required this.description,
    required this.country,
    required this.url,
  });

  News copyWith({
    String? id,
    String? name,
    String? description,
    String? country,
    String? url,
  }) {
    return News(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      country: country ?? this.country,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'country': country,
      'url': url,
    };
  }

  factory News.fromMap(Map<String, dynamic> map) {
    return News(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      country: map['country'],
      url: map['url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory News.fromJson(String source) => News.fromMap(json.decode(source));

  @override
  String toString() {
    return 'News(id: $id, name: $name, description: $description, country: $country, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is News &&
        other.id == id &&
        other.name == name &&
        other.description == description &&
        other.country == country &&
        other.url == url;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        country.hashCode ^
        url.hashCode;
  }
}*/


@HiveType(typeId: 0)
class News {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final String country;
  @HiveField(4)
  final String url;

  News({
    required this.id,
    required this.name,
    required this.description,
    required this.country,
    required this.url,
  });

  News copyWith({
    String? id,
    String? name,
    String? description,
    String? country,
    String? url,
  }) {
    return News(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      country: country ?? this.country,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'country': country,
      'url': url,
    };
  }

  factory News.fromMap(Map<String, dynamic> map) {
    return News(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      country: map['country'],
      url: map['url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory News.fromJson(String source) => News.fromMap(json.decode(source));

  @override
  String toString() {
    return 'News(id: $id, name: $name, description: $description, country: $country, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is News &&
        other.id == id &&
        other.name == name &&
        other.description == description &&
        other.country == country &&
        other.url == url;
  }

  @override
  int get hashCode {
    return id.hashCode ^
    name.hashCode ^
    description.hashCode ^
    country.hashCode ^
    url.hashCode;
  }
}