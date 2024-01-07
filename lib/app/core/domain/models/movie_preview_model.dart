import 'package:equatable/equatable.dart';

import 'genre_model.dart';

class MoviePreviewModel extends Equatable {
  const MoviePreviewModel({
    required this.id,
    this.imageFileName,
    required this.title,
    required this.genres,
  });

  final int id;
  final String? imageFileName;
  final String title;
  final List<GenreModel> genres;

  MoviePreviewModel copyWith({
    int? id,
    String? imageFileName,
    String? title,
    List<GenreModel>? genres,
  }) {
    return MoviePreviewModel(
      id: id ?? this.id,
      imageFileName: imageFileName ?? this.imageFileName,
      title: title ?? this.title,
      genres: genres ?? this.genres,
    );
  }

  @override
  List<Object?> get props => [
        id,
        imageFileName,
        title,
        genres,
      ];
}
