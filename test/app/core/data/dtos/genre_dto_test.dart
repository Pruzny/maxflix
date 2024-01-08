import 'package:flutter_test/flutter_test.dart';
import 'package:maxflix/app/core/data/dtos/genre_dto.dart';
import 'package:maxflix/app/core/domain/models/genre_model.dart';

void main() {
  group("GenreDto", () {
    group("fromModel", () {
      test(
        "should return a valid dto when the model has a valid data",
        () async {
          // Arrange
          const model = GenreModel(
            id: 28,
            name: "Action",
          );
          const dto = GenreDto(
            id: 28,
            name: "Action",
          );

          // Act
          final result = GenreDto.fromModel(model);

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
            "id": 28,
            "name": "Action",
          };
          const dto = GenreDto(
            id: 28,
            name: "Action",
          );

          // Act
          final result = GenreDto.fromMap(map);

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
        "should return a map containing the proper data",
        () async {
          // Arrange
          const map = {
            "id": 28,
            "name": "Action",
          };

          // Act
          final result = const GenreDto(
            id: 28,
            name: "Action",
          ).toMap();

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
        "should return a valid dto when the JSON has a valid data",
        () async {
          // Arrange
          const json = """{"id":28,"name":"Action"}""";
          const dto = GenreDto(
            id: 28,
            name: "Action",
          );

          // Act
          final result = GenreDto.fromJson(json);

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
        "should return a JSON containing the proper data",
        () async {
          // Arrange
          const json = """{"id":28,"name":"Action"}""";

          // Act
          final result = const GenreDto(
            id: 28,
            name: "Action",
          ).toJson();

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
