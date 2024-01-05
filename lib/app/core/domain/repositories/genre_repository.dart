import '../models/genre_model.dart';

abstract class GenreRepository {
  Future<List<GenreModel>> getGenres({
    String language,
  });
}
