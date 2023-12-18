import 'genre_model.dart';

class MoviePreviewModel {
  MoviePreviewModel({
    required this.id,
    this.imageFileName,
    required this.title,
    required this.genres,
  });

  int id;
  String? imageFileName;
  String title;
  List<GenreModel> genres;
}
