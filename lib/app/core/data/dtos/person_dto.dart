import 'dart:convert';

import '../../domain/models/person_model.dart';

class PersonDto extends PersonModel {
  const PersonDto({
    required super.id,
    required super.name,
  });

  factory PersonDto.fromModel(PersonModel model) {
    return PersonDto(
      id: model.id,
      name: model.name,
    );
  }

  factory PersonDto.fromMap(Map<String, dynamic> map) {
    return PersonDto(
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

  factory PersonDto.fromJson(String source) {
    return PersonDto.fromMap(json.decode(source));
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() => toJson();
}
