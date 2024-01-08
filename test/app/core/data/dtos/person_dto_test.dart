import 'package:flutter_test/flutter_test.dart';
import 'package:maxflix/app/core/data/dtos/person_dto.dart';
import 'package:maxflix/app/core/domain/models/person_model.dart';

void main() {
  group("PersonDto", () {
    group("fromModel", () {
      test(
        "should return a valid dto when the model has a valid data",
        () async {
          // Arrange
          const model = PersonModel(
            id: 1,
            name: "Person",
          );
          const dto = PersonDto(
            id: 1,
            name: "Person",
          );

          // Act
          final result = PersonDto.fromModel(model);

          // Assert
          expect(
            result,
            dto,
          );
        },
      );
    });

    group("fromMap", () {
      test(
        "should return a valid dto when the map has a valid data",
        () async {
          // Arrange
          const map = {
            "id": 1,
            "name": "Person",
          };
          const dto = PersonDto(
            id: 1,
            name: "Person",
          );

          // Act
          final result = PersonDto.fromMap(map);

          // Assert
          expect(
            result,
            dto,
          );
        },
      );
    });

    group("toMap", () {
      test(
        "should return a valid map when the dto has a valid data",
        () async {
          // Arrange
          const dto = PersonDto(
            id: 1,
            name: "Person",
          );
          const map = {
            "id": 1,
            "name": "Person",
          };

          // Act
          final result = dto.toMap();

          // Assert
          expect(
            result,
            map,
          );
        },
      );
    });

    group("fromJson", () {
      test(
        "should return a valid dto when the json has a valid data",
        () async {
          // Arrange
          const json = """{"id": 1,"name":"Person"}""";
          const dto = PersonDto(
            id: 1,
            name: "Person",
          );

          // Act
          final result = PersonDto.fromJson(json);

          // Assert
          expect(
            result,
            dto,
          );
        },
      );
    });

    group("toJson", () {
      test(
        "should return a valid json when the dto has a valid data",
        () async {
          // Arrange
          const dto = PersonDto(
            id: 1,
            name: "Person",
          );
          const json = """{"id":1,"name":"Person"}""";

          // Act
          final result = dto.toJson();

          // Assert
          expect(
            result,
            json,
          );
        },
      );
    });
  });
}
