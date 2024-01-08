import 'package:flutter_test/flutter_test.dart';
import 'package:maxflix/app/core/data/dtos/production_company_dto.dart';
import 'package:maxflix/app/core/domain/models/production_company_model.dart';

void main() {
  group("ProductionCompanyDto", () {
    group("fromModel", () {
      test(
        "should return a valid dto when the model has a valid data",
        () async {
          // Arrange
          const model = ProductionCompanyModel(
            id: 1,
            name: "Company",
          );
          const dto = ProductionCompanyDto(
            id: 1,
            name: "Company",
          );

          // Act
          final result = ProductionCompanyDto.fromModel(model);

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
            "name": "Company",
          };
          const dto = ProductionCompanyDto(
            id: 1,
            name: "Company",
          );

          // Act
          final result = ProductionCompanyDto.fromMap(map);

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
          const dto = ProductionCompanyDto(
            id: 1,
            name: "Company",
          );
          const map = {
            "id": 1,
            "name": "Company",
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
          const json = """{"id":1,"name":"Company"}""";
          const dto = ProductionCompanyDto(
            id: 1,
            name: "Company",
          );

          // Act
          final result = ProductionCompanyDto.fromJson(json);

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
          const dto = ProductionCompanyDto(
            id: 1,
            name: "Company",
          );
          const json = """{"id":1,"name":"Company"}""";

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
