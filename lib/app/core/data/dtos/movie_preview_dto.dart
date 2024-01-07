import 'dart:convert';

import '../../domain/models/movie_preview_model.dart';
import 'genre_dto.dart';

class MoviePreviewDto extends MoviePreviewModel {
  const MoviePreviewDto({
    required super.id,
    super.imageFileName,
    required super.title,
    required super.genres,
    this.genreIds = const [],
  });

  final List<int> genreIds;

  factory MoviePreviewDto.fromModel(MoviePreviewModel model) {
    // Map genre models to DTOs
    final genresAsDto = model.genres
        .map(
          (genre) => GenreDto.fromModel(genre),
        )
        .toList();

    // Get genre IDs from models
    final genreIds = genresAsDto.map((genre) => genre.id).toList();

    return MoviePreviewDto(
      id: model.id,
      imageFileName: model.imageFileName,
      title: model.title,
      genres: genresAsDto,
      genreIds: genreIds,
    );
  }

  factory MoviePreviewDto.fromMap(Map<String, dynamic> map) {
    // Map genre to DTOs
    final genresAsDto = <GenreDto>[];
    if (map["genres"] != null) {
      for (Map<String, dynamic> genre in map["genres"]) {
        genresAsDto.add(GenreDto.fromMap(genre));
      }
    }

    // Map genre IDs
    final genreIds = <int>[];
    if (map["genre_ids"] != null) {
      for (int genreId in map["genre_ids"]) {
        genreIds.add(genreId);
      }
    }

    return MoviePreviewDto(
      id: map["id"],
      imageFileName: map["poster_path"],
      title: map["title"],
      genres: genresAsDto,
      genreIds: genreIds,
    );
  }

  Map<String, dynamic> toMap() {
    // Map genre models to DTOs
    final genresAsMap = genres
        .map(
          (genre) => GenreDto.fromModel(genre).toMap(),
        )
        .toList();

    return {
      "id": id,
      "poster_path": imageFileName,
      "title": title,
      "genre_ids": genresAsMap,
    };
  }

  factory MoviePreviewDto.fromJson(String source) {
    return MoviePreviewDto.fromMap(json.decode(source));
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() => toJson();
}
