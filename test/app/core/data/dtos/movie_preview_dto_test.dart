import 'package:flutter_test/flutter_test.dart';
import 'package:maxflix/app/core/data/dtos/genre_dto.dart';
import 'package:maxflix/app/core/data/dtos/movie_preview_dto.dart';
import 'package:maxflix/app/core/domain/models/genre_model.dart';
import 'package:maxflix/app/core/domain/models/movie_preview_model.dart';

void main() {
  group("MoviePreviewDto", () {
    group("fromModel", () {
      test(
        "should return a valid dto when the model has a valid data",
        () async {
          // Arrange
          const model = MoviePreviewModel(
            id: 920,
            imageFileName: "/abW5AzHDaIK1n9C36VdAeOwORRA.jpg",
            title: "Cars",
            genres: [
              GenreModel(id: 16, name: "Animation"),
              GenreModel(id: 12, name: "Adventure"),
              GenreModel(id: 35, name: "Comedy"),
              GenreModel(id: 10751, name: "Family"),
            ],
          );
          const dto = MoviePreviewDto(
            id: 920,
            imageFileName: "/abW5AzHDaIK1n9C36VdAeOwORRA.jpg",
            title: "Cars",
            genres: [
              GenreDto(id: 16, name: "Animation"),
              GenreDto(id: 12, name: "Adventure"),
              GenreDto(id: 35, name: "Comedy"),
              GenreDto(id: 10751, name: "Family"),
            ],
          );

          // Act
          final result = MoviePreviewDto.fromModel(model);

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
            "id": 920,
            "poster_path": "/abW5AzHDaIK1n9C36VdAeOwORRA.jpg",
            "title": "Cars",
            "genre_ids": [16, 12, 35, 10751],
          };
          const dto = MoviePreviewDto(
            id: 920,
            imageFileName: "/abW5AzHDaIK1n9C36VdAeOwORRA.jpg",
            title: "Cars",
            genres: [],
            genreIds: [16, 12, 35, 10751],
          );

          // Act
          final result = MoviePreviewDto.fromMap(map);

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
          const dto = MoviePreviewDto(
            id: 920,
            imageFileName: "/abW5AzHDaIK1n9C36VdAeOwORRA.jpg",
            title: "Cars",
            genres: [
              GenreDto(id: 16, name: "Animation"),
              GenreDto(id: 12, name: "Adventure"),
              GenreDto(id: 35, name: "Comedy"),
              GenreDto(id: 10751, name: "Family"),
            ],
            genreIds: [16, 12, 35, 10751],
          );
          const map = {
            "id": 920,
            "poster_path": "/abW5AzHDaIK1n9C36VdAeOwORRA.jpg",
            "title": "Cars",
            "genres": [
              {"id": 16, "name": "Animation"},
              {"id": 12, "name": "Adventure"},
              {"id": 35, "name": "Comedy"},
              {"id": 10751, "name": "Family"},
            ],
            "genre_ids": [16, 12, 35, 10751],
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
          const json =
              """{"id":920,"title":"Cars","poster_path":"/abW5AzHDaIK1n9C36VdAeOwORRA.jpg","genre_ids":[16,12,35,10751]}""";
          const dto = MoviePreviewDto(
            id: 920,
            title: "Cars",
            imageFileName: "/abW5AzHDaIK1n9C36VdAeOwORRA.jpg",
            genres: [],
            genreIds: [16, 12, 35, 10751],
          );

          // Act
          final result = MoviePreviewDto.fromJson(json);

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
          const dto = MoviePreviewDto(
            id: 920,
            imageFileName: "/abW5AzHDaIK1n9C36VdAeOwORRA.jpg",
            title: "Cars",
            genres: [
              GenreDto(id: 16, name: "Animation"),
              GenreDto(id: 12, name: "Adventure"),
              GenreDto(id: 35, name: "Comedy"),
              GenreDto(id: 10751, name: "Family"),
            ],
            genreIds: [16, 12, 35, 10751],
          );
          const json =
              """{"id":920,"poster_path":"/abW5AzHDaIK1n9C36VdAeOwORRA.jpg","title":"Cars","genres":[{"id":16,"name":"Animation"},{"id":12,"name":"Adventure"},{"id":35,"name":"Comedy"},{"id":10751,"name":"Family"}],"genre_ids":[16,12,35,10751]}""";

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
