import 'package:equatable/equatable.dart';

import 'genre_model.dart';
import 'person_model.dart';
import 'production_company_model.dart';

class MovieInfoModel extends Equatable {
  const MovieInfoModel({
    required this.id,
    this.imageFileName,
    required this.averageVote,
    required this.title,
    required this.originalTitle,
    required this.releaseYear,
    required this.duration,
    required this.genres,
    required this.description,
    required this.budget,
    required this.productionCompanies,
    required this.directors,
    required this.cast,
  });

  final int id;
  final String? imageFileName;
  final double averageVote;
  final String title;
  final String originalTitle;
  final int releaseYear;
  final Duration duration;
  final List<GenreModel> genres;
  final String description;
  final int budget;
  final List<ProductionCompanyModel> productionCompanies;
  final List<PersonModel> directors;
  final List<PersonModel> cast;

  MovieInfoModel copyWith({
    int? id,
    String? imageFileName,
    double? averageVote,
    String? title,
    String? originalTitle,
    int? releaseYear,
    Duration? duration,
    List<GenreModel>? genres,
    String? description,
    int? budget,
    List<ProductionCompanyModel>? productionCompanies,
    List<PersonModel>? directors,
    List<PersonModel>? cast,
  }) {
    return MovieInfoModel(
      id: id ?? this.id,
      imageFileName: imageFileName ?? this.imageFileName,
      averageVote: averageVote ?? this.averageVote,
      title: title ?? this.title,
      originalTitle: originalTitle ?? this.originalTitle,
      releaseYear: releaseYear ?? this.releaseYear,
      duration: duration ?? this.duration,
      genres: genres ?? this.genres,
      description: description ?? this.description,
      budget: budget ?? this.budget,
      productionCompanies: productionCompanies ?? this.productionCompanies,
      directors: directors ?? this.directors,
      cast: cast ?? this.cast,
    );
  }

  @override
  List<Object?> get props => [
        id,
        imageFileName,
        averageVote,
        title,
        originalTitle,
        releaseYear,
        duration,
        genres,
        description,
        budget,
        productionCompanies,
        directors,
        cast,
      ];
}
