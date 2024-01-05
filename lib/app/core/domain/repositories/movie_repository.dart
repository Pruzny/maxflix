import '../models/genre_model.dart';
import '../models/movie_info_model.dart';
import '../models/movie_preview_model.dart';

abstract class MovieRepository {
  Future<List<MoviePreviewModel>> getMovies({
    int page,
    String language,
    List<GenreModel> withGenres,
    List<GenreModel> withoutGenres,
  });

  Future<List<MoviePreviewModel>> getMoviesByName({
    int page,
    String language,
    required String query,
  });

  Future<MovieInfoModel> getMovieDetails({
    required int id,
    String language,
  });
}
