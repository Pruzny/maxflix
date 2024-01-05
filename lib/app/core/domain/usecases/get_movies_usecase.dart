import '../../constants.dart';
import '../models/movie_preview_model.dart';
import '../repositories/movie_repository.dart';

class GetMoviesUsecase {
  GetMoviesUsecase({
    required MovieRepository repository,
  }) : _repository = repository;

  final MovieRepository _repository;

  Future<List<MoviePreviewModel>> call({
    int page = 1,
    String language = Constants.defaultLocaleTag,
    List<int> withGenres = const [],
    List<int> withoutGenres = const [],
  }) async {
    return _repository.getMovies();
  }
}
