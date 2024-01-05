import 'dart:convert';

import '../../domain/models/genre_model.dart';

class GenreDto extends GenreModel {
  GenreDto({
    required super.id,
    required super.name,
  });

  factory GenreDto.fromModel(GenreModel model) {
    return GenreDto(
      id: model.id,
      name: model.name,
    );
  }

  factory GenreDto.fromMap(Map<String, dynamic> map) {
    return GenreDto(
      id: map["id"],
      name: map["name"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
    };
  }

  factory GenreDto.fromJson(String source) {
    return GenreDto.fromMap(json.decode(source));
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() => toJson();
}
