import 'dart:convert';

import '../../domain/models/movie_info_model.dart';
import 'genre_dto.dart';
import 'person_dto.dart';
import 'production_company_dto.dart';

class MovieInfoDto extends MovieInfoModel {
  MovieInfoDto({
    required super.id,
    super.imageFileName,
    required super.averageVote,
    required super.title,
    required super.originalTitle,
    required super.releaseYear,
    required super.duration,
    required super.genres,
    required super.description,
    required super.budget,
    required super.productionCompanies,
    required super.directors,
    required super.cast,
  });

  factory MovieInfoDto.fromModel(MovieInfoModel model) {
    // Map genre models to DTOs
    final genresAsDto = model.genres
        .map(
          (genre) => GenreDto.fromModel(genre),
        )
        .toList();

    // Map director models to DTOs
    final directorsAsDto = model.directors
        .map(
          (director) => PersonDto.fromModel(director),
        )
        .toList();

    // Map cast models to DTOs
    final castAsDto = model.cast
        .map(
          (cast) => PersonDto.fromModel(cast),
        )
        .toList();

    return MovieInfoDto(
      id: model.id,
      imageFileName: model.imageFileName,
      averageVote: model.averageVote,
      title: model.title,
      originalTitle: model.originalTitle,
      releaseYear: model.releaseYear,
      duration: model.duration,
      genres: genresAsDto,
      description: model.description,
      budget: model.budget,
      productionCompanies: model.productionCompanies,
      directors: directorsAsDto,
      cast: castAsDto,
    );
  }

  factory MovieInfoDto.fromMap(Map<String, dynamic> map) {
    // Get release year
    final releaseYear = DateTime.parse(map["release_date"]).year;

    // Get duration
    final duration = Duration(
      minutes: map["runtime"],
    );

    // Map genre to DTOs
    final genresAsDto = <GenreDto>[];
    if (map["genres"] != null) {
      for (Map<String, dynamic> genre in map["genres"]) {
        genresAsDto.add(GenreDto.fromMap(genre));
      }
    }

    // Map production companies to DTOs
    final productionCompaniesAsDto = <ProductionCompanyDto>[];
    if (map["production_companies"] != null) {
      for (Map<String, dynamic> productionCompany
          in map["production_companies"]) {
        productionCompaniesAsDto
            .add(ProductionCompanyDto.fromMap(productionCompany));
      }
    }

    // Map director to DTOs
    final directorsAsDto = <PersonDto>[];
    if (map["crew"] != null) {
      for (Map<String, dynamic> crew in map["crew"]) {
        if (crew["job"] == "Director") {
          directorsAsDto.add(PersonDto.fromMap(crew));
        }
      }
    }

    // Map cast to DTOs
    final castAsDto = <PersonDto>[];
    if (map["cast"] != null) {
      for (Map<String, dynamic> cast in map["cast"]) {
        castAsDto.add(PersonDto.fromMap(cast));
      }
    }

    return MovieInfoDto(
      id: map["id"],
      imageFileName: map["poster_path"],
      averageVote: map["vote_average"],
      title: map["title"],
      originalTitle: map["original_title"],
      releaseYear: releaseYear,
      duration: duration,
      genres: genresAsDto,
      description: map["overview"],
      budget: map["budget"],
      productionCompanies: productionCompaniesAsDto,
      directors: directorsAsDto,
      cast: castAsDto,
    );
  }

  Map<String, dynamic> toMap() {
    // Get duration in minutes
    final durationInMinutes = duration.inMinutes;

    // Map genre models to DTOs
    final genresAsMap = genres
        .map(
          (genre) => GenreDto.fromModel(genre).toMap(),
        )
        .toList();

    // Map production companies to DTOs
    final productionCompaniesAsMap = productionCompanies
        .map(
          (productionCompany) =>
              ProductionCompanyDto.fromModel(productionCompany).toMap(),
        )
        .toList();

    // Map director models to DTOs
    final directorsAsMap = directors
        .map(
          (director) => PersonDto.fromModel(director).toMap(),
        )
        .toList();

    // Map cast models to DTOs
    final castAsMap = cast
        .map(
          (cast) => PersonDto.fromModel(cast).toMap(),
        )
        .toList();

    return {
      "id": id,
      "poster_path": imageFileName,
      "vote_average": averageVote,
      "title": title,
      "original_title": originalTitle,
      "release_date": releaseYear,
      "runtime": durationInMinutes,
      "genres": genresAsMap,
      "overview": description,
      "budget": budget,
      "production_companies": productionCompaniesAsMap,
      "directors": directorsAsMap,
      "cast": castAsMap,
    };
  }

  factory MovieInfoDto.fromJson(String source) {
    return MovieInfoDto.fromMap(json.decode(source));
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() => toJson();
}
