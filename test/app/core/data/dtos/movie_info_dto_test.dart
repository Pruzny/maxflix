import 'package:flutter_test/flutter_test.dart';
import 'package:maxflix/app/core/data/dtos/genre_dto.dart';
import 'package:maxflix/app/core/data/dtos/movie_info_dto.dart';
import 'package:maxflix/app/core/data/dtos/person_dto.dart';
import 'package:maxflix/app/core/data/dtos/production_company_dto.dart';
import 'package:maxflix/app/core/domain/models/genre_model.dart';
import 'package:maxflix/app/core/domain/models/movie_info_model.dart';
import 'package:maxflix/app/core/domain/models/person_model.dart';
import 'package:maxflix/app/core/domain/models/production_company_model.dart';

void main() {
  group("MovieInfoDto", () {
    group("fromModel", () {
      test(
        "should return a valid dto when the model has a valid data",
        () async {
          // Arrange
          const model = MovieInfoModel(
            id: 920,
            imageFileName: "/abW5AzHDaIK1n9C36VdAeOwORRA.jpg",
            averageVote: 6.8,
            title: "Cars",
            originalTitle: "Cars",
            releaseYear: 2006,
            duration: Duration(minutes: 117),
            genres: [
              GenreModel(id: 16, name: "Animation"),
              GenreModel(id: 12, name: "Adventure"),
            ],
            description: "Lightning McQueen...",
            budget: 120000000,
            productionCompanies: [
              ProductionCompanyModel(id: 3, name: "Pixar Animation Studios"),
              ProductionCompanyModel(id: 130, name: "Walt Disney Pictures"),
            ],
            cast: [
              PersonModel(id: 5292, name: "Owen Wilson"),
              PersonModel(id: 3223, name: "Paul Newman"),
            ],
            directors: [
              PersonModel(id: 12899, name: "John Lasseter"),
              PersonModel(id: 12902, name: "Joe Ranft"),
            ],
          );
          const dto = MovieInfoDto(
            id: 920,
            imageFileName: "/abW5AzHDaIK1n9C36VdAeOwORRA.jpg",
            averageVote: 6.8,
            title: "Cars",
            originalTitle: "Cars",
            releaseYear: 2006,
            duration: Duration(minutes: 117),
            genres: [
              GenreDto(id: 16, name: "Animation"),
              GenreDto(id: 12, name: "Adventure"),
            ],
            description: "Lightning McQueen...",
            budget: 120000000,
            productionCompanies: [
              ProductionCompanyDto(id: 3, name: "Pixar Animation Studios"),
              ProductionCompanyDto(id: 130, name: "Walt Disney Pictures"),
            ],
            cast: [
              PersonDto(id: 5292, name: "Owen Wilson"),
              PersonDto(id: 3223, name: "Paul Newman"),
            ],
            directors: [
              PersonDto(id: 12899, name: "John Lasseter"),
              PersonDto(id: 12902, name: "Joe Ranft"),
            ],
          );

          // Act
          final result = MovieInfoDto.fromModel(model);

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
            "vote_average": 6.8,
            "title": "Cars",
            "original_title": "Cars",
            "release_date": "2006-06-08",
            "runtime": 117,
            "genres": [
              {"id": 16, "name": "Animation"},
              {"id": 12, "name": "Adventure"},
            ],
            "overview": "Lightning McQueen...",
            "budget": 120000000,
            "cast": [
              {"id": 5292, "name": "Owen Wilson"},
              {"id": 3223, "name": "Paul Newman"},
            ],
            "crew": [
              {"id": 12899, "name": "John Lasseter", "job": "Director"},
              {"id": 12902, "name": "Joe Ranft", "job": "Screenplay"}
            ],
            "production_companies": [
              {"id": 3, "name": "Pixar Animation Studios"},
              {"id": 130, "name": "Walt Disney Pictures"},
            ],
          };
          const dto = MovieInfoDto(
            id: 920,
            imageFileName: "/abW5AzHDaIK1n9C36VdAeOwORRA.jpg",
            averageVote: 6.8,
            title: "Cars",
            originalTitle: "Cars",
            releaseYear: 2006,
            duration: Duration(minutes: 117),
            genres: [
              GenreDto(id: 16, name: "Animation"),
              GenreDto(id: 12, name: "Adventure"),
            ],
            description: "Lightning McQueen...",
            budget: 120000000,
            productionCompanies: [
              ProductionCompanyDto(id: 3, name: "Pixar Animation Studios"),
              ProductionCompanyDto(id: 130, name: "Walt Disney Pictures"),
            ],
            directors: [
              PersonDto(id: 12899, name: "John Lasseter"),
            ],
            cast: [
              PersonDto(id: 5292, name: "Owen Wilson"),
              PersonDto(id: 3223, name: "Paul Newman"),
            ],
          );

          // Act
          final result = MovieInfoDto.fromMap(map);

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
          const dto = MovieInfoDto(
            id: 920,
            imageFileName: "/abW5AzHDaIK1n9C36VdAeOwORRA.jpg",
            averageVote: 6.8,
            title: "Cars",
            originalTitle: "Cars",
            releaseYear: 2006,
            duration: Duration(minutes: 117),
            genres: [
              GenreDto(id: 16, name: "Animation"),
              GenreDto(id: 12, name: "Adventure"),
            ],
            description: "Lightning McQueen...",
            budget: 120000000,
            productionCompanies: [
              ProductionCompanyDto(id: 3, name: "Pixar Animation Studios"),
              ProductionCompanyDto(id: 130, name: "Walt Disney Pictures"),
            ],
            directors: [
              PersonDto(id: 12899, name: "John Lasseter"),
            ],
            cast: [
              PersonDto(id: 5292, name: "Owen Wilson"),
              PersonDto(id: 3223, name: "Paul Newman"),
            ],
          );
          const map = {
            "id": 920,
            "poster_path": "/abW5AzHDaIK1n9C36VdAeOwORRA.jpg",
            "vote_average": 6.8,
            "title": "Cars",
            "original_title": "Cars",
            "release_date": 2006,
            "runtime": 117,
            "genres": [
              {"id": 16, "name": "Animation"},
              {"id": 12, "name": "Adventure"},
            ],
            "overview": "Lightning McQueen...",
            "budget": 120000000,
            "production_companies": [
              {"id": 3, "name": "Pixar Animation Studios"},
              {"id": 130, "name": "Walt Disney Pictures"},
            ],
            "directors": [
              {"id": 12899, "name": "John Lasseter"},
            ],
            "cast": [
              {"id": 5292, "name": "Owen Wilson"},
              {"id": 3223, "name": "Paul Newman"},
            ],
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
          const json = """
          {"id":920,"poster_path":"/abW5AzHDaIK1n9C36VdAeOwORRA.jpg","vote_average":6.8,"title":"Cars","original_title":"Cars","release_date":"2006-06-08","runtime":117,"genres":[{"id":16,"name":"Animation"},{"id":12,"name":"Adventure"}],"overview":"Lightning McQueen...","budget":120000000,"cast":[{"id":5292,"name":"Owen Wilson"},{"id":3223,"name":"Paul Newman"}],"crew":[{"id":12899,"name":"John Lasseter","job":"Director"},{"id":12902,"name":"Joe Ranft","job":"Screenplay"}],"production_companies":[{"id":3,"name":"Pixar Animation Studios"},{"id":130,"name":"Walt Disney Pictures"}]}""";
          const dto = MovieInfoDto(
            id: 920,
            imageFileName: "/abW5AzHDaIK1n9C36VdAeOwORRA.jpg",
            averageVote: 6.8,
            title: "Cars",
            originalTitle: "Cars",
            releaseYear: 2006,
            duration: Duration(minutes: 117),
            genres: [
              GenreDto(id: 16, name: "Animation"),
              GenreDto(id: 12, name: "Adventure"),
            ],
            description: "Lightning McQueen...",
            budget: 120000000,
            productionCompanies: [
              ProductionCompanyDto(id: 3, name: "Pixar Animation Studios"),
              ProductionCompanyDto(id: 130, name: "Walt Disney Pictures"),
            ],
            directors: [
              PersonDto(id: 12899, name: "John Lasseter"),
            ],
            cast: [
              PersonDto(id: 5292, name: "Owen Wilson"),
              PersonDto(id: 3223, name: "Paul Newman"),
            ],
          );

          // Act
          final result = MovieInfoDto.fromJson(json);

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
          const dto = MovieInfoDto(
            id: 920,
            imageFileName: "/abW5AzHDaIK1n9C36VdAeOwORRA.jpg",
            averageVote: 6.8,
            title: "Cars",
            originalTitle: "Cars",
            releaseYear: 2006,
            duration: Duration(minutes: 117),
            genres: [
              GenreDto(id: 16, name: "Animation"),
              GenreDto(id: 12, name: "Adventure"),
            ],
            description: "Lightning McQueen...",
            budget: 120000000,
            productionCompanies: [
              ProductionCompanyDto(id: 3, name: "Pixar Animation Studios"),
              ProductionCompanyDto(id: 130, name: "Walt Disney Pictures"),
            ],
            directors: [
              PersonDto(id: 12899, name: "John Lasseter"),
            ],
            cast: [
              PersonDto(id: 5292, name: "Owen Wilson"),
              PersonDto(id: 3223, name: "Paul Newman"),
            ],
          );
          const json =
              """{"id":920,"poster_path":"/abW5AzHDaIK1n9C36VdAeOwORRA.jpg","vote_average":6.8,"title":"Cars","original_title":"Cars","release_date":2006,"runtime":117,"genres":[{"id":16,"name":"Animation"},{"id":12,"name":"Adventure"}],"overview":"Lightning McQueen...","budget":120000000,"production_companies":[{"id":3,"name":"Pixar Animation Studios"},{"id":130,"name":"Walt Disney Pictures"}],"directors":[{"id":12899,"name":"John Lasseter"}],"cast":[{"id":5292,"name":"Owen Wilson"},{"id":3223,"name":"Paul Newman"}]}""";

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
